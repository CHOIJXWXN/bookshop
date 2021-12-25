package com.bookshop.vo;

public class Ask {

	private int ask_id;
	private String writer;
	private String book_id;
	private String ask_title;
	private String ask_contents;
	private String ask_date;
	private String ask_sort;
	private String ask_status;
	private int askreply_count;
	private int available;
	
	public Ask() {}

	public Ask(int ask_id, String writer, String book_id, String ask_title, String ask_contents, String ask_date,
			String ask_sort, String ask_status, int askreply_count, int available) {
	
		this.ask_id = ask_id;
		this.writer = writer;
		this.book_id = book_id;
		this.ask_title = ask_title;
		this.ask_contents = ask_contents;
		this.ask_date = ask_date;
		this.ask_sort = ask_sort;
		this.ask_status = ask_status;
		this.askreply_count = askreply_count;
		this.available = available;
	}

	public int getAsk_id() {
		return ask_id;
	}

	public void setAsk_id(int ask_id) {
		this.ask_id = ask_id;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getBook_id() {
		return book_id;
	}

	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}

	public String getAsk_title() {
		return ask_title;
	}

	public void setAsk_title(String ask_title) {
		this.ask_title = ask_title;
	}

	public String getAsk_contents() {
		return ask_contents;
	}

	public void setAsk_contents(String ask_contents) {
		this.ask_contents = ask_contents;
	}

	public String getAsk_date() {
		return ask_date;
	}

	public void setAsk_date(String ask_date) {
		this.ask_date = ask_date;
	}

	public String getAsk_sort() {
		return ask_sort;
	}

	public void setAsk_sort(String ask_sort) {
		this.ask_sort = ask_sort;
	}

	public String getAsk_status() {
		return ask_status;
	}

	public void setAsk_status(String ask_status) {
		this.ask_status = ask_status;
	}

	public int getAskreply_count() {
		return askreply_count;
	}

	public void setAskreply_count(int askreply_count) {
		this.askreply_count = askreply_count;
	}

	public int getAvailable() {
		return available;
	}

	public void setAvailable(int available) {
		this.available = available;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
