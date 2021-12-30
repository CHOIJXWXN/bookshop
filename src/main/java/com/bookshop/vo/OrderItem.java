package com.bookshop.vo;

import java.util.List;

public class OrderItem {

	private Orders orders;
	private List<OrderDetail> list;
	private String tracking_num;
	
	public OrderItem() {}

	public OrderItem(Orders orders, List<OrderDetail> list, String tracking_num) {
		
		this.orders = orders;
		this.list = list;
		this.tracking_num = tracking_num;
	}

	public Orders getOrders() {
		return orders;
	}

	public void setOrders(Orders orders) {
		this.orders = orders;
	}

	public List<OrderDetail> getList() {
		return list;
	}

	public void setList(List<OrderDetail> list) {
		this.list = list;
	}

	public String getTracking_num() {
		return tracking_num;
	}

	public void setTracking_num(String tracking_num) {
		this.tracking_num = tracking_num;
	}
	
	
	
	
}
