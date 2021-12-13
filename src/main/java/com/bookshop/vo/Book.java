package com.bookshop.vo;

public class Book {
	
	private String book_id;
	private String book_title;
	private String book_writer;
	private String book_pub;
	private String book_date;
	private int book_price;
	private String book_genre;
	private int book_sell_tot;
	private String book_cover;
	private String book_intro;
	private String book_contents;
	
	public Book() {
	
	}

	public Book(String book_id, String book_title, String book_writer, String book_pub, String book_date,
			int book_price, String book_genre, int book_sell_tot, String book_cover, String book_intro,
			String book_contents) {
		this.book_id = book_id;
		this.book_title = book_title;
		this.book_writer = book_writer;
		this.book_pub = book_pub;
		this.book_date = book_date;
		this.book_price = book_price;
		this.book_genre = book_genre;
		this.book_sell_tot = book_sell_tot;
		this.book_cover = book_cover;
		this.book_intro = book_intro;
		this.book_contents = book_contents;
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

	public String getBook_pub() {
		return book_pub;
	}

	public void setBook_pub(String book_pub) {
		this.book_pub = book_pub;
	}

	public String getBook_date() {
		return book_date;
	}

	public void setBook_date(String book_date) {
		this.book_date = book_date;
	}

	public int getBook_price() {
		return book_price;
	}

	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}

	public String getBook_genre() {
		return book_genre;
	}

	public void setBook_genre(String book_genre) {
		this.book_genre = book_genre;
	}

	public int getBook_sell_tot() {
		return book_sell_tot;
	}

	public void setBook_sell_tot(int book_sell_tot) {
		this.book_sell_tot = book_sell_tot;
	}

	public String getBook_cover() {
		return book_cover;
	}

	public void setBook_cover(String book_cover) {
		this.book_cover = book_cover;
	}

	public String getBook_intro() {
		return book_intro;
	}

	public void setBook_intro(String book_intro) {
		this.book_intro = book_intro;
	}

	public String getBook_contents() {
		return book_contents;
	}

	public void setBook_contents(String book_contents) {
		this.book_contents = book_contents;
	}

}
