package com.bookshop.dao;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bookshop.vo.Cart;
import com.bookshop.vo.CartPlus;

@Repository
public class OrderDAOImpl implements OrderDAO {
	
	@Inject
	SqlSession sqlSession;
	
	final String SESSION = "com.bookshop.mappers.order";

	@Override
	public List<CartPlus> getCartPlus(String user_id) throws Exception {
		return sqlSession.selectList(SESSION + ".getCartPlus", user_id);
	}
	
	@Override
	public CartPlus getCertainCartPlus(Cart cart) throws Exception {
		return sqlSession.selectOne(SESSION + ".getCertainCartPlus", cart);
	}

	@Override
	public int addCart(Cart cart) throws Exception {
		return sqlSession.insert(SESSION + ".addCart", cart);
		// 성공 시 1, 실패 시 0
	}

	@Override
	public void deleteCart(Cart cart) throws Exception {
		sqlSession.delete(SESSION + ".deleteCart", cart);
	}

	@Override
	public void updateCntCart(Cart cart) throws Exception {
		sqlSession.update(SESSION + ".updateCntCart", cart);
	}

	@Override
	public int getOrderCntToday() throws Exception {
		return sqlSession.selectOne(SESSION + ".getOrderCntToday");
	}
	
}