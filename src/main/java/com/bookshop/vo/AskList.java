package com.bookshop.vo;

public class AskList {

	private int ask_id;
	private String book_title;
	private String ask_sort;
	private String ask_date;
	private String book_cover;
	
	public AskList() {}

	public AskList(int ask_id, String book_title, String ask_sort, String ask_date, String book_cover) {
		this.ask_id = ask_id;
		this.book_title = book_title;
		this.ask_sort = ask_sort;
		this.ask_date = ask_date;
		this.book_cover = book_cover;
	}

	public int getAsk_id() {
		return ask_id;
	}

	public void setAsk_id(int ask_id) {
		this.ask_id = ask_id;
	}

	public String getBook_title() {
		return book_title;
	}

	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}

	public String getAsk_sort() {
		return ask_sort;
	}

	public void setAsk_sort(String ask_sort) {
		this.ask_sort = ask_sort;
	}

	public String getAsk_date() {
		return ask_date;
	}

	public void setAsk_date(String ask_date) {
		this.ask_date = ask_date;
	}

	public String getBook_cover() {
		return book_cover;
	}

	public void setBook_cover(String book_cover) {
		this.book_cover = book_cover;
	}
	
	
	

	
	
	
	
}
