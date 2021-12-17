package com.bookshop.service;
import java.util.HashMap;
import java.util.List;

import com.bookshop.vo.OrderItem;
import com.bookshop.vo.Users;

public interface MemberService {

	
	// (마이페이지) 회원정보 불러오기 service
	public Users getUserInfo(String user_id) throws Exception;
			
	// (마이페이지) 회원정보 수정 service
	public void updateProfile(Users users) throws Exception;
		
	// (마이페이지) 주문/배송 조회 service
	// 1) 주문 목록 가져오기
	public List<HashMap<String, Object>> viewOrderList(String user_id, int pageNumber) throws Exception;
	// 2) 다음 페이지 존재하는지 
	public boolean getPageIs(String user_id, int pageNumber) throws Exception;
	// 3) 보유 포인트 가져오기
	public int getPoint(String user_id) throws Exception;
	
	// 4) 주문목록 건수 가져오기
	public int getOrderCnt(String user_id) throws Exception;
}
