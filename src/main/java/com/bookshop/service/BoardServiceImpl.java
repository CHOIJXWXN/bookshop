package com.bookshop.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bookshop.dao.BoardDAO;
import com.bookshop.vo.Ask;
import com.bookshop.vo.AskList;
import com.bookshop.vo.AskReply;
import com.bookshop.vo.Book;
import com.bookshop.vo.Users;

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
	// book_id 불러오기
	@Override
	public String getBookid(int ask_id) throws Exception {
		
		return dao.getBookid(ask_id);
	}

	
	// 문의리스트 불러오기
	@Override
	public List<AskList> getAskList(String writer, int pageNumber) throws Exception {
		return dao.getAskList(writer, pageNumber);
	}
	
	// 다음 페이지 존재하는지
	@Override
	public boolean getNextPage(String writer, int pageNumber) throws Exception {
		int pageNum = (pageNumber * 5) + 1;
		
		return dao.getNextPage(writer, pageNum) != null;
	}

	
	// 글쓰기 (writeAction)
	@Override
	public void wrtieAction(Ask ask) throws Exception {
		 dao.writeAsk(ask);
	}

	// AskView 불러오기
	@Override
	public HashMap<String, Object> boardView(int ask_id) throws Exception {
		Ask ask = dao.getAsk(ask_id);
		List<AskReply> askreplyList = dao.getAskReplyList(ask_id);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		// 문의내용 불러오기
		map.put("ask", ask);
		map.put("askreplyList", askreplyList);
		
		return map;
	}
	
	
	
	// 댓글 작성
	@Override
	public List<AskReply> insertAskReply(AskReply askreply) throws Exception {
			// 작성하는 DAO 실행 -> 댓글 내용을 먼저 insert 하고 return 으로 작성 내용을 불러옴
			dao.insertAskReply(askreply);
			
		return dao.getAskReplyList(askreply.getAsk_id());
	}
	
	// 댓글 삭제
	@Override
	public List<AskReply> deleteAskReply(AskReply askreply) throws Exception {
		// 삭제처리 해주고 나서 전달
		dao.deleteAskReply(askreply.getAskreply_id());
		return dao.getAskReplyList(askreply.getAsk_id());
	}
	
	// 댓글 개수 추가
	@Override
	public void updateAskreplyCount(int ask_id) throws Exception {
		dao.updateAskreplyCount(ask_id);
	}
	
	// 유저 정보 불러오기
	@Override
	public Users getUserInfo(String user_id) throws Exception {
		Users users = dao.getUserInfo(user_id);
		return users;
	}
	

	
	


}
