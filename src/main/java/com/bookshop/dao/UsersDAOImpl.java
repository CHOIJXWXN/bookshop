package com.bookshop.dao;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bookshop.vo.Users;

@Repository
public class UsersDAOImpl implements UsersDAO {
	
	@Inject
	SqlSession sqlSession;
	
	final String SESSION = "com.bookshop.mappers.main";
	
	// [1] -- 회원가입(join) 관련 --
	
	// 아이디 중복확인 (checkId)
	// join page에 id 입력값이 DB USERS 테이블안의 users_id 에 있는지 select 함
	@Override
	public String checkId(String user_id) throws Exception {
										// ( 실행할 구문 id, 받아올 데이터)	
		return sqlSession.selectOne(SESSION + ".checkId", user_id);
	}
	
	// 이메일 중복확인 (checkEmail)
	// join page에 email 입력값이 DB USERS 테이블안의 user_email에 있는지 select 함
	@Override
	public String checkEmail(String user_email) throws Exception {
		
		return sqlSession.selectOne(SESSION + ".checkEmail", user_email);
	}
	
	// 회원가입(join)
		// join 페이지에 작성된 내용을 DB의 USESRS 테이블에 연결하여 Insert 시킴
		@Override
		public void join(Users users) throws Exception {
			sqlSession.insert(SESSION + ".join", users);
		}
	
	// [2] -- 로그인(login) 관련 --
		
	// 로그인 (login)
	@Override
	public Users login(Users users) throws Exception {
		return sqlSession.selectOne(SESSION + ".login", users);
	}
	
	// 아이디 찾기(getIdE)
	@Override
	public Users getIdE(Users users) throws Exception {
		
		return sqlSession.selectOne(SESSION + ".getIdE", users);
	}

	// 비밀번호 변경(update_pw)
	@Override
	public int update_pw(Users users) throws Exception {
		
		return sqlSession.selectOne(SESSION + ".update_pw", users);
	}
	

	



	
	
	
	

	

	
}