package com.bookshop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bookshop.dao.BoardDAO;
import com.bookshop.vo.AskList;
import com.bookshop.vo.Book;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	BoardDAO dao;
	
	// 도서정보 불러오기
	@Override
	public Book getBookInfo(String book_id) throws Exception {
		
		Book book = dao.getBookInfo(book_id);
		
		return book;
	}
	
	// 리스트 불러오기
	@Override
	public List<AskList> getAskList(String writer) throws Exception {
		
		
		return dao.getAskList(writer);
	}


}
