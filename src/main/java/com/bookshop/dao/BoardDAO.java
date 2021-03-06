package com.bookshop.dao;

import java.util.List;

import com.bookshop.vo.Ask;
import com.bookshop.vo.AskList;
import com.bookshop.vo.AskReply;
import com.bookshop.vo.Book;
import com.bookshop.vo.Users;

public interface BoardDAO {

	// ASK 테이블에서 Book_id 받아오기
	public String getBookid(int ask_id) throws Exception;
	
	// 목록 불러오기
	public List<AskList> getAskList(String writer, int pageNumber) throws Exception;
	
	// 다음페이지 존재
	public AskList getNextPage(String writer, int pageNumber) throws Exception;
	
	// 문의 글 쓰기
	public Ask writeAsk(Ask ask) throws Exception;
	
	// 문의글 불러오기
	public Ask getAsk(int ask_id) throws Exception;
	
	// 댓글 작성
	public void insertAskReply (AskReply askreply) throws Exception;
	
	// 댓글 불러오기
	public List<AskReply> getAskReplyList (int ask_id) throws Exception;
	
	// 댓글 갯수 update
	public void updateAskreplyCount(int ask_id) throws Exception;

	// 답변상태 update
	public void updateAsk_status(Ask ask) throws Exception;
	
	// 댓글 삭제
	
}