import com.squareup.okhttp.*;

import java.io.IOException;


public class Paytest {
       public static void main(String[] args) throws IOException {

           //Client client = ClientBuilder.newClient();
           /*Entity payload = Entity.json("{  'amount': 10000,  'currency': 'USD',  'idNumber': '23242526',  'description': 'Payment reason and description',  'address': {    'ip': '192.168.1.1',    'country': 'AR',    'state': 'Mendoza',    'city': 'Mendoza',    'street': 'Tierra del Fuego',    'number': 152,    'zip': '5505',    'phone': '+54261555123'  },  'creditCard': {    'firstName': 'Carl',    'lastName': 'Cactus',    'number': '4242424242424242',    'cvc': '123',    'month': '04',    'year': '2018',    'email': 'user@example.com',    'type': 'VISA'  }}");
           Response response = client.target("https://api-sandbox.olpays.com/api/payments")
                   .request(MediaType.APPLICATION_JSON_TYPE)
                   .header("Authorization", "Basic NTczNDc3ZDgwMTIxMzY1MzQxOGNlOTZlOnNrXzhhOTUwNmUxMjQzNjg0YTQyODYzNTIxM2I1MmU2NmEwZTIzM2U4MjRlNjVkNTIyZTE3YjJmZjdiNjI0ZmU2NTU=")
                   .post(payload); */
          // Entity payload = Entity.json("{  'payme_client_key': 'mobicar_KIWAanOH',  'seller_id': '9740598',  'seller_first_name': 'First',  'seller_last_name': 'Last',  'seller_social_id': '9999999999',  'seller_birthdate': '06/05/1989',  'seller_social_id_issued': '01/01/2000',  'seller_gender': 0,  'seller_email': 'merty@exple.com',  'seller_phone': '0540123456',  'seller_contact_email': 'contact@example.com',  'seller_contact_phone': '031234567',  'seller_bank_code': 54,  'seller_bank_branch': 123,  'seller_bank_account_number': '123456',  'seller_description': 'An online store which specializes in rubber ducks',  'seller_site_url': 'www.babyducks.com',  'seller_person_business_type': 2000,  'seller_inc': 2,  'seller_inc_code': '123456',  'seller_retail_type': 1,  'seller_merchant_name': 'Baby Ducks',  'seller_address_city': 'Tel Aviv',  'seller_address_street': 'Rothschild',  'seller_address_street_number': '1',  'seller_address_country': 'IL',  'market_fee': 5,  'seller_file_social_id': 'http://www.brainpop.co.il/category_9/subcategory_150/subjects_5148/screenshot2.png',  'seller_file_cheque': 'http://www.evinco-software.com/chequesystem/sample/hdfc-bank-cheque.jpg',  'seller_file_corporate': 'http://www.mattsbits.co.uk/user_media/uploaded_media/hsbc_example_output.png',  'seller_file_bank_auth': 'http://cdn2-www.dogtime.com/assets/uploads/gallery/25-dog-memes/04_funny-dog-meme.jpg'}");
           //Entity payload = Entity.json("{  'seller_payme_id': 'MPL15269-12254UQ3-KVM7H3L9-F6VZYKDS',  'sale_payme_id': 'MPL15269-12254UQ3-KVM7H3L9-F6VZYKDS'}");
           /*Response response = client.target
                   ("https://preprod.paymeservice.com/api/create-seller")
                   .request(MediaType.APPLICATION_JSON_TYPE)
                   .post(payload);*/

           OkHttpClient client = new OkHttpClient();

           MediaType mediaType = MediaType.parse("application/json");
           RequestBody body = RequestBody.create(mediaType, "{\r\n  \"payme_client_key\": \"mobicar_KIWAanOH\",\r\n  \"seller_id\": \"6666745698\",\r\n  \"seller_first_name\": \"First\",\r\n  \"seller_last_name\": \"Last\",\r\n  \"seller_social_id\": \"9999999999\",\r\n  \"seller_birthdate\": \"06/05/1989\",\r\n  \"seller_social_id_issued\": \"01/01/2000\",\r\n  \"seller_gender\": 0,\r\n  \"seller_email\": \"yoooo@example.com\",\r\n  \"seller_phone\": \"0540123456\",\r\n  \"seller_contact_email\": \"contact@example.com\",\r\n  \"seller_contact_phone\": \"031234567\",\r\n  \"seller_bank_code\": 54,\r\n  \"seller_bank_branch\": 123,\r\n  \"seller_bank_account_number\": \"123456\",\r\n  \"seller_description\": \"An online store which specializes in rubber ducks\",\r\n  \"seller_site_url\": \"www.babyducks.com\",\r\n  \"seller_person_business_type\": 2000,\r\n  \"seller_inc\": 2,\r\n  \"seller_inc_code\": \"123456\",\r\n  \"seller_retail_type\": 1,\r\n  \"seller_merchant_name\": \"Baby Ducks\",\r\n  \"seller_address_city\": \"Tel Aviv\",\r\n  \"seller_address_street\": \"Rothschild\",\r\n  \"seller_address_street_number\": \"1\",\r\n  \"seller_address_country\": \"IL\",\r\n  \"market_fee\": 5,\r\n  \"seller_file_social_id\": \"http://www.brainpop.co.il/category_9/subcategory_150/subjects_5148/screenshot2.png\",\r\n  \"seller_file_cheque\": \"http://www.evinco-software.com/chequesystem/sample/hdfc-bank-cheque.jpg\",\r\n  \"seller_file_corporate\": \"http://www.mattsbits.co.uk/user_media/uploaded_media/hsbc_example_output.png\",\r\n  \"seller_file_bank_auth\": \"http://cdn2-www.dogtime.com/assets/uploads/gallery/25-dog-memes/04_funny-dog-meme.jpg\"\r\n}");
           Request request = new Request.Builder()
                   .url("https://preprod.paymeservice.com/api/create-seller")
                   .post(body)
                   .addHeader("Content-Type", "application/json")
                   .addHeader("Cache-Control", "no-cache")
                   //.addHeader("Postman-Token", "8cb0d7bc-660b-40c0-953a-38bab9d7ce1f")
                   .build();

           Response response = client.newCall(request).execute();
           //response.body().
           System.out.println("status: "+response.code());
           //System.out.println("headers: " + response.getHeaders());
           System.out.println("body:" + response.body().string());
       }
   }