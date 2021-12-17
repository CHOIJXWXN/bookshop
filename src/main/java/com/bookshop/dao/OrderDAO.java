package com.bookshop.dao;

import java.util.List;
import com.bookshop.vo.Cart;
import com.bookshop.vo.CartPlus;

public interface OrderDAO {
	
	public List<CartPlus> getCartPlus(String user_id) throws Exception;
	public int addCart(Cart cart) throws Exception;
	public void deleteCart(CartPlus cartPlus) throws Exception;

}
