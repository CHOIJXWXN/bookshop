package com.bookshop.dao;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bookshop.vo.OrderPlus;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Inject
	SqlSession sqlSession;
	
	final String SESSION = "com.bookshop.mappers.admin";

	@Override
	public List<OrderPlus> getOrderList(int pageNum) throws Exception {
		int start = 20 * (pageNum - 1);
		return sqlSession.selectList(SESSION + ".getOrderList", start);
	}

	@Override
	public void changeToStart(String order_num) throws Exception {
		sqlSession.update(SESSION + ".changeToStart", order_num);
	}

	@Override
	public void changeToEnd(String order_num) throws Exception {
		sqlSession.update(SESSION + ".changeToEnd", order_num);
	}

	@Override
	public int getBeforeStartCnt() throws Exception {
		return sqlSession.selectOne(SESSION + ".getBeforeStartCnt");
	}

	@Override
	public int getStartCnt() throws Exception {
		return sqlSession.selectOne(SESSION + ".getStartCnt");
	}

	@Override
	public int getEndCnt() throws Exception {
		return sqlSession.selectOne(SESSION + ".getEndCnt");
	}

	@Override
	public int getTotCnt() throws Exception {
		return sqlSession.selectOne(SESSION + ".getTotCnt");
	}

}
