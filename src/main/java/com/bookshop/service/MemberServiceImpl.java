package com.bookshop.service;

import java.util.ArrayList;
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
		// 1) 주문 목록 가져오기
		@Override
		public HashMap<String, Object> viewOrderlist(String user_id) throws Exception {
			
			// 유저 아이디에 일치하는 주문번호, 주문날짜, 주문상태 리스트 가져오기
			List<Orders> orders = (List<Orders>) dao.getOrders(user_id);
			
			for(int i = 0; i < orders.size(); i++) {
				
				// 주문번호에 속하는 책아이디, 책별 구매수량 가져오기
				List<OrderList> orderlist = dao.getOrderlist(orders.get(i).getOrder_num());
				
				HashMap<String, Object> ordermap = new HashMap<String, Object>();			
				ordermap.put("ordernum", orderlist.get(i).getOrder_num());
				ordermap.put("book_cnt", orderlist.get(i).getBook_cnt());
				
				List list = new ArrayList();
				
				for(int j = 0; j < orderlist.size(); j++) {
					
					// 책아이디별 책 정보 가져오기
					Book book = dao.getBook(orderlist.get(i).getBook_id());
					
					HashMap<String, Object> bookmap = new HashMap<String, Object>();
					bookmap.put("book_id", book.getBook_id());
					bookmap.put("book_title", book.getBook_title());
					bookmap.put("book_writer", book.getBook_writer());
					bookmap.put("book_price", book.getBook_price());
					bookmap.put("book_cover", book.getBook_cover());
					
					list.add(bookmap);
				}
				
				List list2 = new ArrayList();
				list2.add(list);
				ordermap.put("booklist", list2);
			}
			
			String book_id = ((Map<String, Object>) orderlist.get(0)).get("book_id").toString();
			Book book = dao.getBook(book_id);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("orders", orders);
			map.put("orderlist", orderlist);
			map.put("book", book);
			
			return map;
		}
		
		// 2) 보유 포인트 가져오기
		@Override
		public int getPoint(String user_id) throws Exception {
			
			int point = 0;
			point = dao.getPoint(user_id);
			
			return point;
		}
		

}
