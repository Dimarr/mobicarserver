/**
 * Created by РумянцевДмитрий on 27.11.2017.
 */
import com.twilio.jwt.accesstoken.AccessToken;
import com.twilio.jwt.accesstoken.ChatGrant;

public class MyToken {
            // Required for all types of tokens
            static String twilioAccountSid = "ACxxxxxxxxxxxx";
            static String twilioApiKey = "SKxxxxxxxxxxxx";
            static String twilioApiSecret = "xxxxxxxxxxxxxx";

            // Required for Voice
            static String outgoingApplicationSid = "APxxxxxxxxxxxx";
            static String identity = "user";

            // Create Voice grant
            public MyToken() { }
            public static String newToken() {
                String serviceSid = "ISxxxxxxxxxxxx";
                String deviceId = "someiosdevice";
                String identity = "user@example.com";
                String appName = "HipFlowSlackDockRC";
                String endpointId = appName + ":" + identity + ":" + deviceId;

                ChatGrant grant = new ChatGrant();
                grant.setEndpointId(endpointId);
                grant.setServiceSid(serviceSid);

                AccessToken token = new AccessToken.Builder(twilioAccountSid, twilioApiKey, twilioApiSecret)
                        .identity(identity).grant(grant).build();
                return token.toJwt();
                //System.out.println(token.toJwt());
    }
}
