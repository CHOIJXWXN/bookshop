package com.bookshop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bookshop.dao.MemberDAO;
import com.bookshop.dao.UsersDAO;
import com.bookshop.vo.Book;
import com.bookshop.vo.OrderList;
import com.bookshop.vo.Orders;
import com.bookshop.vo.Users;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	MemberDAO dao;

		// (마이페이지) 회원정보 불러오기 service
		@Override
		public Users getUserInfo(String user_id) throws Exception {
			
			Users users = dao.getUserInfo(user_id);
			
			return users;
		}
		
		
		// (마이페이지) 회원정보 수정 service
		@Override
		public void updateProfile(Users users) throws Exception {
			
			dao.profile(users);
			
		}

		// (마이페이지) 주문/배송 조회 service
		@Override
		public HashMap<String, Object> viewOrderlist(String user_id) throws Exception {
			
			Orders orders = dao.getOrders(user_id);
			List<OrderList> orderlist = dao.getOrderlist(orders.getOrder_num());
			String book_id = ((Map<String, Object>) orderlist.get(0)).get("book_id").toString();
			Book book = dao.getBook(book_id);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("orders", orders);
			map.put("orderlist", orderlist);
			map.put("book", book);
			
			return map;
		}

}
