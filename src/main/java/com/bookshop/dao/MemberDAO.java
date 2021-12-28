package com.bookshop.dao;

import java.util.List;

import com.bookshop.vo.Book;
import com.bookshop.vo.OrderList;
import com.bookshop.vo.Orders;
import com.bookshop.vo.Users;

public interface MemberDAO {
		
	// (마이페이지) 회원정보 수정
	public void profile(Users users) throws Exception;
		
	// (마이페이지) 주문/배송 조회
	// 1) 주문 목록 가져오기
	// user_id의 ORDERS 가져오기
	public List<Orders> getOrders(String user_id, int pageNumber) throws Exception;
	public List<OrderList> getOrderList(String order_num) throws Exception;
	
	// 2) 다음 페이지 존재하는지
	public Orders getPageIs(String user_id, int pageNum) throws Exception;
	
	// 3) 보유 포인트 가져오기
	public int getPoint(String user_id) throws Exception;
	
	// 4) 주문목록 건수 가져오기
	public int getOrderCnt(String user_id) throws Exception;
	
	
}
