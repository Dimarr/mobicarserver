package Objects;

import org.apache.commons.codec.digest.DigestUtils;

/**
 * Created by SBT-Rumyantsev-DK on 23.09.2016.
 */
public class Crypt {
    public static String md5Apache(String st) {
        String md5Hex = DigestUtils.md5Hex(st);
        return md5Hex;
    }
    public static String rnd(int min, int max)
    {
        max -= min;
        String s=String.format("%s%d", Math.random() * ++max, min);
        if (s.length()<4) s=s.trim()+ "000";
        return s.substring(0,4);
        //return String. String.format("%s%d", Math.random() * ++max, min);
    }
    public static String encode(String pText, String pKey) {
        String res ="";
        int keylen = pKey.length();
        int msglen = pText.length();
        int j=0;
        for(int i = 0; i < msglen; i++) {
            res = res + (char) (pText.charAt(i) ^ pKey.charAt(j));
            j++;
            if(j==keylen) {
                j=0;
            }
        }
        return res;
    }
    public static String decode(String pText, String pKey) {
        String res ="";
        int keylen = pKey.length();
        int msglen = pText.length();
        int j=0;
        for(int i = 0; i < msglen; i++) {
            res = res + (char) (pText.charAt(i) ^ pKey.charAt(j));
            j++;
            if(j==keylen) {
                j=0;
            }
        }
        return res;
    }
}
