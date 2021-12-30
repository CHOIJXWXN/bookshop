package com.bookshop.service;

import java.util.List;
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

	// 회원가입
	// 아이디 중복 체크
	@Override
	public int checkId(String user_id) throws Exception {
		int result = 0;
		if (dao.checkId(user_id) != null)
			result = 1;
		return result;
	}

	// 이메일 중복 체크
	@Override
	public int checkEmail(String user_email) throws Exception {
		int result = 0;
		if (dao.checkEmail(user_email) != null)
			result = 1;
		return result;
	}

	// 유저 추가
	@Override
	public void joinSuccess(Users users) throws Exception {
		dao.join(users);
	}

	// 로그인
	@Override
	public int loginAction(Users users) throws Exception {
		Users exist = dao.login(users);
		if (exist == null) {
			return -1;		
		}
		return exist.getUser_admin();
	}


	// 아이디/비밀번호 찾기
	// 아이디 찾기 (이메일)
	@Override
	public int findIdEAction(Users users) throws Exception {
		int result = 0;
		if (dao.getIdE(users) == null) {
			result = -1;
		}
		return result;
	}
	
	// 아이디 찾기 (휴대폰)
	@Override
	public int findIdPAction(Users users) throws Exception {
		int result = 0;
		if(dao.getIdP(users) == null) {
			result = -1;
		}		
		return result;
	}

	// 유저 정보 (이메일)
	@Override
	public Users findIdE(Users users) throws Exception {
		return dao.getIdE(users);
	}
	
	// 유저 정보 (핸드폰)
	@Override
	public List<Users> findIdP(Users users) throws Exception {		
		return dao.getIdP(users);
	}

	// 비밀번호 수정 및 전송
	@Override
	public int findPwEAction(Users users) throws Exception {
		int result = 0;			
		Users exist = dao.getUserInfo(users.getUser_id());
		if (exist == null) {
			result = 1;
		} else if (!users.getUser_email().equals(exist.getUser_email())) {
			result = 2;
		} else if (!users.getUser_name().equals(exist.getUser_name())) {
			result = 3;
		} else if (exist != null) {
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
			} catch (Exception e) {
				e.printStackTrace();
				result = -1;
			}
		}
		return result;
	}
	
	// 유저 정보 (이메일)
	@Override
	public Users findPwE(Users users) throws Exception {		
		return dao.getUserInfo(users.getUser_id());
	}	

}