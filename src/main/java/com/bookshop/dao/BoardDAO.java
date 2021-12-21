package com.bookshop.dao;

import java.util.List;

import com.bookshop.vo.AskList;
import com.bookshop.vo.Book;

public interface BoardDAO {

	
	// 도서정보 불러오기
	public Book getBookInfo(String book_id) throws Exception;
	
	// 목록 불러오기
	public List<AskList> getAskList(String writer) throws Exception;
	
	
}
