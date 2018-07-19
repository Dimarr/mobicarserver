package DBMain;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Properties;

/**
 * Created by DR on 05.09.2016.
 */
public class readIni {

    private static String readUsingFiles(String fileName) throws IOException {
        return new String(Files.readAllBytes(Paths.get(fileName)));
    }

    private InputStream LoadFromFile(String name, Boolean crypted) {
        if (crypted) {
            String byteArrayAsString= "MoBI!!0}";
            StringCrypter crypter=new StringCrypter(byteArrayAsString.getBytes());
            //(new byte[]{1,4,5,6,8,9,7,8});
            String testStr = null;
            try {
                testStr = readUsingFiles(name);
                String decryptedStr = crypter.decrypt(testStr);
                //System.out.println("Original " + testStr);
                //System.out.println("Decrypted " + decryptedStr);
                return new ByteArrayInputStream(decryptedStr.getBytes());
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            try {
                return new FileInputStream(name);
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
    public String[] run(String confpath) {
        String[] s = new String[17]; // just reading ini file for database connection
        try{
            Properties p = new Properties();
            //String path = String.valueOf(this.getClass().getClassLoader().getResource(""));
            //String r = path.substring(6);
            //p.load(new FileInputStream(r+confpath));
            //p.load(new FileInputStream(confpath));
            p.load(LoadFromFile(confpath, false));
            if (confpath.contains("options")) {
                s[0] = p.getProperty("url").trim();
                s[1] = p.getProperty("database").trim();
                s[2] = p.getProperty("user").trim();
                s[3] = p.getProperty("password").trim();
                s[4] = p.getProperty("webserver").trim();
                s[5] = p.getProperty("port").trim();
                s[6] = p.getProperty("marketfee").trim();
                s[7] = p.getProperty("createseller").trim();
                s[8] = p.getProperty("generatesale").trim();
                s[9] = p.getProperty("refundsale").trim();
                s[10] = p.getProperty("salecallback").trim();
                s[11] = p.getProperty("successfullurl").trim();
                s[12] = p.getProperty("paymeclient").trim();
                s[13] = p.getProperty("capturesale").trim();
                s[14] = p.getProperty("insertseller").trim();
                s[15] = p.getProperty("withdraw").trim();
                s[16] = p.getProperty("paymeverify").trim();
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