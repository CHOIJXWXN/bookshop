package com.bookshop.vo;

public class OrderPlus {
	
	private String order_num;
	private String user_id;
	private String book_id;
	private String book_title;
	private String book_writer;
	private int book_price;
	private int book_cnt;
	private int order_status;

	public OrderPlus() {
	
	}

	public OrderPlus(String order_num, String user_id, String book_id, String book_title, String book_writer,
			int book_price, int book_cnt, int order_status) {
		this.order_num = order_num;
		this.user_id = user_id;
		this.book_id = book_id;
		this.book_title = book_title;
		this.book_writer = book_writer;
		this.book_price = book_price;
		this.book_cnt = book_cnt;
		this.order_status = order_status;
	}

	public String getOrder_num() {
		return order_num;
	}

	public void setOrder_num(String order_num) {
		this.order_num = order_num;
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

	public int getBook_price() {
		return book_price;
	}

	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}

	public int getBook_cnt() {
		return book_cnt;
	}

	public void setBook_cnt(int book_cnt) {
		this.book_cnt = book_cnt;
	}

	public int getOrder_status() {
		return order_status;
	}

	public void setOrder_status(int order_status) {
		this.order_status = order_status;
	}
	
}
