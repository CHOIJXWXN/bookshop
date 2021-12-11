package com.bookshop.vo;

public class Review {
	
	private int review_id;
	private String user_id;
	private String book_id;
	private int review_score;
	private String review_contents;
	private String review_date;

	public Review() {
	
	}

	public Review(int review_id, String user_id, String book_id, int review_score, String review_contents, String review_date) {
		this.review_id = review_id;
		this.user_id = user_id;
		this.book_id = book_id;
		this.review_score = review_score;
		this.review_contents = review_contents;
		this.review_date = review_date;
	}

	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
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

	public int getReview_score() {
		return review_score;
	}

	public void setReview_score(int review_score) {
		this.review_score = review_score;
	}

	public String getReview_contents() {
		return review_contents;
	}

	public void setReview_contents(String review_contents) {
		this.review_contents = review_contents;
	}

	public String getReview_date() {
		return review_date;
	}

	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	
}
