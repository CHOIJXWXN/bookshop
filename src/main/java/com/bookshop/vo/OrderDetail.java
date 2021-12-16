package com.bookshop.vo;

public class OrderDetail {

	private Book book;
	private int book_cnt;
	
	public OrderDetail() {	}

	public OrderDetail(Book book, int book_cnt) {
		
		this.book = book;
		this.book_cnt = book_cnt;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public int getBook_cnt() {
		return book_cnt;
	}

	public void setBook_cnt(int book_cnt) {
		this.book_cnt = book_cnt;
	}
	
	
	
	
	
}
