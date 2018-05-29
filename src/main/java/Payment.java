import DBMain.readIni;
import Objects.Serviceprovider;
import Objects.User;
import com.squareup.okhttp.*;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.IOException;
import java.sql.SQLException;


/**
 * Created by DR on 27.08.2017.
 */
public class Payment {
    public static String CreateSeller(String spid) throws IOException {

        readIni rIni = new readIni();
        String[] ss = rIni.run("options.ini");
        String market_fee = ss[6];
        String createsellerurl = ss[7];
        String paymeclient = ss[12];
        String res="-1";
        //Client client = ClientBuilder.newClient();
        String sql="SELECT name as seller_first_name, name as seller_last_name, name as seller_merchant_name, " +
                "description as seller_description, BN as seller_inc_code, BNID as seller_social_id, bankid as seller_bank_code," +
                "bankbranch as seller_bank_branch, bankaccount as seller_bank_account_number, 0 as seller_gender,2 as seller_inc," +
                "2000 as seller_person_business_type,'01/01/2000' as seller_birthdate,'01/01/2000' as seller_social_id_issued," +
                "'None' as seller_address_street, 0 as seller_address_street_number,'None' as seller_site_url,'IL' as seller_address_country," +
                "file_social_id as seller_file_social_id, file_cheque as seller_file_cheque, file_corporate as seller_file_corporate," +
                "address as seller_address_city,email as seller_email, phone as seller_phone, sellerid as seller_id FROM sproviders WHERE id="+spid;

        String jstr=User.jsonrs(sql,"");
        //jstr= jstr.replace('"', '\'');
        //System.out.println(jstr);
        if (jstr.length()>7) {     // Select is not empty
            OkHttpClient client = new OkHttpClient();
            MediaType mediaType = MediaType.parse("application/json");
            String jsonrequest = "{\r\n  \"payme_client_key\": \""+paymeclient+"\",\r\n " +
                    jstr.substring(jstr.indexOf("[") + 2, jstr.length() - 3) + ",\"market_fee\": " + market_fee + "}";
            RequestBody body = RequestBody.create(mediaType, jsonrequest);
           // System.out.println(jsonrequest);

            Request request = new Request.Builder()
                    .url(createsellerurl)
                    .post(body)
                    .addHeader("Content-Type", "application/json")
                    .addHeader("Cache-Control", "no-cache")
                    .build();

            Response response = client.newCall(request).execute();

            if (response.code() == 200) {
                try {
                    JSONParser parser = new JSONParser();
                    Object obj = parser.parse(response.body().string());
                    JSONObject jsonObj = (JSONObject) obj;
                    res = String.valueOf(jsonObj.get("seller_payme_id"));
                    Serviceprovider.SetSellerID(Integer.valueOf(spid), String.valueOf(jsonObj.get("seller_id")),
                            String.valueOf(jsonObj.get("seller_payme_secret")),String.valueOf(jsonObj.get("seller_payme_id")));
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            } else {
                res= response.body().string();
                System.out.println(res);
            }
        } else {
            res= "-2";
        }
        return res;
    }
    public static String GenerateSale(String uid, String spid, String serviceid, String callid) throws IOException {
        readIni rIni = new readIni();
        String[] ss = rIni.run("options.ini");
        String generatesaleurl = ss[8];
        String callbackurl = ss[10];
        String successfullurl = ss[11];
        String res = "-1";
        String paymeid = Serviceprovider.GetSellerPaymeID(spid);
        String trid = Serviceprovider.GetTransID();
        if (!(paymeid.isEmpty())) {
            String sql = "SELECT '"+callbackurl+"' as sale_callback_url,'" +successfullurl
                    +"' as sale_return_url,servicetype.name as product_name, " +
                    " price*100 as sale_price,'ILS' as currency,1 as installments,0 as capture_buyer" +
                    " from spservices,servicetype WHERE spservices.serviceid=servicetype.id AND spid="+spid+" AND serviceid="+serviceid+";";
            //System.out.println(sql);
            String jstr=User.jsonrs(sql,"");
            if (jstr.length()>7) {     // Select is not empty
                String jsonrequest = "{\"seller_payme_id\" :\""+paymeid+"\",\"transaction_id\" :"+trid+","+
                        "\"sale_type\": \"authorize\","
                        +jstr.substring(jstr.indexOf("[") + 2, jstr.length() - 3) + "}";
                //System.out.println(jsonrequest);

                OkHttpClient client = new OkHttpClient();
                MediaType mediaType = MediaType.parse("application/json");
                RequestBody body = RequestBody.create(mediaType, jsonrequest);
                Request request = new Request.Builder()
                        .url(generatesaleurl)
                        .post(body)
                        .addHeader("Content-Type", "application/json")
                        .addHeader("Cache-Control", "no-cache")
                        //.addHeader("Postman-Token", "8cb0d7bc-660b-40c0-953a-38bab9d7ce1f")
                        .build();

                Response response = client.newCall(request).execute();
                if (response.code() == 200) {
                    try {
                        JSONParser parser = new JSONParser();
                        Object obj = parser.parse(response.body().string());
                        JSONObject jsonObj = (JSONObject) obj;
                        res = String.valueOf(jsonObj.get("sale_url"));
                        String price = String.valueOf(jsonObj.get("price"));
                        String paymetrid = String.valueOf(jsonObj.get("payme_sale_id"));
                        String payid="";
                        try {
                            payid=User.AddNewPayment(spid,uid, Float.valueOf(price)/100,res,paymetrid,callid);
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                        res= "{\"sale_url\":\""+String.valueOf(jsonObj.get("sale_url"))+"\",\"mobicar_server_pay_id\":"+payid+
                                ",\"payme_sale_id\":"+paymetrid+"\",\"mobicar_call_id\":"+callid+"\"}";
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                } else {
                    res= response.body().string();
                    //System.out.println(res);
                }
            }
        }
        return res;
    }

    public static String CaptureSale(String paymesaleid, String amount) throws IOException {
        readIni rIni = new readIni();
        String[] ss = rIni.run("options.ini");
        String capturesaleurl = ss[13];
        String res ="";

        String jsonrequest = "{\"payme_sale_id\" :\""+paymesaleid+"\"";
        if (amount.equalsIgnoreCase("0")) {
            jsonrequest += "}";
        } else {
            Integer amountsale = Serviceprovider.getAmountSale(paymesaleid);
            if (amountsale > Integer.valueOf(amount)) {
                jsonrequest += ",\"sale_price\":\""+amount+"00\"}";
            } else {
                jsonrequest += "}"; //Will implement change amount to bigger logic
            }
        }
        OkHttpClient client = new OkHttpClient();
        MediaType mediaType = MediaType.parse("application/json");
        RequestBody body = RequestBody.create(mediaType, jsonrequest);
        Request request = new Request.Builder()
                .url(capturesaleurl)
                .post(body)
                .addHeader("Content-Type", "application/json")
                .addHeader("Cache-Control", "no-cache")
                .build();

        Response response = client.newCall(request).execute();
        if (response.code() == 200) {
            try {
                JSONParser parser = new JSONParser();
                Object obj = parser.parse(response.body().string());
                JSONObject jsonObj = (JSONObject) obj;
                String paiddate = String.valueOf(jsonObj.get("sale_paid_date"));
                String trid = String.valueOf(jsonObj.get("transaction_id"));
                String finalamount = String.valueOf(jsonObj.get("payme_transaction_total"));

                Serviceprovider.setFinalDataPayment(trid, paiddate,finalamount);
                res = "{\"sale_status\":"+String.valueOf(jsonObj.get("sale_status"))+
                        ",\"payme_transaction_total\":\""+String.valueOf(jsonObj.get("payme_transaction_total")) +"\",\"sale_paid_date\":\""+
                        paiddate+"\"}";
            } catch (ParseException e) {
                e.printStackTrace();
            }
        } else {
            res = response.body().string();
            //System.out.println(res);
        }
        return res;
    }

    public static String RefundSale(String spid, String paymetrid, String reasoncancel) throws IOException {
        String paymeid = Serviceprovider.GetSellerPaymeID(spid);
        readIni rIni = new readIni();
        String[] ss = rIni.run("options.ini");
        String paymeclient = ss[12];
        String refundsale = ss[9];
        String res="";

        String jsonrequest = "{\"payme_client_key\": \""+paymeclient+"\",\"seller_payme_id\" :\""+paymeid+"\",\"payme_sale_id\" :\""+
                    paymetrid+"\",\"language\":\"en\"}";
            //System.out.println(jsonrequest);

        OkHttpClient client = new OkHttpClient();
        MediaType mediaType = MediaType.parse("application/json");
        RequestBody body = RequestBody.create(mediaType, jsonrequest);
        Request request = new Request.Builder()
                    .url(refundsale)
                    .post(body)
                    .addHeader("Content-Type", "application/json")
                    .addHeader("Cache-Control", "no-cache")
                    .build();

        Response response = client.newCall(request).execute();
            if (response.code() == 200) {
                try {
                    JSONParser parser = new JSONParser();
                    Object obj = parser.parse(response.body().string());
                    JSONObject jsonObj = (JSONObject) obj;
                    res = String.valueOf(jsonObj.get("payme_transaction_id"));
                   // String paymetrid = String.valueOf(jsonObj.get("payme_sale_id"));
                    // User.AddNewPayment(spid,uid, Float.valueOf(price)/100,res,paymetrid);
                    User.DeclineCallPayment(paymetrid,reasoncancel);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            } else {
                JSONParser parser = new JSONParser();
                Object obj = null;
                res= response.body().string();
                try {
                    obj = parser.parse(res);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                JSONObject jsonObj = (JSONObject) obj;
                if (String.valueOf(jsonObj.get("status_additional_info")).equalsIgnoreCase("initial")) {
                    User.DeclineCallPayment(paymetrid,reasoncancel);
                    //System.out.println(String.valueOf(jsonObj.get("status_additional_info")));
                }
            }
        return res;
    }

}