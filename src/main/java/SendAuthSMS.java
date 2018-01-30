/**
 * Created by РумянцевДмитрий on 14.12.2017.
 */

import DBMain.readIni;
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class SendAuthSMS {
    static readIni rIni = new readIni();

    //public static final String ACCOUNT_SID = "AC412c3c70ad5d2d4da6b7b5e35feac84d";
    //public static final String ACCOUNT_SID = "AC803b78279861ae6c2f90fc6ae13b47e5";Maor's second'
    public static final String ACCOUNT_SID =rIni.run("tw.ini")[4];
            //"AC047e9d30a9ab4eef50ebdc74c2bc162d";
    //public static final String AUTH_TOKEN = "3effdd45913a6fc5d173c76c571d9ba1";
    //public static final String AUTH_TOKEN = "69e3891f8a40735ea43838058c70df7f"; Maor's second'
    public static final String AUTH_TOKEN = rIni.run("tw.ini")[5];
                    //"203b07a5a2e194522e6d141126aa92cc";
    //    public static void main(String[] args) {
    public SendAuthSMS(String phone, String body) {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
        try {
            Message message = Message.creator(new PhoneNumber(phone),  //+972547409162
                    new PhoneNumber(rIni.run("tw.ini")[6]),
                            //"+17036353198"),
                    body).create();

            //+17188653631
            //System.out.println("AccountSID "+message.getAccountSid());
            //System.out.println("MessagingServiceID "+message.getMessagingServiceSid());
            //System.out.println("SID "+message.getSid());
            //System.out.println("ServiceID "+message.getMessagingServiceSid());
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}