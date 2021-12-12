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
	public List<CartPlus> getCartPlus(String user_id) {
		return sqlSession.selectList(SESSION + ".getCartPlus", user_id);
	}

	@Override
	public void addCart(Cart cart) {
		sqlSession.insert(SESSION + ".addCart", cart);
	}

	@Override
	public void deleteCart(CartPlus cartPlus) {
		sqlSession.delete(SESSION + ".deleteCart", cartPlus);
	}
	
}