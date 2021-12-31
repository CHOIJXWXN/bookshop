package com.bookshop.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bookshop.dao.BoardDAO;
import com.bookshop.dao.BookDAO;
import com.bookshop.dao.UsersDAO;
import com.bookshop.vo.Ask;
import com.bookshop.vo.AskList;
import com.bookshop.vo.AskReply;
import com.bookshop.vo.Book;
import com.bookshop.vo.Users;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	BoardDAO dao;
	@Inject
	UsersDAO udao;
	@Inject
	BookDAO bdao;
	
	// 도서정보 불러오기
	@Override
	public Book getBookInfo(String book_id) throws Exception {
		
		return bdao.getBook(book_id);
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
	public void writeAction(Ask ask) throws Exception {
		 dao.writeAsk(ask);
	}

	// AskView 불러오기
	@Override
	public HashMap<String, Object> boardView(int ask_id) throws Exception {
		List<AskReply> askreplyList = dao.getAskReplyList(ask_id);
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		// 문의내용 불러오기
		map.put("ask", dao.getAsk(ask_id));
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
	
	public List<AskReply> delete(AskReply askreply) throws Exception {
		// (댓글 삭제 제외) dao.deleteAskReply(askreply.getAskreply_id());
		dao.updateAskreplyCount(askreply.getAsk_id());
		return dao.getAskReplyList(askreply.getAsk_id());
	}
	
	// 댓글 삭제
	
	
	// 댓글 개수 추가
	@Override
	public void updateAskreplyCount(int ask_id) throws Exception {
		dao.updateAskreplyCount(ask_id);
	}
	
	// 유저 정보 불러오기
	@Override
	public Users getUserInfo(String user_id) throws Exception {
		
		return udao.getUserInfo(user_id);
	}
	
	// 답변 상태 update admin 
	@Override
	public void updateAskstatusA(Ask ask) throws Exception {
		ask.setAsk_status("답변완료");
		dao.updateAsk_status(ask);
	}
	
	// 답변상태 user
	@Override
	public void updateAskstatusU(Ask ask) throws Exception {
		ask.setAsk_status("답변미완료");
		dao.updateAsk_status(ask);
	}
	

	
	


}
