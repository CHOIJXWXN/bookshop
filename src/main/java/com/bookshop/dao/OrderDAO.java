package com.bookshop.dao;

import java.util.List;
import com.bookshop.vo.Cart;
import com.bookshop.vo.CartPlus;

public interface OrderDAO {
	
	public List<CartPlus> getCartPlus(String user_id);
	public void addCart(Cart cart);
	public void deleteCart(Cart cart);

}
