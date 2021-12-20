package com.bookshop.service;

import java.util.List;

import com.bookshop.vo.Cart;
import com.bookshop.vo.CartPlus;

public interface OrderService {
	
	public List<CartPlus> viewCart(String user_id) throws Exception;
	public CartPlus viewCertainCart(Cart cart) throws Exception;
	public int addCart(Cart cart) throws Exception;
	public void deleteCart(Cart cart) throws Exception;
	public void updateCart(Cart cart) throws Exception;
	public String newOrderNum() throws Exception;

}