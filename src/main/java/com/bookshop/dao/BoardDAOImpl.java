package com.bookshop.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bookshop.vo.Ask;
import com.bookshop.vo.AskList;
import com.bookshop.vo.AskReply;
import com.bookshop.vo.Book;
import com.bookshop.vo.Users;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	SqlSession sqlSession;
	
	final String SESSION = "com.bookshop.mappers.board";
	
	// ASK table에서 Book_id 불러오기
	@Override
	public String getBookid(int ask_id) throws Exception {
		return sqlSession.selectOne(SESSION + ".getBookid", ask_id);
	}
	
	// 목록 불러오기
	@Override
	public List<AskList> getAskList(String writer, int pageNumber) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int start = 5 * (pageNumber - 1);
		map.put("start", start);
		map.put("writer", writer);
		
		return sqlSession.selectList(SESSION + ".getAskList", map);
	}
	
	// 다음 페이지 존재하는지
	@Override
	public AskList getNextPage(String writer, int pageNumber) throws Exception {
		
		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("writer", writer);
		pageMap.put("pageNumber", pageNumber);
		
		return sqlSession.selectOne(SESSION + ".getNextPage", pageMap);
	}
	
	// 게시글 쓰기
	@Override
	public Ask writeAsk(Ask ask) throws Exception {
		sqlSession.insert(SESSION + ".writeAsk", ask);
		return ask;
	}
	
	// 문의글 불러오기
	@Override
	public Ask getAsk(int ask_id) throws Exception {
		return sqlSession.selectOne(SESSION + ".getAsk", ask_id);
	}
	
	// 댓글 작성
	@Override
	public void insertAskReply(AskReply askreply) throws Exception {
		sqlSession.insert(SESSION + ".insertAskReply", askreply);
	}
	
	// 댓글 불러오기
	@Override
	public List<AskReply> getAskReplyList(int ask_id) throws Exception {
		return sqlSession.selectList(SESSION + ".getAskReply", ask_id);
	}
	
	// 댓글 삭제
	
	// 댓글 갯수 update
	@Override
	public void updateAskreplyCount(int ask_id) throws Exception {
		sqlSession.update(SESSION + ".updateAskreplyCount", ask_id);
		
	}
	
	// 답변 상태 update( Ask_status update)
	@Override
	public void updateAsk_status(Ask ask) throws Exception {
		sqlSession.selectOne(SESSION + ".updateAsk_status", ask);
	}
	
	
	

	


}