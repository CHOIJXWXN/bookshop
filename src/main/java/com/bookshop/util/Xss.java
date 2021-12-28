package com.bookshop.util;

public class Xss {
	
	public static String setXss(String str) {
		return str.replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
	}

}
