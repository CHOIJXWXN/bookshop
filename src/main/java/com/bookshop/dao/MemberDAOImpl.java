package com.bookshop.dao;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bookshop.vo.Book;
import com.bookshop.vo.OrderList;
import com.bookshop.vo.Orders;
import com.bookshop.vo.Users;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession sqlSession;
	
	final String SESSION = "com.bookshop.mappers.member";

	// (마이페이지) 회원정보 불러오기
	@Override
	public Users getUserInfo(String user_id) throws Exception {
				
		return sqlSession.selectOne(SESSION + ".getUserInfo", user_id);
	}
		
		
	// (마이페이지) 회원정보 수정
	@Override
	public void profile(Users users) throws Exception {
			
		sqlSession.update(SESSION + ".profile", users);
			
	}

	// (마이페이지) 주문/배송 조회
	// 1) 주문목록 가져오기
	// user_id의 ORDERS 가져오기
	@Override
	public List<Orders> getOrders(String user_id) throws Exception {
		
		return sqlSession.selectList(SESSION + ".getOrders", user_id);
		
		
	}
	// order_num 의 orderlist 가져오기
	@Override
	public List<OrderList> getOrderList(String order_num) throws Exception {
		
		return sqlSession.selectList(SESSION + ".getOrderList", order_num);
	}
	// book_id의 book info 가져오기
	@Override
	public Book getBook(String book_id) throws Exception {
		
		return sqlSession.selectOne(SESSION + ".getBook", book_id);
		
	}

	// 2) 보유 포인트 가져오기
	@Override
	public int getPoint(String user_id) throws Exception {
				
		return sqlSession.selectOne(SESSION + ".getPoint", user_id);
		
	}

	// 3) 주문목록 건수 가져오기
	@Override
	public int getOrderCnt(String user_id) throws Exception {
		
		return sqlSession.selectOne(SESSION + ".getOrderCnt", user_id);
	}

	// 4) 최신 주문번호 조회하기
	@Override
	public String getRecentOrderNum(String user_id) throws Exception {
		
		return sqlSession.selectOne(SESSION + ".getRecentOrderNum", user_id);
	}


	


	


	
	
}
