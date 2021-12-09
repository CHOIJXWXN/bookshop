package com.bookshop.dao;

import java.util.List;

import com.bookshop.vo.CartPlus;

public interface OrderDAO {
	
	public List<CartPlus> getCartPlus(String user_id);

}
