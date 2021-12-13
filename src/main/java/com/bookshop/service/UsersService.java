package com.bookshop.service;

import com.bookshop.vo.Users;

public interface UsersService {
	
	// [1] 회원가입(join) 관련 service
	
	// 아이디 중복체크 클릭 ,checkId
	// 특정 결과값을 반환 -> int 타입
	public int checkId(String user_id) throws Exception;
	
	// 이메일 확인 클릭, checkEmail
	// 특정 결과값을 반환 -> int 타입
	public int checkEmail(String user_email) throws Exception;
	
	// 회원가입 버튼 클릭 (form - action joinSuccess 하면)
	// 특별한 반환값이 필요하지 않음 - void
	public void joinSuccess(Users users) throws Exception;

}
