package com.bookshop.vo;

public class OrderList {
	
	private String order_num;
	private String book_id;
	private int book_cnt;
	
	public OrderList() {	}

	public OrderList(String order_num, String book_id, int book_cnt) {
	
		this.order_num = order_num;
		this.book_id = book_id;
		this.book_cnt = book_cnt;
	}

	public String getOrder_num() {
		return order_num;
	}

	public void setOrder_num(String order_num) {
		this.order_num = order_num;
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
