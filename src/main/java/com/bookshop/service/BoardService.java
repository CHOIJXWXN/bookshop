package com.bookshop.service;

import java.util.List;

import com.bookshop.vo.Ask;
import com.bookshop.vo.AskList;
import com.bookshop.vo.Book;

public interface BoardService {

	
	// 도서정보 불러오기 service
	public Book getBookInfo(String book_id) throws Exception;
	
	// 리스트불러오기
	public List<AskList> getAskList(String writer) throws Exception;
	
	// 문의글 쓰기 Action
	public void wrtieAction(Ask ask) throws Exception;
	
	
}
