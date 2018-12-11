import DBMain.readIni;
import Objects.Serviceprovider;
import Objects.User;
import com.squareup.okhttp.*;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by DR on 27.08.2017.
 */
public class Payment {
    public static String paymerestsaleid = "";
    public static String paymerestsalecode = "";
    public static String ConvertAmountToPayme(String am) {
        return String.format("%.0f",Float.valueOf(am)*100);
    }
    public static String CreateSeller(String spid) throws IOException {
        readIni rIni = new readIni();
        String[] ss = rIni.run("options.ini");
        String market_fee = ss[6];
        String createsellerurl = ss[7];
        String paymeclient = ss[12];
        String res="";
        String sql= "SELECT * FROM paymesellers WHERE id="+spid;
        String jstr=User.jsonrs(sql,"");
        //jstr= jstr.replace('"', '\'');
        //System.out.println(sql);
        if (jstr.length()>7) {     // Select is not empty
            OkHttpClient client = new OkHttpClient();
            MediaType mediaType = MediaType.parse("application/json");
            String jsonrequest = "{\r\n  \"payme_client_key\": \""+paymeclient+"\",\r\n " +
                    jstr.substring(jstr.indexOf("[") + 2, jstr.length() - 3) + ",\"market_fee\": " + market_fee + "}";
            RequestBody body = RequestBody.create(mediaType, jsonrequest);
           //System.out.println(jsonrequest);

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
                response.body().close();
                System.out.println(res);
            }
        } else {
            res= "{\"status\":\"need to fill seller's details\",\"url\":\""+ss[14]+"?spid="+spid+"\"}";
            new SendAuthSMS(Serviceprovider.getphone(Integer.valueOf(spid)),ss[14]+"?spid="+spid);
        }
        return res;
    }

    public static boolean GenerateRestSale(String spid, String serviceid, String restamount, String paymesaleid, Integer afterrefund, Integer installments, String oldamount) throws IOException {
        readIni rIni = new readIni();
        String[] ss = rIni.run("options.ini");
        String paymeid = Serviceprovider.GetSellerPaymeID(spid);
        String trid = Serviceprovider.GetTransID();
        String generatesaleurl = ss[8];
        String callbackurl = ss[10];
        String sql="";
        Boolean res = false;
        String buyerkey="";
        try {
            buyerkey = Serviceprovider.getBuyerKeyForSP(paymesaleid);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        //System.out.println("paymesaleid "+paymesaleid+",buyerkey "+buyerkey);
        String refund =(afterrefund==1) ? ",'"+ callbackurl.trim() + "' as sale_callback_url" : "";
        sql = "SELECT DISTINCT servicetype.name as product_name,"+ restamount+ " as sale_price,'ILS' as currency,"+
                installments+" as installments"+ refund +
                " FROM spservices,servicetype WHERE spservices.serviceid=servicetype.id AND spid=" + spid + " AND serviceid=" + serviceid + ";";
        String jstr=User.jsonrs(sql,"");
        if (jstr.length()>7) {     // Select is not empty
            String jsonrequest = "{\"seller_payme_id\" :\""+paymeid+"\",\"transaction_id\" :"+trid+","+
                    "\"buyer_key\":"+"\""+buyerkey+"\",\"language\":\"en\","
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
                    .build();

            Response response = client.newCall(request).execute();
            res= (response.code() == 200);
            if (!res) Serviceprovider.DeclinePayment(paymesaleid,oldamount);

            JSONParser parser = new JSONParser();
            Object obj = null;
            try {
                obj = parser.parse(response.body().string());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            JSONObject jsonObj = (JSONObject) obj;
            String saleerrorcode = String.valueOf(jsonObj.get("status_code"));
            //System.out.println("paymeid "+paymesaleid+" paymeslaveid "+paymerestsaleid);
            if (!(saleerrorcode.equalsIgnoreCase("0"))) {
                Serviceprovider.DeclinePayment(paymesaleid,oldamount);
                try {
                    Serviceprovider.AddPaymeErrorKey(paymesaleid,String.valueOf(jsonObj.get("status_error_details")));
                    paymerestsalecode = String.valueOf(jsonObj.get("status_error_details"));
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } else {
               paymerestsaleid = String.valueOf(jsonObj.get("payme_sale_id"));
               paymerestsalecode = String.valueOf(jsonObj.get("payme_sale_code"));
            }
            response.body().close();
            //System.out.println(response.body().string());
        }
        return res;
    }

    public static String GenerateSale(String uid, String spid, String serviceid, String installments) throws IOException {
        readIni rIni = new readIni();
        String[] ss = rIni.run("options.ini");
        String generatesaleurl = ss[8];
        String callbackurl = ss[10];
        String successfullurl = ss[11];
        String res = "-1";
        String paymeid = Serviceprovider.GetSellerPaymeID(spid);
        String trid = Serviceprovider.GetTransID();
        String sql="";
        String instl = (!installments.isEmpty()) ? installments.trim() : "1";
        //System.out.println("*"+paymeid+"*");
        if (paymeid == null) return res;
        if (!(paymeid.isEmpty())) {
                 sql = "SELECT DISTINCT '" + callbackurl + "' as sale_callback_url,'" + successfullurl
                        + "' as sale_return_url,servicetype.name as product_name, " +
                        " price*100 as sale_price,'ILS' as currency,"+instl+
                         " as installments,1 as capture_buyer"+
                        " from spservices,servicetype WHERE spservices.serviceid=servicetype.id AND spid=" + spid + " AND serviceid=" + serviceid + ";";
            //}
            //System.out.println("*"+istoken+"*");
            String jstr=User.jsonrs(sql,"");
            //auth = (istoken.trim().equalsIgnoreCase("1")) ? "token" : "authorize";

            if (jstr.length()>7) {     // Select is not empty
                String jsonrequest = "{\"seller_payme_id\" :\""+paymeid+"\",\"transaction_id\" :"+trid+","+
                        "\"sale_type\":"+ "\"authorize\",\"language\":\"en\","
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
                        .build();

                Response response = client.newCall(request).execute();
                if (response.code() == 200) {
                    try {
                        JSONParser parser = new JSONParser();
                        Object obj = parser.parse(response.body().string());
                        JSONObject jsonObj = (JSONObject) obj;
                        String paymetrid = String.valueOf(jsonObj.get("payme_sale_id"));
                        res = String.valueOf(jsonObj.get("sale_url"));
                        String price = String.valueOf(jsonObj.get("price"));
                        String payid = "";
                        String saleerrorcode = String.valueOf(jsonObj.get("status_code"));
                        //System.out.println("*"+saleerrorcode+"*");
                        if (saleerrorcode.equalsIgnoreCase("0")) {
                            try {
                                payid = User.AddNewPayment(spid, uid, Float.valueOf(price) / 100, res, paymetrid, "0", "1", instl);
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                            res = "{\"status_code\":0,\"sale_url\":\"" + String.valueOf(jsonObj.get("sale_url")) + "\",\"mobicar_server_pay_id\":" + payid +
                                    ",\"payme_sale_id\":\"" + paymetrid + "\",\"sale_price\":\"" + price + "\",\"installments\":"+instl+"}";
                        } else {
                            try {
                                User.AddNewPayment(spid, uid, Float.valueOf(price)/100 , res, paymetrid, "0","3", instl);
                                res= response.body().string();
                                response.body().close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                } else {
                    JSONParser parser = new JSONParser();
                    Object obj = null;
                    try {
                        obj = parser.parse(response.body().string());
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    JSONObject jsonObj = (JSONObject) obj;
                    String paymetrid = String.valueOf(jsonObj.get("payme_sale_id"));
                    res = String.valueOf(jsonObj.get("sale_url"));
                    String price = String.valueOf(jsonObj.get("price"));
                    try {
                        User.AddNewPayment(spid, uid, Float.valueOf(price)/100 , res, paymetrid, "0","3",instl);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    res= response.body().string();
                    response.body().close();
                    //System.out.println(res);
                }
            }
        }
        return res;
    }

    public static String CaptureSale(String paymesaleid, String amount, String callid, String installments) throws IOException {
        readIni rIni = new readIni();
        String[] ss = rIni.run("options.ini");
        String capturesaleurl = ss[13];
        String res ="";
        Integer amountdif=0;
        Integer instl = (installments.isEmpty()) ? 1 : Integer.valueOf(installments); // Changed logic to useing installments in capturesale
        String jsonrequest = "{\"payme_sale_id\" :\""+paymesaleid+"\",\"language\":\"en\"";
        if (amount.equalsIgnoreCase("0")) {
            jsonrequest += "}";
        } else {
            //Integer[] paymedata= new Integer[0];
            //paymedata = Serviceprovider.getAmountSale(paymesaleid);
            Integer amountsale = Serviceprovider.getAmountSale(paymesaleid);//paymedata[0];
            //instl = paymedata[1];
            if (amountsale >= Integer.valueOf(amount)) {
                jsonrequest += ",\"sale_price\":\""+ConvertAmountToPayme(amount.trim())+"\",\"installments\":"+instl+"}";
            } else {
                amountdif= Integer.valueOf(amount) - amountsale;
                jsonrequest += ",\"installments\":"+instl+"}"; //Will implement change amount to bigger logic
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
        JSONParser parser = new JSONParser();
        String responsebody = response.body().string();
        Object obj = null;
        try {
            obj = parser.parse(responsebody);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        JSONObject jsonObj = (JSONObject) obj;
        if (response.code() == 200) {
            //System.out.println(String.valueOf(jsonObj.get("status_error_code")));
            //System.out.println("JSON: "+jsonObj.toString());
            if (!String.valueOf(jsonObj.get("status_error_code")).equalsIgnoreCase("20000") &&
                    !String.valueOf(jsonObj.get("status_error_code")).equalsIgnoreCase("0") ) {
                res = "{\"status_code\":1,\"status_error_details\":\"" + String.valueOf(jsonObj.get("status_error_details")) + "\"}";
            } else  {
                String paiddate = String.valueOf(jsonObj.get("sale_paid_date"));
                String paiddate_localtime = paiddate;
                DateTimeFormatter formatter = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss");
                DateTime dtpaid = formatter.parseDateTime(paiddate).minusHours(3); //convert to UTC
                //DateTime dtpaid = new DateTime(paiddate).minusHours(3);
                paiddate = formatter.print(dtpaid);

                String trid = String.valueOf(jsonObj.get("transaction_id"));
                String saleerrorcode = String.valueOf(jsonObj.get("status_code"));
                String paymesalecode = String.valueOf(jsonObj.get("payme_sale_code"));
                String[] param = new String[0];
                //System.out.println("saleerrorcode: "+saleerrorcode);
                if (saleerrorcode.equalsIgnoreCase("0")) {
                    String finalamount = (amount.equalsIgnoreCase("0")) ? String.valueOf(jsonObj.get("payme_transaction_total")) : ConvertAmountToPayme(amount);
                    try {
                        param = Serviceprovider.setFinalDataPayment(trid, paiddate, finalamount, callid, instl);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    if (amountdif > 0) {
                        //amountdif = (amountdif<10) ? 10 : amountdif;  // Just stack for pilot
                        if (GenerateRestSale(param[0], param[1], String.valueOf(amountdif * 100), paymesaleid, 0, instl,param[2])) {  //Just delta added
                            res = "{\"status_code\":0,\"rest_sale_amount\":" + amountdif * 100 + ",\"payme_sale_code\":" + paymesalecode + ",";
                            res += "\"basic_sale_status\":\"" + String.valueOf(jsonObj.get("sale_status")) +
                                    "\",\"payme_transaction_total\":\"" + amount + "\",\"sale_paid_date\":\"" +
                                    paiddate_localtime + "\"}";
                            try {
                                Serviceprovider.addPaymeSlave(trid, paymerestsalecode);
                                Serviceprovider.setCallStatus(callid,"11");  // Final Approvement
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        } else {
                            RefundSale(param[0], paymesaleid);
                            if (GenerateRestSale(param[0], param[1], finalamount, paymesaleid, 1, instl,param[2])) { //New payment request after refund
                                try {
                                    String payid = User.AddNewPayment(param[0], "0", Float.valueOf(finalamount) / 100, res, paymerestsaleid, callid, "2", String.valueOf(instl));
                                    Serviceprovider.setCallStatus(callid,"11");  // Final Approvement
                                    res = "{\"status_code\":0,\"mobicar_server_pay_id\":" + payid + ",\"payme_sale_code\":" + paymerestsalecode +
                                            ",\"payme_sale_id\":\"" + paymerestsaleid + "\",\"sale_price\":\"" + finalamount + "\"" +
                                            ",\"sale_paid_date\":\"" + paiddate_localtime + "\"}";
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            } else {
                                res = "{\"status_code\":1,\"status_error_details\":\"" + paymerestsalecode + "\"}";
                                Serviceprovider.setCallStatus(callid,"4");  // Ready for payment
                            }
                        }
                    } else {
                        Serviceprovider.setCallStatus(callid,"11");  // Final Approvement
                        res = "{\"basic_sale_status\":\"" + String.valueOf(jsonObj.get("sale_status")) + "\",\"payme_sale_code\":" + paymesalecode + "," +
                                "\"payme_transaction_total\":\"" + finalamount + "\",\"status_code\":" + saleerrorcode +
                                ",\"sale_paid_date\":\"" + paiddate + "\"}";
                    }
                    //Integer total = (Integer) jsonObj.get("payme_transaction_total")+amountdif*100;
                } else {
                    Serviceprovider.DeclinePayment(paymesaleid,param[2]);
                    //res = response.body().string();
                    res = responsebody;
                    response.body().close();
                }
            }
        } else {
            //System.out.println(String.valueOf(jsonObj.get("status_additional_info")));
            try {
                Serviceprovider.AddPaymeErrorKey(paymesaleid,String.valueOf(jsonObj.get("status_error_details")));
            } catch (SQLException e) {
                e.printStackTrace();
            }
            //if (!String.valueOf(jsonObj.get("status_additional_info")).equalsIgnoreCase("completed"))
            //    Serviceprovider.DeclinePayment(paymesaleid);
            System.out.println("Status not 200 "+String.valueOf(jsonObj.get("sale_error_code")));

            res = responsebody;
            //response.body().close();
            //System.out.println(res);
        }
        //System.out.println(res);
        return res;
    }

    public static String UpdatePaymeStatus() throws IOException {

        Integer count= 0;
        readIni rIni = new readIni();
        String[] ss = rIni.run("options.ini");
        String paymeclient = ss[12];
        String verifypaymestatus = ss[16];
        ArrayList<String> slrs = Serviceprovider.NotApprovedPayme();
        String jsonrequest;
        OkHttpClient client = new OkHttpClient();
        MediaType mediaType = MediaType.parse("application/json");
        for (int i = 0; i < slrs.size(); i++) {
            jsonrequest = "{\"payme_client_key\": \""+paymeclient+"\",\"seller_payme_id\" :\""+slrs.get(i)+"\"}";
            RequestBody body = RequestBody.create(mediaType, jsonrequest);
            Request request = new Request.Builder()
                    .url(verifypaymestatus)
                    .post(body)
                    .addHeader("Content-Type", "application/json")
                    .addHeader("Cache-Control", "no-cache")
                    .build();
            Response response = client.newCall(request).execute();
            //System.out.println(verifypaymestatus);
            if (response.code() == 200) {
                try {
                    JSONParser parser = new JSONParser();
                    Object obj = parser.parse(response.body().string());
                    JSONObject jsonObj = (JSONObject) obj;
                    JSONArray pItem = (JSONArray) jsonObj.get("items");
                    for (int ii=0; ii < pItem.size();ii++) {
                        JSONObject jsonObj1 = (JSONObject)pItem.get(ii);
                        //System.out.println("*"+jsonObj1.get("seller_approved")+"*");
                        if (Boolean.valueOf((Boolean) jsonObj1.get("seller_approved"))) {
                            Serviceprovider.setPaymeApprovement(slrs.get(i));
                            count++;
                        }
                    }
                    //System.out.println("*"+pItem.toJSONString()+"*");
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }
        }
        return String.valueOf(count);
    }


    public static String WithdrawBalance(String spid) throws IOException {
        String paymeid = Serviceprovider.GetSellerPaymeID(spid);
        readIni rIni = new readIni();
        String[] ss = rIni.run("options.ini");
        String paymeclient = ss[12];
        String withdraw = ss[15];
        String res="";

        String jsonrequest = "{\"payme_client_key\": \""+paymeclient+"\",\"seller_payme_id\" :\""+paymeid+"\",\"withdrawal_currency\" :\"ILS\"" +
                ",\"language\":\"en\"}";

        OkHttpClient client = new OkHttpClient();
        MediaType mediaType = MediaType.parse("application/json");
        RequestBody body = RequestBody.create(mediaType, jsonrequest);
        Request request = new Request.Builder()
                .url(withdraw)
                .post(body)
                .addHeader("Content-Type", "application/json")
                .addHeader("Cache-Control", "no-cache")
                .build();

        Response response = client.newCall(request).execute();
        return res;
    }


    public static String RefundSale(String spid, String paymetrid) throws IOException {
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
                    User.ProcessCallPayment(paymetrid,"8");
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
                    User.ProcessCallPayment(paymetrid,"6");
                    //System.out.println(String.valueOf(jsonObj.get("status_additional_info")));
                }
            }
        return res;
    }
}