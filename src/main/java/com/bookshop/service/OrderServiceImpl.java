package com.bookshop.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.bookshop.dao.MemberDAO;
import com.bookshop.dao.OrderDAO;
import com.bookshop.vo.Cart;
import com.bookshop.vo.CartPlus;
import com.bookshop.vo.OrderList;
import com.bookshop.vo.Orders;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Inject
	OrderDAO dao;
	@Inject
	MemberDAO mdao;

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

	@Override
	public int addOrder(Orders order) throws Exception {
		return dao.addOrder(order);
	}

	@Override
	public void addOrderlist(OrderList orderList) throws Exception {
		dao.addOrderlist(orderList);
	}

	@Override
	public void point(String user_id, int point_use, int point_add) throws Exception {
		dao.changePoint(user_id, point_use, point_add);
	}

	@Override
	public void sellTot(Cart cart) throws Exception {
		dao.changeSellTot(cart);
	}

	@Override
	public HashMap<String, Object> orderInfo(String user_id) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("order", dao.getOrderInfo(user_id));
		map.put("point", mdao.getPoint(user_id));
		return map;
	}

}