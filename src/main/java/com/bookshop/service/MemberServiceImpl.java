package com.bookshop.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bookshop.dao.MemberDAO;
import com.bookshop.vo.Book;
import com.bookshop.vo.OrderDetail;
import com.bookshop.vo.OrderItem;
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
		public List<HashMap<String, Object>> viewOrderList(String user_id) throws Exception {
			
			// user_id의 ORDERS를 리스트로 들고옴
			List<Orders> orders = dao.getOrders(user_id);
			List<HashMap<String, Object>> resultlist = new ArrayList<HashMap<String, Object>>();
			
			// 첫번째 order_num부터 넘겨주면서 주문 책 리스트를 들고옴			
			for(int i = 0; i < orders.size(); i++) {
				HashMap<String, Object> orderMap = new HashMap<String, Object>();
				
				List<OrderList> orderlist = dao.getOrderList(orders.get(i).getOrder_num());
				
				List<HashMap<String, Object>> booklist = new ArrayList<HashMap<String, Object>>();
				
				for(int j = 0; j < orderlist.size(); j++) {
					Book book = dao.getBook(orderlist.get(j).getBook_id());
					
					HashMap<String, Object> bookMap = new HashMap<String, Object>();
					bookMap.put("book_id", orderlist.get(i).getBook_id());
					bookMap.put("book_cover", book.getBook_cover());
					bookMap.put("book_title", book.getBook_title());
					bookMap.put("book_writer", book.getBook_writer());
					bookMap.put("book_price", book.getBook_price());
					bookMap.put("book_cnt", orderlist.get(j).getBook_cnt());
					
					booklist.add(bookMap);
				}

				orderMap.put("order_num", orders.get(i).getOrder_num());
				orderMap.put("order_date", orders.get(i).getOrder_date());
				orderMap.put("booklist", booklist);
				orderMap.put("order_status", orders.get(i).getOrder_status());
				
				resultlist.add(orderMap);
				
			}
			
			
			
			return resultlist;
		}
		
		// 2) 보유 포인트 가져오기
		@Override
		public int getPoint(String user_id) throws Exception {
			
			int point = 0;
			point = dao.getPoint(user_id);
			
			return point;
		}

		// 4) 주문목록 건수 가져오기
		@Override
		public int getOrderCnt(String user_id) throws Exception {
			
			int order_cnt = 0;
			order_cnt = dao.getOrderCnt(user_id);

			return order_cnt;
			
		}


		
		

}
