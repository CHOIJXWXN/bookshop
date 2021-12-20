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
		public List<OrderItem> viewOrderList(String user_id, int pageNumber) throws Exception {
			
			// 최종 결과를 넣을 리스트 선언
			List<OrderItem> ResultList = new ArrayList<OrderItem>();

			// 'user_id'의 ORDERS를 리스트로 들고옴
			List<Orders> orders = dao.getOrders(user_id, pageNumber);
			
			
			for(int i = 0; i < orders.size(); i++) {
				
				// 주문번호에 속하는 책아이디, 구매수량 가져오기
				List<OrderList> orderlist = dao.getOrderList(orders.get(i).getOrder_num());
				
				// 주문번호별 책 정보들을 담을 리스트 선언			
				List<OrderDetail> booklist = new ArrayList<OrderDetail>();
				
				for(int j = 0; j < orderlist.size(); j++) {
					
					// 책아이디별 책 정보 가져오기
					Book book = dao.getBook(orderlist.get(j).getBook_id());
					
					OrderDetail orderDetail = new OrderDetail(book, orderlist.get(j).getBook_cnt());
									
					booklist.add(orderDetail);
				}
				
				OrderItem orderItem = new OrderItem(orders.get(i), booklist);
				
				ResultList.add(orderItem);
			}
				
			return ResultList;
		}
		
		// 2) (페이징) 다음 페이지 존재하는지 
		@Override
		public boolean getPageIs(String user_id, int pageNumber) throws Exception {
			
			int pageNum = (pageNumber * 2) + 1;
			
			return dao.getPageIs(user_id, pageNum) != null;
		}
		
		// 3) 보유 포인트 가져오기
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
