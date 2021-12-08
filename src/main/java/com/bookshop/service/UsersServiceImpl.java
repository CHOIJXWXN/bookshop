package com.bookshop.service;

import org.springframework.stereotype.Service;

import com.bookshop.vo.Users;

@Service
public class UsersServiceImpl implements UsersService {

	// 아이디 체크 service 구현
	@Override
	public int checkId(String user_id) throws Exception {

		return 0;
	}

	// 회원가입
	@Override
	public void joinAction(Users users) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	
	// 로그인 service 구현
	// ajax 로 실행
	@Override
	public int loginAction(Users users) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	// id 찾기 serivce
	@Override
	public int find_idAction(String user_id) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}



	
	
	
	
	
	

}
