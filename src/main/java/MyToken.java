/**
 * Created by РумянцевДмитрий on 27.11.2017.
 */
import com.twilio.jwt.accesstoken.AccessToken;
import com.twilio.jwt.accesstoken.ChatGrant;


public class MyToken {
            // Required for all types of tokens
            //static String twilioAccountSid = "AC412c3c70ad5d2d4da6b7b5e35feac84d";
            //static String twilioAccountSid = "AC803b78279861ae6c2f90fc6ae13b47e5"; Maor's second account
            static String twilioAccountSid = "AC047e9d30a9ab4eef50ebdc74c2bc162d";
            //static String twilioApiKey = "SK2a2760e426d581040b950b67398d994c";
            //static String twilioApiKey = "SKb08f13a9c9e234115976e9a4e9702ba1"; Maor's second account
            static String twilioApiKey = "SK67b3261c54340bfb6c2d096fdaab6caf";
            //static String twilioApiSecret = "RIp2evChQ0wAX3W02xQBfq46wuz7sfmc";
            //static String twilioApiSecret = "wOb4nXkFc1RcrPairRix9VDuSp4L7T4o"; Maor's second account
            static String twilioApiSecret = "SljuHuKxhsUK9ywPXDMF6DvQr4b802e4";
            //static String serviceSid = "IS06218ecbb2294496934c81f3d14fcfdf";
            //static String serviceSid = "ISbf47daa7ea7a44bbb65a9352707b8891"; Maor's second account
            static String serviceSid = "MG265ed3f71dd6f4acf513ac02ee667211";
            //static String outgoingApplicationSid = "mobicarApp";
            //static String identity = "mobicar";

            // Create grant
            //public MyToken() { }
            public static String newToken(String userid, String deviceId ) {
                //String serviceSid = "IS06218ecbb2294496934c81f3d14fcfdf";
                //String deviceId = "someiosdevice";
                String identity = userid; //"user@example.com";
                String appName = "mobicarServer";
                String endpointId = appName + ":" + identity + ":" + deviceId;

                ChatGrant grant = new ChatGrant();
                //grant.setOutgoingApplicationSid(outgoingApplicationSid);
                grant.setEndpointId(endpointId);
                grant.setServiceSid(serviceSid);
                // Create access token
                AccessToken token = new AccessToken.Builder(
                twilioAccountSid,
                twilioApiKey,
                twilioApiSecret
                ).identity(identity).grant(grant).build();

                return token.toJwt();
                //System.out.println(token.toJwt());
    }
}
