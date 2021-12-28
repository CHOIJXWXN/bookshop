package com.bookshop.dao;

import com.bookshop.vo.Users;

public interface UsersDAO {
	
	// [1] -- 회원가입(join) 관련 --
	
	// 아이디 중복 확인 (checkId)
	// parameter - user_id (String) (받는값)
	public String checkId(String user_id) throws Exception;
	
	// 이메일 중복 확인 (checkEmail)
	// parameter - user_email (string) (받는값)
	public String checkEmail(String user_email) throws Exception;
	
	// 회원가입 (join)
	// parameter - Users 객체 (받는값)
	public void join(Users users) throws Exception;
	
	// [2] -- 로그인(login) 관련 --
	
	// 로그인
	// DB에 저장되어있는 user_id 와 user_pw를 찾음, 객체로 전달
	// DAO -1개의 객체만 전달
	public Users login(Users users) throws Exception;
	
	// 아이디 찾기 (이메일 이용)
	// DB에 저장되어있는 user_id 찾음
	// Users 객체로 전달
	public Users getIdE(Users users) throws Exception;
	
	// 아이디 찾기 (phone 이용)
	public Users getIdP(Users users) throws Exception;
	
	// 비밀번호 찾기(회원정보 확인)
	public Users getUserInfo(Users users) throws Exception;
	
	// 비밀번호 임시 비밀번호로 수정
	public void updatePw(Users users) throws Exception;

	public Users getAdminAuth(String user_id) throws Exception;
	
}