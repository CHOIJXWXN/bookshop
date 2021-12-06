package com.bookshop.service;

import com.bookshop.vo.Users;

public interface UsersService {
	
	// 아이디 체크
	public int checkId(String user_id) throws Exception;

	// 로그인 service
	public int loginAction(Users users) throws Exception;
	
	
}
