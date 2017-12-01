/**
 * Created by РумянцевДмитрий on 27.11.2017.
 */
import com.twilio.jwt.accesstoken.AccessToken;
import com.twilio.jwt.accesstoken.VoiceGrant;

public class MyToken {
            // Required for all types of tokens
            static String twilioAccountSid = "AC412c3c70ad5d2d4da6b7b5e35feac84d";
            static String twilioApiKey = "SKxxxxxxxxxxxx";
            static String twilioApiSecret = "xxxxxxxxxxxxxx";

            // Required for Voice
            static String outgoingApplicationSid = "mobicarApp";
            static String identity = "mobicar";

            // Create Voice grant
            public MyToken() { }
            public static String newToken() {
                VoiceGrant grant = new VoiceGrant();
                grant.setOutgoingApplicationSid(outgoingApplicationSid);

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
