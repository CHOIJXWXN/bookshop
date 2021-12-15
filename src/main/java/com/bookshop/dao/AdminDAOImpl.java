package com.bookshop.dao;

import java.util.HashMap;
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
	public String getLastOrderNum(int pageNum) throws Exception {
		int end = 30 * pageNum - 1;
		return sqlSession.selectOne(SESSION + ".getLastOrderNum", end);
	}

	@Override
	public List<OrderPlus> getOrderList(int pageNum) throws Exception {
		String start = getLastOrderNum(pageNum - 1);
		if (start.equals("") || start == null) {
			start = "0";
		}
		String end = getLastOrderNum(pageNum);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList(SESSION + ".getOrderList", map);
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
