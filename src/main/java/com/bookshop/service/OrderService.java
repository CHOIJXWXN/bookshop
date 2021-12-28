package com.bookshop.service;

import java.util.HashMap;
import java.util.List;

import com.bookshop.vo.Cart;
import com.bookshop.vo.CartPlus;
import com.bookshop.vo.OrderList;
import com.bookshop.vo.Orders;

public interface OrderService {
	
	// 장바구니 페이지
	// 장바구니
	public List<CartPlus> viewCart(String user_id) throws Exception;
	// 특정 책 cartPlus
	public List<CartPlus> viewCertainCart(String user_id, List<String> checked_book_id) throws Exception;
	// 장바구니에 추가
	public int addCart(Cart cart) throws Exception;
	// 장바구니에서 삭제
	public void deleteCart(String user_id, List<String> book_id) throws Exception;
	// 장바구니 수정
	public void updateCart(Cart cart) throws Exception;
	
	// 주문 페이지
	// 주문 번호 생성
	public String newOrderNum() throws Exception;
	// 주문 추가
	public int addOrder(Orders order) throws Exception;
	// 판매량 증가, 주문목록 추가
	public void paid(Cart cart, OrderList orderList) throws Exception;
	// 포인트 적립/차감
	public void point(String user_id, int point_use, int point_add) throws Exception;

	
	// 주문 완료 페이지
	// 주문 정보
	public HashMap<String, Object> orderInfo(String user_id) throws Exception;
	
}