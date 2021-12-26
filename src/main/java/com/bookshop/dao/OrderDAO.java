package com.bookshop.dao;

import java.util.List;

import com.bookshop.vo.Cart;
import com.bookshop.vo.CartPlus;
import com.bookshop.vo.OrderList;
import com.bookshop.vo.Orders;

public interface OrderDAO {
	
	public List<CartPlus> getCartPlus(String user_id) throws Exception;
	public CartPlus getCertainCartPlus(Cart cart) throws Exception;
	public int addCart(Cart cart) throws Exception;
	public void deleteCart(Cart cart) throws Exception;
	public void updateCntCart(Cart cart) throws Exception;
	public int getOrderCntToday() throws Exception;
	public int addOrder(Orders order) throws Exception;
	public void addOrderlist(OrderList orderList) throws Exception;
	public void changePoint(String user_id, int point_use, int point_add) throws Exception;
	public void changeSellTot(Cart cart) throws Exception;
	public Orders getOrderInfo(String user_id) throws Exception;

}