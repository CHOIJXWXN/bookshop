package com.bookshop.dao;

import java.util.List;

import com.bookshop.vo.Ask;
import com.bookshop.vo.AskList;
import com.bookshop.vo.AskReply;
import com.bookshop.vo.Book;
import com.bookshop.vo.Users;

public interface BoardDAO {

	
	// 도서정보 불러오기
	public Book getBookInfo(String book_id) throws Exception;
	
	// ASK 테이블에서 Book_id 받아오기
	public String getBookid(int ask_id) throws Exception;
	
	// 목록 불러오기
	public List<AskList> getAskList(String writer) throws Exception;
	
	// 문의 글 쓰기
	public Ask writeAsk(Ask ask) throws Exception;
	
	// 문의글 불러오기
	public Ask getAsk(int ask_id) throws Exception;
	
	// 댓글 작성
	public void insertAskReply (AskReply askreply) throws Exception;
	
	// 댓글 불러오기
	public List<AskReply> getAskReplyList (int ask_id) throws Exception;
	
	// 댓글 삭제
	public void deleteAskReply(int askreply_id) throws Exception;
	
	// 댓글 갯수 update
	public void updateAskreplyCount(int ask_id) throws Exception;
	
	// 유저 정보 불러오기
	public Users getUserInfo(String user_id) throws Exception;
}