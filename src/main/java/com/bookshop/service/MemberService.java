package com.bookshop.service;

import java.util.List;

import com.bookshop.vo.OrderItem;
import com.bookshop.vo.Users;

public interface MemberService {
	
	// 회원정보 수정 페이지
	// 회원정보 불러오기
	public Users getUserInfo(String user_id) throws Exception;			
	// 회원정보 수정
	public void updateProfile(Users users) throws Exception;
	
	// 주문/배송 조회 페이지
	// 주문 목록 가져오기
	public List<OrderItem> viewOrderList(String user_id, int pageNumber) throws Exception;
	// 다음 페이지 존재 여부 
	public boolean getPageIs(String user_id, int pageNumber) throws Exception;
	// 포인트
	public int getPoint(String user_id) throws Exception;
	// 주문목록 건수
	public int getOrderCnt(String user_id) throws Exception;
	// 계정 삭제
	public void delete(String user_id) throws Exception;
	
}
