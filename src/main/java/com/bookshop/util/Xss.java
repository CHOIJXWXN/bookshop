package com.bookshop.util;

public class Xss {
	
	public static String setXss(String str) {
		return str.replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
	}
	
	public static String setXssScript(String str) {
		return str.replaceAll("&lt;script&gt;", "").replaceAll("&lt;/script&gt;", "");
	}

}
