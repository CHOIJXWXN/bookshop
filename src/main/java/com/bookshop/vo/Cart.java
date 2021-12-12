package com.bookshop.vo;

public class Cart {
	
	private String user_id;
	private String book_id;
	private int book_cnt;
	
	public Cart() {
	
	}

	public Cart(String user_id, String book_id, int book_cnt) {
		this.user_id = user_id;
		this.book_id = book_id;
		this.book_cnt = book_cnt;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getBook_id() {
		return book_id;
	}

	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}

	public int getBook_cnt() {
		return book_cnt;
	}

	public void setBook_cnt(int book_cnt) {
		this.book_cnt = book_cnt;
	}

}
