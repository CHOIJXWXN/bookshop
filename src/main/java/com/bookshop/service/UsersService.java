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
	// 존재하면 0, 아이디 찾기 가능
	// 존재하지 않으면 -1, 아이디찾기 불가능
	public int findIdEAction(Users users) throws Exception;
	
	// 아이디 찾기 값을 전달하기 위한 service(이메일)
	// Users 객체로 반환
	public Users findIdE(Users users) throws Exception;
	
	// 아이디 찾기 (휴대폰 번호 이용하여 아이디 찾기)
	public int findIdPAction(Users users) throws Exception;
	
	// 아이디 찾기 값을 전달하기 위한 service (phone)
	// Users 객체로 반환
	public Users findIdP(Users users) throws Exception;
	
	// 비밀번호 수정, 이메일전송 service (비밀번호찾기)
	public int findPwEAction(Users users) throws Exception;
	
	// 비밀번호 찾기 결과완료 알려주기 위한 service(findPwE)
	// Users 객체 반환
	public Users findPwE(Users users) throws Exception;
	
}
