package com.bookshop.vo;

import com.bookshop.util.Xss;

public class AskReply {
	
	private int askreply_id;			
	private int ask_id;				
	private String writer;				
	private String askreply_contents;	
	private String askreply_date;
	
	public AskReply() {}

	public AskReply(int askreply_id, int ask_id, String writer, String askreply_contents, String askreply_date) {
		this.askreply_id = askreply_id;
		this.ask_id = ask_id;
		this.writer = writer;
		this.askreply_contents = askreply_contents;
		this.askreply_date = askreply_date;
	}

	public int getAskreply_id() {
		return askreply_id;
	}

	public void setAskreply_id(int askreply_id) {
		this.askreply_id = askreply_id;
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

	public String getAskreply_contents() {
		return askreply_contents;
	}

	public void setAskreply_contents(String askreply_contents) {
		this.askreply_contents = askreply_contents;
	}

	public String getAskreply_date() {
		return askreply_date;
	}

	public void setAskreply_date(String askreply_date) {
		this.askreply_date = askreply_date;
	}
	
	
}
