package com.bookshop.vo;

public class Users {
	
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_birth;
	private String user_nickname;
	private String user_email;
	private String user_phone;
	private String user_addr;
	private int user_point;
	private int user_admin;
	private String user_init_genre;
	
	
	public Users() {}


	public Users(String user_id, String user_pw, String user_name, String user_birth, String user_nickname,
			String user_email, String user_phone, String user_addr, int user_point, int user_admin,
			String user_init_genre) {
		
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_birth = user_birth;
		this.user_nickname = user_nickname;
		this.user_email = user_email;
		this.user_phone = user_phone;
		this.user_addr = user_addr;
		this.user_point = user_point;
		this.user_admin = user_admin;
		this.user_init_genre = user_init_genre;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getUser_pw() {
		return user_pw;
	}


	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


	public String getUser_birth() {
		return user_birth;
	}


	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}


	public String getUser_nickname() {
		return user_nickname;
	}


	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}


	public String getUser_email() {
		return user_email;
	}


	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}


	public String getUser_phone() {
		return user_phone;
	}


	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}


	public String getUser_addr() {
		return user_addr;
	}


	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}


	public int getUser_point() {
		return user_point;
	}


	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}


	public int getUser_admin() {
		return user_admin;
	}


	public void setUser_admin(int user_admin) {
		this.user_admin = user_admin;
	}


	public String getUser_init_genre() {
		return user_init_genre;
	}


	public void setUser_init_genre(String user_init_genre) {
		this.user_init_genre = user_init_genre;
	}
	
	
	
	
	
	
}
