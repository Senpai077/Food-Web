package com.ty.security;

import java.security.spec.KeySpec;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

public class EncryptAndDecrypt {

	private static final String SECRET_KEY="123456";
	private static final String SALT_VALUE="abcdef";
	
	public String encrypt(String value) {
		try {
		IvParameterSpec ivParameterSpec=new IvParameterSpec(new byte[16]);
		/**create factory for secret key*/
		SecretKeyFactory keyFactory=SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
		KeySpec keySpec=new PBEKeySpec(SECRET_KEY.toCharArray(),SALT_VALUE.getBytes(),65536,256);
		SecretKey temp=keyFactory.generateSecret(keySpec);
		SecretKeySpec secretKeySpec=new SecretKeySpec(temp.getEncoded(), "AES");
		Cipher cipher=Cipher.getInstance("AES/CBC/PKCS5Padding");
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
}
