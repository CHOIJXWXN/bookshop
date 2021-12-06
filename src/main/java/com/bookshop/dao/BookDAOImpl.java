package com.bookshop.dao;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BookDAOImpl implements BookDAO {
	
	@Inject
	SqlSession sqlSession;
	
	final String SESSION = "com.bookshop.mappers.book";
	
	public List<Book> getBookListSell(int pageNum) throws Exception {
		return sqlSession.selectList(SESSION + ".getFirstBook_id_sell", pageNum);
	}
	
	public List<Book> getBookListNew(int pageNum) throws Exception {
		return sqlSession.selectList(SESSION + ".getFirstBook_id_new", pageNum);
	}
	
	public List<Book> getBookListReview(int pageNum) throws Exception {
		return sqlSession.selectList(SESSION + ".getFirstBook_id_review", pageNum);
	}
}
