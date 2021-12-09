package com.bookshop.dao;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bookshop.vo.Users;

@Repository
public class UsersDAOImpl implements UsersDAO {
	
	@Inject
	SqlSession sqlSession;
	
	final String SESSION = "com.bookshop.mappers.main";
	
	// 아이디 중복 확인
	@Override
	public String checkId(String user_id) throws Exception {
		return sqlSession.selectOne(SESSION + ".checkId", user_id);
	}
	
	// 회원가입 완료
	@Override
	public void joinSuccess(Users users) throws Exception {
		sqlSession.insert(SESSION + ".join", users);
	}
	
	// 로그인
	@Override
	public Users login(Users users) throws Exception {
		return sqlSession.selectOne(SESSION + ".login", users);
	}

	


	

	
}
