package com.bookshop.service;

import java.util.List;

import com.bookshop.vo.Users;

public interface UsersService {
	
	// 회원가입
	// 아이디 중복 체크
	public int checkId(String user_id) throws Exception;	
	// 이메일 중복 체크
	public int checkEmail(String user_email) throws Exception;	
	// 유저 추가
	public void joinSuccess(Users users) throws Exception;
	
	// 로그인
	public int loginAction(Users users) throws Exception;
	
	// 아이디/비밀번호 찾기
	// 아이디 찾기 (이메일)
	public int findIdEAction(Users users) throws Exception;	
	// 유저 정보 (이메일)
	public Users findIdE(Users users) throws Exception;	
	// 아이디 찾기 (휴대폰)
	public int findIdPAction(Users users) throws Exception;	
	// 유저 정보 (휴대폰)
	public List<Users> findIdP(Users users) throws Exception;
	// 비밀번호 수정 및 전송
	public int findPwEAction(Users users) throws Exception;
	// 유저 정보 (이메일)
	public Users findPwE(Users users) throws Exception;
	
}
