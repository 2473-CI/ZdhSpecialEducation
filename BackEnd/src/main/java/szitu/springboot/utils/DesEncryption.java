package szitu.springboot.utils;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import java.util.Base64;

public class DesEncryption {

    private static final String KEY = "MNSTmed ";

    public static String encode(String plaintext) throws Exception {
        return encrypt(plaintext, KEY);
    }

    public static String decode(String ciphertext) throws Exception {
        return decrypt(ciphertext, KEY);
    }

    public static String encrypt(String plaintext, String key) throws Exception {
        DESKeySpec desKeySpec = new DESKeySpec(key.getBytes());
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
        SecretKey secretKey = keyFactory.generateSecret(desKeySpec);
        Cipher cipher = Cipher.getInstance("DES/ECB/PKCS5Padding");
        cipher.init(Cipher.ENCRYPT_MODE, secretKey);
        byte[] encrypted = cipher.doFinal(plaintext.getBytes());
        return Base64.getEncoder().encodeToString(encrypted);
    }

    public static String decrypt(String ciphertext, String key) throws Exception {
        DESKeySpec desKeySpec = new DESKeySpec(key.getBytes());
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
        SecretKey secretKey = keyFactory.generateSecret(desKeySpec);
        Cipher cipher = Cipher.getInstance("DES/ECB/PKCS5Padding");
        cipher.init(Cipher.DECRYPT_MODE, secretKey);
        byte[] decoded = Base64.getDecoder().decode(ciphertext);
        byte[] decrypted = cipher.doFinal(decoded);
        return new String(decrypted);
    }

    public static void main(String[] args) throws Exception {
        String str = "OAB5w5D0vACTEApZoLpJNmiUicNr5XlE/TmbjD4kaleyfNe4aD1mGggNYyWKEnSxZbUlBjeYPFv0cj1YRtOQDFn0iE8NFQunrd31gaoKVsiCGPHKYKr0f0oHEMnoGitn9cJRksyJ3OYbeR9rWJscw+Qq24Yg84PH+QHGNvUrgM6xES/soLX9zg==";
        String decode = DesEncryption.decode(str);
        System.out.println(decode);
    }
}
