package com.bookshop.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bookshop.dao.UsersDAO;
import com.bookshop.vo.Users;

@Service
public class UsersServiceImpl implements UsersService {
	
	@Inject
	UsersDAO dao;
	
	// [1] 회원가입 관련 service

	// 아이디 중복확인 checkId 실행
	@Override
	public int checkId(String user_id) throws Exception {
		// DB에 입력받은 user_id가 없으면 0 결과값 반환
		// DB에 입력받은 user_id가 있으면 1 결과값 반환
		int result = 0;
		if(dao.checkId(user_id) != null) result = 1;
		
		return result;
	}
	
	// 이메일 확인 checkEmail 실행
	@Override
	public int checkEmail(String user_email) throws Exception {
		// DB에 입력받은 user_email 없으면 0 결과값 반환
		// DB에 입력받은 user_email 있으면 1 결과값 반환
		int result = 0;
		if(dao.checkEmail(user_email) != null) result = 1;
		
		return result;
	}
	
	// 회원가입 joinSuccess 실행
	@Override
	public void joinSuccess(Users users) throws Exception {
		// dao.users를 실행
		dao.join(users);
	}
	

}
