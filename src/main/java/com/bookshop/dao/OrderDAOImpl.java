package com.bookshop.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bookshop.vo.Book;
import com.bookshop.vo.Cart;
import com.bookshop.vo.CartPlus;
import com.bookshop.vo.OrderList;
import com.bookshop.vo.Orders;

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

	@Override
	public int addOrder(Orders order) throws Exception {
		return sqlSession.insert(SESSION + ".addOrder", order);
	}
	
	@Override
	public void addOrderlist(OrderList orderList) throws Exception {
		sqlSession.insert(SESSION + ".addOrderlist", orderList);
	}

	@Override
	public void changePoint(String user_id, int point_use, int point_add) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("point_use", point_use);
		map.put("point_add", point_add);
		sqlSession.update(SESSION + ".changePoint", map);
	}

	@Override
	public void changeSellTot(Cart cart) throws Exception {
		sqlSession.update(SESSION + ".changeSellTot", cart);
	}

	@Override
	public Orders getOrderInfo(String user_id) throws Exception {
		return sqlSession.selectOne(SESSION + ".getOrderInfo", user_id);
	}
	
}