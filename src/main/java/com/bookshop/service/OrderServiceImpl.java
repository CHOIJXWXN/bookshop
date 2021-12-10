package com.bookshop.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.bookshop.dao.OrderDAO;
import com.bookshop.vo.Cart;
import com.bookshop.vo.CartPlus;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Inject
	OrderDAO dao;

	@Override
	public List<CartPlus> viewCart(String user_id) throws Exception {
		return dao.getCartPlus(user_id);
	}

	@Override
	public void addCart(Cart cart) throws Exception {
		dao.addCart(cart);
	}

	@Override
	public void deleteCart(Cart cart) throws Exception {
		dao.deleteCart(cart);
	}

}
