package com.bookshop.service;
import java.util.HashMap;

import com.bookshop.vo.Users;

public interface MemberService {

	
	// (마이페이지) 회원정보 불러오기 service
		public Users getUserInfo(String user_id) throws Exception;
			
		// (마이페이지) 회원정보 수정 service
		public void updateProfile(Users users) throws Exception;
		
		// (마이페이지) 주문/배송 조회 service
		public HashMap<String, Object> viewOrderlist(String user_id) throws Exception;

}
