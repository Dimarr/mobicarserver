package DBMain;

import java.io.FileInputStream;
import java.util.Properties;

/**
 * Created by DR on 05.09.2016.
 */
public class readIni {

    public String[] run(String confpath) {
        String[] s = new String[7]; // just reading ini file for database connection
        try{
            Properties p = new Properties();
            //String path = String.valueOf(this.getClass().getClassLoader().getResource(""));
            //String r = path.substring(6);
            //p.load(new FileInputStream(r+confpath));
            p.load(new FileInputStream(confpath));
            if (confpath.contains("options")) {
                s[0] = p.getProperty("url").trim();
                s[1] = p.getProperty("database").trim();
                s[2] = p.getProperty("user").trim();
                s[3] = p.getProperty("password").trim();
                s[4] = p.getProperty("webserver").trim();
                s[5] = p.getProperty("port").trim();
                s[6] = p.getProperty("marketfee").trim();
            } else {
                s[0] = p.getProperty("twilioAccountSid").trim();
                s[1] = p.getProperty("twilioApiKey").trim();
                s[2] = p.getProperty("twilioApiSecret").trim();
                s[3] = p.getProperty("serviceSid").trim();
                s[4] = p.getProperty("ACCOUNT_SID").trim();
                s[5] = p.getProperty("AUTH_TOKEN").trim();
                s[6] = p.getProperty("sendphone").trim();
            }
        }
        catch (Exception e) {
            System.out.println(e);
        }
        return s;
    }
}