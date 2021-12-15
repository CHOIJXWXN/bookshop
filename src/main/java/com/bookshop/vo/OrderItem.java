package com.bookshop.vo;

import java.util.List;

public class OrderItem {

	private Orders orders;
	private List<OrderDetail> list;
	
	public OrderItem() {}

	public OrderItem(Orders orders, List<OrderDetail> list) {
		
		this.orders = orders;
		this.list = list;
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
	
	
	
	
}
