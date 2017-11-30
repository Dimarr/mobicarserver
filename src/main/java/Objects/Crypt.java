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
}
