package com.bookshop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bookshop.vo.Ask;
import com.bookshop.vo.AskList;
import com.bookshop.vo.AskReply;
import com.bookshop.vo.Book;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	SqlSession sqlSession;
	
	final String SESSION = "com.bookshop.mappers.board";

	// 도서정보 불러오기
	@Override
	public Book getBookInfo(String book_id) throws Exception {
		return sqlSession.selectOne(SESSION + ".getBookInfo", book_id);
	}
	
	// ASK table에서 Book_id 불러오기
	@Override
	public String getBookid(int ask_id) throws Exception {
		return sqlSession.selectOne(SESSION + ".getBookid", ask_id);
	}
	
	// 목록 불러오기
	@Override
	public List<AskList> getAskList(String writer) throws Exception {
		return sqlSession.selectList(SESSION + ".getAskList", writer);
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
	@Override
	public void deleteAskReply(int askreply_id) throws Exception {
		sqlSession.delete(SESSION + ".deleteAskReply", askreply_id);
	}
	
	// 댓글 갯수 update
	@Override
	public void updateAskreplyCount(int ask_id) throws Exception {
		sqlSession.update(SESSION + ".updateAskreplyCount", ask_id);
		
	}
	


}