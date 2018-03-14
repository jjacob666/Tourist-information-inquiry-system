package register_log;

import java.security.*;
//MD5字符串加密
public class Encrypter {
    public static String md5Encrypt(String s) throws Exception{
        //获取支持MD5加密的MessageDigest
        MessageDigest md5 = MessageDigest.getInstance("MD5");
        sun.misc.BASE64Encoder base64Encoder = new sun.misc.BASE64Encoder();
        //对字符串进行加密，并将加密的字符串按Base64格式进行编码，并将结果返回
        return base64Encoder.encode(md5.digest(s.getBytes("utf-8")));
    }
}
