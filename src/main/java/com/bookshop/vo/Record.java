package com.bookshop.vo;

public class Record {
	
	private int record_id;
	private String user_id;
	private String book_id;
	private String record_init_date;
	private String record_fin_date;
	private int record_score;
	private String record_contents;
	private String record_date;
	
	public Record() {
	
	}

	public Record(int record_id, String user_id, String book_id, String record_init_date, String record_fin_date, int record_score,
			String record_contents, String record_date) {
		this.record_id = record_id;
		this.user_id = user_id;
		this.book_id = book_id;
		this.record_init_date = record_init_date;
		this.record_fin_date = record_fin_date;
		this.record_score = record_score;
		this.record_contents = record_contents;
		this.record_date = record_date;
	}
	
	public int getRecord_id() {
		return record_id;
	}
	
	public void setRecord_id(int record_id) {
		this.record_id = record_id;
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

	public String getRecord_date() {
		return record_date;
	}

	public void setRecord_date(String record_date) {
		this.record_date = record_date;
	}
	
}
