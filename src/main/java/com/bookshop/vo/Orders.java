package com.bookshop.vo;

public class Orders {
	
	private String order_num;
	private String user_id;
	private String order_name;
	private String order_addr;
	private int order_tot;
	private int ship_cost;
	private int final_cost;
	private String comments;
	private String order_date;
	private String order_status;
	
	public Orders() {

	}

	public Orders(String order_num, String user_id, String order_name, String order_addr, int order_tot, int ship_cost,
			int final_cost, String comments, String order_date, String order_status) {
		
		this.order_num = order_num;
		this.user_id = user_id;
		this.order_name = order_name;
		this.order_addr = order_addr;
		this.order_tot = order_tot;
		this.ship_cost = ship_cost;
		this.final_cost = final_cost;
		this.comments = comments;
		this.order_date = order_date;
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

	public String getOrder_name() {
		return order_name;
	}

	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}

	public String getOrder_addr() {
		return order_addr;
	}

	public void setOrder_addr(String order_addr) {
		this.order_addr = order_addr;
	}

	public int getOrder_tot() {
		return order_tot;
	}

	public void setOrder_tot(int order_tot) {
		this.order_tot = order_tot;
	}

	public int getShip_cost() {
		return ship_cost;
	}

	public void setShip_cost(int ship_cost) {
		this.ship_cost = ship_cost;
	}

	public int getFinal_cost() {
		return final_cost;
	}

	public void setFinal_cost(int final_cost) {
		this.final_cost = final_cost;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	public String getOrder_status() {
		return order_status;
	}

	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	
	
	
	
	
	
}
