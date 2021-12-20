package com.bookshop.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
	public CartPlus viewCertainCart(Cart cart) throws Exception {
		return dao.getCertainCartPlus(cart);
	}

	@Override
	public int addCart(Cart cart) throws Exception {
		return dao.addCart(cart);
	}

	@Override
	public void deleteCart(Cart cart) throws Exception {
		dao.deleteCart(cart);
	}

	@Override
	public void updateCart(Cart cart) throws Exception {
		dao.updateCntCart(cart);
	}

	@Override
	public String newOrderNum() throws Exception {		
		String today = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
		String count = String.format("%06d", dao.getOrderCntToday() + 1);
		return today + "-" + count;
	}

}