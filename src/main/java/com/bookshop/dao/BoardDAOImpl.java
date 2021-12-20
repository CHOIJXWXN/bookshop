package com.bookshop.dao;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bookshop.vo.Book;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	SqlSession sqlSession;
	
	final String SESSION = "com.bookshop.mappers.board";

	// 도서정보 불러오기
	@Override
	public Book getBookInfo(String book_id) throws Exception {
		
		return sqlSession.selectOne(SESSION + ".getBookInfo", book_id);
		
	}

	

}
