/**
 * Created by РумянцевДмитрий on 27.11.2017.
 */
import com.twilio.jwt.accesstoken.AccessToken;
import com.twilio.jwt.accesstoken.ChatGrant;


public class MyToken {
            // Required for all types of tokens
            static String twilioAccountSid = "AC412c3c70ad5d2d4da6b7b5e35feac84d";
            static String twilioApiKey = "SK2a2760e426d581040b950b67398d994c";
            static String twilioApiSecret = "RIp2evChQ0wAX3W02xQBfq46wuz7sfmc";
            static String serviceSid = "IS06218ecbb2294496934c81f3d14fcfdf";

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
