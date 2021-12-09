package com.bookshop.service;

import com.bookshop.vo.Users;

public interface UsersService {
	
	// 아이디 체크
	public int checkId(String user_id) throws Exception;
	
	// 회원가입
	public void joinAction(Users users) throws Exception;
	
	// 로그인 service
	public int loginAction(Users users) throws Exception;
	
	// 아이디 찾기 service
	public int find_idAction(String user_id) throws Exception;
	
	// 비밀번호 찾기 service
	
	
}
