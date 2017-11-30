import org.json.JSONObject;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.io.IOException;


/**
 * Created by DR on 27.08.2017.
 */
public class Payment {
    public static void main(String[] args) throws IOException {

        Client client = ClientBuilder.newClient();
        Entity payload = Entity.json("{  'payme_client_key': 'mobicar_KIWAanOH ',  " +
                "'seller_id': '12345',  " +
               // "'seller_first_name': 'First',  " +
               // "'seller_last_name': 'Last',  " +
                "'seller_social_id': '9999999999',  " +
              //  "'seller_birthdate': '06/05/1989',  " +
              //  "'seller_social_id_issued': '01/01/2000',  " +
              //  "'seller_gender': 0,  " +
                "'seller_email': 'personal@example.com',  " +
                "'seller_phone': '0540123456',  " +
              //  "'seller_contact_email': 'contact@example.com',  " +
              //  "'seller_contact_phone': '031234567',  " +
                "'seller_bank_code': 54,  " +
                "'seller_bank_branch': 123,  " +
                "'seller_bank_account_number': '123456',  " +
                "'seller_description': 'An online store which specializes in rubber ducks',  " +
              //  "'seller_site_url': 'www.babyducks.com',  " +
                "'seller_person_business_type': 2000,  " +
             //   "'seller_inc': 2,  " +
             //   "'seller_inc_code': '123456',  " +
                "'seller_retail_type': 1,  " +
                "'seller_merchant_name': 'Baby Ducks',  " +
                "'seller_address_city': 'Tel Aviv',  " +
                "'seller_address_street': 'Rothschild',  " +
                "'seller_address_street_number': '1',}  ");
            //    "'market_fee': 5,  " +
            //    "'seller_file_social_id': 'http://www.brainpop.co.il/category_9/subcategory_150/subjects_5148/screenshot2.png',  " +
            //    "'seller_file_cheque': 'http://www.evinco-software.com/chequesystem/sample/hdfc-bank-cheque.jpg',  " +
            //    "'seller_file_corporate': 'http://www.mattsbits.co.uk/user_media/uploaded_media/hsbc_example_output.png',  " +
            //    "'seller_file_bank_auth': 'http://cdn2-www.dogtime.com/assets/uploads/gallery/25-dog-memes/04_funny-dog-meme.jpg'}");

        Response response = client.target("https://private-anon-0f551ff73c-paymeapi.apiary-mock.com/create-seller")
                .request(MediaType.APPLICATION_JSON_TYPE)
                .post(payload);
//        System.out.println("status: " + response.getStatus());
  //      System.out.println("headers: " + response.getHeaders());
        JSONObject paymeJSON = new JSONObject(response.readEntity(String.class));
        System.out.println("seller_payme_id : " + paymeJSON.getString("seller_payme_id"));
        System.out.println("seller_id : " + paymeJSON.getString("seller_id"));

        payload = Entity.json("{  'seller_payme_id': 'XXXXXXXX-XXXXXXXX-XXXXXXXX-XXXXXXXX',  'sale_price': 10000,  'currency': 'ILS',  " +
                "'product_name': 'Baby Duck',  'transaction_id': '12345',  'installments': 1,  " +
                "'sale_callback_url': 'http://www.example.com/payment/callback',  " +
                "'sale_return_url': 'http://www.example.com/payment/success',  'capture_buyer': 0}");
        response = client.target("https://private-anon-bb9b7856b7-paymeapi.apiary-mock.com/generate-sale")
                .request(MediaType.APPLICATION_JSON_TYPE)
                .post(payload);
        System.out.println("body:" + response.readEntity(String.class));
        //paymeJSON = new JSONObject(response.readEntity(String.class));
        //System.out.println("price : " + paymeJSON.getDouble("price"));
        //System.out.println("transaction_id : " + paymeJSON.getString("transaction_id"));

         payload = Entity.json("{  'Attributes': {    'payme_client_key': 'XXXXXXXX',    " +
                 "'seller_payme_id': 'XXXXXXXX-XXXXXXXX-XXXXXXXX-XXXXXXXX',    " +
                 "'payme_sale_id': '`XXXXXXXX-XXXXXXXX-XXXXXXXX-XXXXXXXX` PayMe's unique sale ID',    " +
                 "'sale_refund_amount': 10000,    'language': 'en'  }}");
         response = client.target("https://private-anon-bb9b7856b7-paymeapi.apiary-mock.com/refund-sale")
                .request(MediaType.APPLICATION_JSON_TYPE)
                .post(payload);

        paymeJSON = new JSONObject(response.readEntity(String.class));
        System.out.println("payme_transaction_total: " + paymeJSON.getDouble("payme_transaction_total"));
        System.out.println("sale_refund_buffer : " + paymeJSON.getDouble("sale_refund_buffer"));

    }
}
