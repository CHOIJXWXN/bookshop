package com.bookshop.dao;

import java.util.List;

import com.bookshop.vo.Book;
import com.bookshop.vo.OrderList;
import com.bookshop.vo.Orders;
import com.bookshop.vo.Users;

public interface MemberDAO {

	// (마이페이지) 회원정보 불러오기
	public Users getUserInfo(String user_id) throws Exception;
		
	// (마이페이지) 회원정보 수정
	public void profile(Users users) throws Exception;
		
	// (마이페이지) 주문/배송 조회
	public Orders getOrders(String user_id) throws Exception;
	public List<OrderList> getOrderlist(String order_num) throws Exception;
	public Book getBook(String book_id) throws Exception;
		
	
}
