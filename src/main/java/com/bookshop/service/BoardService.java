package com.bookshop.service;

import java.util.HashMap;
import java.util.List;

import com.bookshop.vo.Ask;
import com.bookshop.vo.AskList;
import com.bookshop.vo.AskReply;
import com.bookshop.vo.Book;
import com.bookshop.vo.Users;

public interface BoardService {

	
	// 도서정보 불러오기 service
	public Book getBookInfo(String book_id) throws Exception;
	
	// 북 아이디 넘겨받기 ask 테이블에서
	public String getBookid(int ask_id) throws Exception;
	
	// 리스트불러오기
	public List<AskList> getAskList(String writer, int pageNumber) throws Exception;

	// 다음페이지 존재하는지
	public boolean getNextPage(String writer, int pageNumber) throws Exception;
	
	// 문의글 쓰기 Action
	public void writeAction(Ask ask) throws Exception;
	
	// 문의글 불러오기
	// public Ask boardView(int ask_id) throws Exception;
	public HashMap<String, Object> boardView(int ask_id) throws Exception;
	
	
	// 댓글 작성 & 불러오기 (ajax)
	// 반환 타입 : List<AskReply>, 파라미터 : askreply (받아와서 사용할 값)
	public List<AskReply> insertAskReply(AskReply askreply) throws Exception;
	
	// 댓글 삭제
	public List<AskReply> deleteAskReply(AskReply askreply) throws Exception;
	
	// 댓글 갯수 추가
	public void updateAskreplyCount(int ask_id) throws Exception;
	
	// 유저 아이디 불러오기
	public Users getUserInfo(String user_id) throws Exception;
	
	// 답변 상태 update admin
	public void updateAskstatusA(Ask ask) throws Exception;
	
	// 답변 상태 upadte user
	public void updateAskstatusU(Ask ask) throws Exception;
	
	
}
