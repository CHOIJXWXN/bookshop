package com.bookshop.dao;

import com.bookshop.vo.Book;

public interface BoardDAO {

	
	// 도서정보 불러오기
	public Book getBookInfo(String book_id) throws Exception;
	
	
}
