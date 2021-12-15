package com.bookshop.vo;

public class CartPlus {
	
	private String book_id;
	private String book_cover;
	private String book_title;
	private String book_writer;
	private int book_cnt;
	private int book_price;
	
	public CartPlus() {
	
	}

	public CartPlus(String book_id, String book_cover, String book_title, String book_writer, int book_cnt, int book_price) {
		this.book_id = book_id;
		this.book_cover = book_cover;
		this.book_title = book_title;
		this.book_writer = book_writer;
		this.book_cnt = book_cnt;
		this.book_price = book_price;
	}
	
	public String getBook_id() {
		return book_id;
	}
	
	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}
	
	public String getBook_cover() {
		return book_cover;
	}

	public void setBook_cover(String book_cover) {
		this.book_cover = book_cover;
	}

	public String getBook_title() {
		return book_title;
	}

	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}

	public String getBook_writer() {
		return book_writer;
	}

	public void setBook_writer(String book_writer) {
		this.book_writer = book_writer;
	}

	public int getBook_cnt() {
		return book_cnt;
	}

	public void setBook_cnt(int book_cnt) {
		this.book_cnt = book_cnt;
	}

	public int getBook_price() {
		return book_price;
	}

	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}

}
