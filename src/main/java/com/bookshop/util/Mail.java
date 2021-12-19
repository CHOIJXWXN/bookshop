package com.bookshop.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Mail extends Authenticator {

	protected static String id;
	protected static String pw;
	
	public Mail() {
		id = "teambook3lcy@gmail.com";
		pw = "backEnd2021!";
	}
	
	protected PasswordAuthentication getPasswordAuthentication() {
		
		return new PasswordAuthentication(id, pw);
		
	}
	
}
