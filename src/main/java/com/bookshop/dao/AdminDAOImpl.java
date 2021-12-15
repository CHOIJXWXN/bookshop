package com.bookshop.dao;

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
	public List<OrderPlus> getOrderList(List<String> list) throws Exception {
		return sqlSession.selectList(SESSION + ".getOrderList", list);
	}

	@Override
	public void changeToStart(String order_num) throws Exception {
		sqlSession.update(SESSION + ".changeToStart", order_num);
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
	public int getBookCnt() throws Exception {
		return sqlSession.selectOne(SESSION + ".getBookCnt");
	}

	@Override
	public int getBookCntNovel() throws Exception {
		return sqlSession.selectOne(SESSION + ".getBookCntNovel");
	}

	@Override
	public int getBookCntPoem() throws Exception {
		return sqlSession.selectOne(SESSION + ".getBookCntPoem");
	}

	@Override
	public int getBookCntTravel() throws Exception {
		return sqlSession.selectOne(SESSION + ".getBookCntTravel");
	}

	@Override
	public List<Book> getBookList(int pageNum) throws Exception {
		int start = 20 * (pageNum - 1);
		return sqlSession.selectList(SESSION + ".getBookList", start);
	}

	@Override
	public void deleteBook(String book_id) throws Exception {
		sqlSession.delete(SESSION + ".deleteBook", book_id);
	}

}
