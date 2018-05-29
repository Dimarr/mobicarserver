package DBMain; /**
 * Created by dima_ on 26.05.2018.
 */
// Файл DBMain.StringCrypter.java

import java.io.IOException;
import org.apache.commons.codec.binary.Base64;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;

/**
 * Класс для шифрования и дешифрования строк
 * Использует библиотеку Apache Codec http://commons.apache.org/codec/
 * @author Рудницкий Валентин
 */
public class StringCrypter {

    /**
     * Упрощенный конструктор. Создает DBMain.StringCrypter с ключом DESSecretKey со значением по умолчанию (не рекомендуется)
     */
    private String getMacAddress() {
        String address = "";
        InetAddress ip;
        try {
            try {
                ip = InetAddress.getLocalHost();
                NetworkInterface network = NetworkInterface.getByInetAddress(ip);
                byte[] mac = network.getHardwareAddress();
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < mac.length; i++) {
                    //sb.append(String.format("%02X%s", mac[i], (i < mac.length - 1) ? "-" : ""));
                    sb.append(String.format("%02X%s", mac[i],""));
                }
                address=sb.toString().substring(2,10);
            } catch (UnknownHostException e) {
                e.printStackTrace();
            }
        } catch (SocketException ex) {
            ex.printStackTrace();
        }
        return address;
    }
    public StringCrypter() {
            this(new byte[]{1, 2, 3, 4, 5, 6, 7, 8});
    }

    /**
     * Упрощенный конструктор. Создает DBMain.StringCrypter с ключом
     * DESSecretKey (алгоритм шифрования DES) со значением key.
     * Ключ key должен иметь длину 8 байт
     */
    public StringCrypter(byte[] key) {
        try {
            if (getMacAddress().isEmpty()) {
                updateSecretKey(new DESSecretKey(key));
            } else {
                //System.out.println(getMacAddress());
                updateSecretKey(new DESSecretKey(getMacAddress().getBytes()));
            }
        } catch (InvalidKeyException | NoSuchAlgorithmException | NoSuchPaddingException ex) {
            throw new IllegalArgumentException(ex.getMessage());
        }
    }

    public StringCrypter(SecretKey key) throws NoSuchPaddingException,
            NoSuchAlgorithmException,
            InvalidKeyException {
        updateSecretKey(key);
    }

    private void updateSecretKey(SecretKey key) throws NoSuchPaddingException,
            NoSuchAlgorithmException,
            InvalidKeyException {
        ecipher = Cipher.getInstance(key.getAlgorithm());
        dcipher = Cipher.getInstance(key.getAlgorithm());
        ecipher.init(Cipher.ENCRYPT_MODE, key);
        dcipher.init(Cipher.DECRYPT_MODE, key);
    }

    public static class DESSecretKey implements SecretKey {

        private final byte[] key;

        /**
         * ключ должен иметь длину 8 байт
         */
        public DESSecretKey(byte[] key) {
            this.key = key;
        }

        @Override
        public String getAlgorithm() {
            return "DES";
        }

        @Override
        public String getFormat() {
            return "RAW";
        }

        @Override
        public byte[] getEncoded() {
            return key;
        }
    }

    private Cipher ecipher;
    private Cipher dcipher;

    /**
     * Функция шифрования
     *
     * @param str строка открытого текста
     * @return зашифрованная строка в формате Base64
     */
    public String encrypt(String str) {
        try {
            byte[] utf8 = str.getBytes("UTF8");
            byte[] enc = ecipher.doFinal(utf8);
            return Base64.encodeBase64String(enc);
        } catch (IllegalBlockSizeException | BadPaddingException | UnsupportedEncodingException ex) {
            Logger.getLogger(StringCrypter.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     * Функция дешифрования
     *
     * @param str зашифрованная строка в формате Base64
     * @return расшифрованная строка
     */
    public String decrypt(String str) {
        try {
            byte[] dec = Base64.decodeBase64(str);
            byte[] utf8 = dcipher.doFinal(dec);
            return new String(utf8, "UTF8");
        } catch (IllegalBlockSizeException | BadPaddingException | IOException ex) {
            Logger.getLogger(StringCrypter.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}