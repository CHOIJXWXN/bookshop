package com.bookshop.service;

import com.bookshop.vo.Book;

public interface BoardService {

	
	// 도서정보 불러오기 service
	public Book getBookInfo(String book_id) throws Exception;
	
	
}
