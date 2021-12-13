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
		@Override
		public Orders getOrders(String user_id) throws Exception {
			
			return sqlSession.selectOne(SESSION + ".getOrders", user_id);
		}

		@Override
		public List<OrderList> getOrderlist(String order_num) throws Exception {
			
			return sqlSession.selectList(SESSION + ".getOrderlist", order_num);
		}

		@Override
		public Book getBook(String book_id) throws Exception {
			
			return sqlSession.selectOne(SESSION + ".getBook", book_id);
		}
	
}
