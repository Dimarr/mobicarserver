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
        return s.substring(0,4);
        //return String. String.format("%s%d", Math.random() * ++max, min);
    }
}
