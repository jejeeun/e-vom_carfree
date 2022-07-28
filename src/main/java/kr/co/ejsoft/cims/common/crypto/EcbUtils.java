package kr.co.ejsoft.cims.common.crypto;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

import kr.co.ejsoft.cims.common.crypto.padding.ZeroPadding;
import kr.co.ejsoft.cims.common.crypto.symm.LEA;
import kr.co.ejsoft.cims.common.crypto.BlockCipher.Mode;

public class EcbUtils {
	
	private static byte[] key; 

	static BlockCipherMode cipher;	
	
	public EcbUtils(byte[] key) {
		EcbUtils.key = key;
		
		// 객체 생성
		cipher = new LEA.ECB();
	}
	
	// 암호화
    public byte[] encrypt(String data) {    
		cipher.init(Mode.ENCRYPT, key);
		cipher.setPadding(new ZeroPadding(16));

        byte[] ct1 = cipher.doFinal(data.getBytes(StandardCharsets.UTF_8));
        cipher.reset();

        return ct1;
    }
	
    //복호화
    public String decrypt(byte[] encryptData) {
    	cipher.init(Mode.DECRYPT, key);
    	cipher.setPadding(new ZeroPadding(16));
    
        byte[] ct1 = cipher.doFinal(encryptData);

        String result = new String(ct1, StandardCharsets.UTF_8);
        cipher.reset();
        
        return result;
    }
  	
	// byteArrayToHex
  	public static String byteArrayToHex(byte[] a) {
	    StringBuilder sb = new StringBuilder();
	    for(final byte b: a)
	        sb.append(String.format("%02x", b&0xff));
	    return sb.toString();
	}
  	
	// byteArrayToHexString
  	public static List<String> byteArrayToHexArray(byte[] a) {
	    List<String> arr = new ArrayList<String>();
	    for(final byte b: a)
	    	arr.add(String.format("%02x", b&0xff));
	    return arr;
	}
  	
 // hexStringtoByteArray
  	public static byte[] hexToByteArray(String hex) {
  		  hex = hex.replaceAll("\"", "\\\""); /*" */
  		  if (hex == null || hex.length() == 0) {
  		    return null;
  		  }
  		  byte[] ba = new byte[hex.length() / 2];
  		  for (int i = 0; i < ba.length; i++) {
  		    ba[i] = (byte) Integer.parseInt(hex.substring(2 * i, 2 * i + 2), 16);
  		  }
  		  return ba;
  	}
}