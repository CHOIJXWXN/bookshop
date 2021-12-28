package com.bookshop.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bookshop.vo.AskList;
import com.bookshop.vo.AskReply;
import com.bookshop.vo.Book;
import com.bookshop.vo.OrderPlus;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Inject
	SqlSession sqlSession;
	
	final String SESSION = "com.bookshop.mappers.admin";

	@Override
	public List<OrderPlus> getOrderListSeparate(int pageNum) throws Exception {
		int start = 20 * (pageNum - 1) + 1;
		int end = 20 * pageNum;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList(SESSION + ".getOrderListSeparate", map);
	}

	@Override
	public List<OrderPlus> getOrderListUnited(int pageNum) throws Exception {
		int start = 20 * (pageNum - 1) + 1;
		int end = 20 * pageNum;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList(SESSION + ".getOrderListUnited", map);
	}

	@Override
	public Object getNextPage(int pageNumber, String type) throws Exception {
		
		Object obj = null;
		
		if(type.equals("book")) {
			obj = sqlSession.selectOne(SESSION + ".getNextPageBook", pageNumber);
		}
		else if(type.equals("orders")) {
			obj = sqlSession.selectOne(SESSION + ".getNextPageOrders", pageNumber);
		} else if(type.equals("ask")) {
			obj = sqlSession.selectOne(SESSION + ".getNextPageAsk", pageNumber);
		}
		
		return obj;
	}
	
	@Override
	public void changeStatus(String order_status, String order_num) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("order_status", order_status);
		map.put("order_num", order_num);
		sqlSession.update(SESSION + ".changeStatus", map);
	}
	
	@Override
	public void addDelivery(String order_num, String tracking_num) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("order_num", order_num);
		map.put("tracking_num", tracking_num);
		sqlSession.update(SESSION + ".changeStatus", order_num);
		sqlSession.insert(SESSION + ".addDelivery", map); 
	}

	@Override
	public int getOrderCnt(String order_status) throws Exception {
		return sqlSession.selectOne(SESSION + ".getOrderCnt", order_status);
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

	
	@Override
	public List<AskList> getAdminAskList(int pageNum) throws Exception {
		int start = 20 * (pageNum - 1);
		return sqlSession.selectList(SESSION + ".getAdminAskList", start);
	}
	

}
