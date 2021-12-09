package com.bookshop.dao;

import com.bookshop.vo.Users;

public interface UsersDAO {
	
	// 아이디 중복 체크
	public String checkId(String user_id) throws Exception;
	
	// 회원가입 완료
	public void joinSuccess(Users users) throws Exception;
	
	// 로그인 (vo -user bean 이용)
	public Users login(Users users) throws Exception;
	
	// 아이디 찾기
	public String find_id(Users users) throws Exception;
	
	
	
}
