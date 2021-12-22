package com.bookshop.vo;

public class RecordPlus {
	
	private int record_id;
	private String book_cover;
	private String book_title;
	private String book_writer;
	private String book_pub;
	private String record_init_date;
	private String record_fin_date;
	private int record_score;
	private String record_contents;
	
	public RecordPlus() {
	
	}
	
	public RecordPlus(int record_id, String book_cover, String book_title, String book_writer, String book_pub,
			String record_init_date, String record_fin_date, int record_score, String record_contents) {
		this.record_id = record_id;
		this.book_cover = book_cover;
		this.book_title = book_title;
		this.book_writer = book_writer;
		this.book_pub = book_pub;
		this.record_init_date = record_init_date;
		this.record_fin_date = record_fin_date;
		this.record_score = record_score;
		this.record_contents = record_contents;
	}

	public int getRecord_id() {
		return record_id;
	}

	public void setRecord_id(int record_id) {
		this.record_id = record_id;
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

	public String getBook_pub() {
		return book_pub;
	}

	public void setBook_pub(String book_pub) {
		this.book_pub = book_pub;
	}

	public String getRecord_init_date() {
		return record_init_date;
	}

	public void setRecord_init_date(String record_init_date) {
		this.record_init_date = record_init_date;
	}

	public String getRecord_fin_date() {
		return record_fin_date;
	}

	public void setRecord_fin_date(String record_fin_date) {
		this.record_fin_date = record_fin_date;
	}

	public int getRecord_score() {
		return record_score;
	}

	public void setRecord_score(int record_score) {
		this.record_score = record_score;
	}

	public String getRecord_contents() {
		return record_contents;
	}

	public void setRecord_contents(String record_contents) {
		this.record_contents = record_contents;
	}

}
