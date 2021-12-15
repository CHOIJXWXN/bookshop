package com.bookshop.service;

import javax.servlet.http.HttpSession;

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
	
	// [2] 로그인(login) 관련 service
	// 로그인 버튼 눌렀을시 
	public int loginAction(Users users) throws Exception;
	
	// 아이디 찾기 (이메일이용하여 아이디찾기 클릭시)
	// 결과 존재 - 반환값 가져옴 result : 0, 
	// 결과 없음 - result -1;
	public int findID_email(Users users) throws Exception;

}
