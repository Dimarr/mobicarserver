/**
 * Created by РумянцевДмитрий on 14.12.2017.
 */

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class SendAuthSMS {
    public static final String ACCOUNT_SID = "AC412c3c70ad5d2d4da6b7b5e35feac84d";
    public static final String AUTH_TOKEN = "3effdd45913a6fc5d173c76c571d9ba1";

    //    public static void main(String[] args) {
    public SendAuthSMS(String phone, String body) {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
        try {
            Message message = Message.creator(new PhoneNumber(phone),  //+972547409162
                    new PhoneNumber("+17188653631"),
                    body).create();

            //System.out.println("AccountSID "+message.getAccountSid());
            //System.out.println("MessagingServiceID "+message.getMessagingServiceSid());
            //System.out.println("SID "+message.getSid());
            //System.out.println("ServiceID "+message.getMessagingServiceSid());
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}