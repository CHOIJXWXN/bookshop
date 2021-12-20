package com.bookshop.service;

import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

import com.bookshop.dao.UsersDAO;
import com.bookshop.util.Mail;
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
		if (dao.checkId(user_id) != null)
			result = 1;

		return result;
	}

	// 이메일 확인 checkEmail 실행
	@Override
	public int checkEmail(String user_email) throws Exception {
		// DB에 입력받은 user_email 없으면 0 결과값 반환
		// DB에 입력받은 user_email 있으면 1 결과값 반환
		int result = 0;
		if (dao.checkEmail(user_email) != null)
			result = 1;

		return result;
	}

	// 회원가입 joinSuccess 실행
	@Override
	public void joinSuccess(Users users) throws Exception {
		// dao.join 실행
		dao.join(users);
	}

	// [2] 로그인 (login) 관련 service
	// 로그인 loginAction 실행
	@Override
	public int loginAction(Users users) throws Exception {
		// users 값이 존재하면 0 반환-> 로그인 성공
		// users 값이 존재하지 않으면 -1 반환 -> 로그인 실패
		int result = 0;
		Users rs = dao.login(users);
		if (rs != null)
			result = 0;
		if (rs == null)
			result = -1;
		return result;
	}

	// 아이디 찾기 (이메일을 이용해서 찾기)
	// 존재하면 0, 아이디 찾기 가능
	// 존재하지 않으면 -1, 아이디찾기 불가능
	@Override
	public int findIdEAction(Users users) throws Exception {
		int result = 0;
		Users rs = dao.getIdE(users);

		if (rs != null)
			result = 0;
		else if (rs == null)
			result = -1;

		return result;
	}
	// 아이디 찾기 (휴대폰 이용해서 찾기)
	// 존재하면 0, 존재하지 않으면 -1 반환
	@Override
	public int findIdPAction(Users users) throws Exception {
		int result = 0;
		Users rs = dao.getIdP(users);
		if(rs == null) result = -1;
		
		return result;
	}

	// 아이디 찾기 값을 전달하기 위한 service(email)
	@Override
	public Users findIdE(Users users) throws Exception {

		return dao.getIdE(users);
	}
	
	// 아이디 찾기 값을 전달하기 위한 service(phone)
	@Override
	public Users findIdP(Users users) throws Exception {
		
		return dao.getIdP(users);
	}

	// 비밀번호 찾기 메일전송
	// 회원정보 존재하면 = 0, 아이디 일치하지 않음 = 1, 이메일 일치하지 않음 = 2, 데이터베이스 오류 = -1
	@Override
	public int findPwEAction(Users users) throws Exception {
		int result = 0;	
		
		Users exist = dao.getUserInfo(users);
		
		
		// 가입한 id 정보가 없음
		if(exist == null) {
				result = 1;
			}
		// 가입한 email 정보가 일치하지 않음
		else if(!users.getUser_email().equals(exist.getUser_email())) {
				result = 2;
			}
		
		// 가입한 정보 있음
			
		else if(exist != null){
			// 랜덤 비밀번호 생성
			String pw = "";
			for(int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			
			// 생성 비밀번호로 변경
			users.setUser_pw(pw);
			dao.updatePw(users);
			
			// 메일 정보
			String from = "teambook3lcy@gmail.com";
			String to = users.getUser_email();
			String subject = "임시 비밀번호 발송 메일";
			String content = "임시 비밀번호 입니다. <br>비밀번호를 변경하여 사용하세요. <br>임시 비밀번호는 <h2>" + pw + "</h2> 입니다.";
			
			Properties p = new Properties();
			
			p.put("mail.stmp.user", from);
			p.put("mail.smtp.host", "smtp.gmail.com");
			p.put("mail.smtp.port", "587");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "587");
			p.put("mail.smtp.socketFactory.fallback", "false");
			p.put("mail.smtp.ssl.trust", "smtp.gmail.com");
			p.put("mail.smtp.ssl.protocols", "TLSv1.2");
			
			try {
				Authenticator auth = new Mail();
				Session s = Session.getInstance(p, auth);
				s.setDebug(true);
				
				MimeMessage msg = new MimeMessage(s);
				
				Address fromAddr = new InternetAddress(from);
				Address toAddr = new InternetAddress(to);
				
				msg.setFrom(fromAddr);
				msg.setRecipient(Message.RecipientType.TO, toAddr);
				msg.setSubject(subject);
				msg.setContent(content, "text/html;charset=UTF-8");
				
				Transport.send(msg);
				result = 0;
			} catch(Exception e) {
				e.printStackTrace();
				result = -1;
			}
		}

		return result;
	}
	
	// 비밀번호 찾기 결과완료 알려주기 위한 service(findPwE)
	@Override
	public Users findPwE(Users users) throws Exception {
		
		return dao.getUserInfo(users);
	}

	

	

}