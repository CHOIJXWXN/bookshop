package com.bookshop.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bookshop.vo.Book;
import com.bookshop.vo.OrderPlus;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Inject
	SqlSession sqlSession;
	
	final String SESSION = "com.bookshop.mappers.admin";
	
	@Override
	public List<String> getOrderNumList(int pageNum) throws Exception {
		int start = 20 * (pageNum - 1);
		return sqlSession.selectList(SESSION + ".getOrderNumList", start);
	}

	@Override
	public List<OrderPlus> getOrderListSeparate(List<String> list) throws Exception {
		return sqlSession.selectList(SESSION + ".getOrderListSeparate", list);
	}

	@Override
	public List<OrderPlus> getOrderListUnited(List<String> list) throws Exception {
		return sqlSession.selectList(SESSION + ".getOrderListUnited", list);
	}

	@Override
	public void changeToStart(String order_num) throws Exception {
		sqlSession.update(SESSION + ".changeToStart", order_num);
	}
	
	@Override
	public void addDelivery(String order_num, String tracking_num) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("order_num", order_num);
		map.put("tracking_num", tracking_num);
		sqlSession.update(SESSION + ".changeToStart", order_num);
		sqlSession.insert(SESSION + ".addDelivery", map); 
	}

	@Override
	public void changeToEnd(String order_num) throws Exception {
		sqlSession.update(SESSION + ".changeToEnd", order_num);
	}

	@Override
	public int getBeforeStartCnt() throws Exception {
		return sqlSession.selectOne(SESSION + ".getBeforeStartCnt");
	}

	@Override
	public int getStartCnt() throws Exception {
		return sqlSession.selectOne(SESSION + ".getStartCnt");
	}

	@Override
	public int getEndCnt() throws Exception {
		return sqlSession.selectOne(SESSION + ".getEndCnt");
	}

	@Override
	public int getTotCnt() throws Exception {
		return sqlSession.selectOne(SESSION + ".getTotCnt");
	}

	@Override
	public List<Book> getBookList(int pageNum) throws Exception {
		int start = 20 * (pageNum - 1);
		return sqlSession.selectList(SESSION + ".getBookList", start);
	}

	@Override
	public void deleteBook(String book_id) throws Exception {
		sqlSession.update(SESSION + ".deleteBook", book_id);
	}

	@Override
	public void addBook(Book book) throws Exception {
		sqlSession.insert(SESSION + ".addBook", book);
	}

}
