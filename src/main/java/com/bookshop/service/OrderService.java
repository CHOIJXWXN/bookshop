package com.bookshop.service;

import java.util.List;

import com.bookshop.vo.Cart;
import com.bookshop.vo.CartPlus;
import com.bookshop.vo.Orders;

public interface OrderService {
	
	public List<CartPlus> viewCart(String user_id) throws Exception;
	public CartPlus viewCertainCart(Cart cart) throws Exception;
	public int addCart(Cart cart) throws Exception;
	public void deleteCart(Cart cart) throws Exception;
	public void updateCart(Cart cart) throws Exception;
	public String newOrderNum() throws Exception;
	public int addOrder(Orders order) throws Exception;
	public void point(String user_id, int point_use, int point_add) throws Exception;
	public void sellTot(Cart cart) throws Exception;
	
}