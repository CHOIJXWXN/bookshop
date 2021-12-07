package com.bookshop.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookshop.vo.Users;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	// 메인 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Model model) throws Exception {
		return "main/main";
	}
	
	// 로그인 페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) throws Exception {
		return "";
	}
	
	// 로그인 실행 기능 (Ajax)
	@RequestMapping(value = "/loginAction", method = RequestMethod.GET)
	@ResponseBody
	public String loginAction(Users user, HttpSession session) throws Exception {
		// 유저 아이디/비밀번호 확인
		// 맞으면 return 0	view에서 data == 0이면  location.href 써서 메인 페이지로
		// 틀리면 return -1	view에서 data == -1이면 정보 불일치 띄우기
		return "";
	}
	
	
	// 로그아웃 기능
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}
	
	/*
	 * 매핑 더 필요함 (아이디 찾기 기능 / 비밀번호 찾기 기능)
	 */
	// 아이디/비밀번호 찾기 페이지
	@RequestMapping(value = "/help", method = RequestMethod.GET)
	public String help(Model model) throws Exception {
		return "";
	}
	
	// 회원가입 약관 페이지
	@RequestMapping(value = "/joinTerm", method = RequestMethod.GET)
	public String joinTerm(Model model) throws Exception {
		return "";
	}
	
	// 회원가입 페이지
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(Model model) throws Exception {
		return "";
	}
	
	// 아이디 중복 확인 기능 (Ajax)
	@RequestMapping(value = "/checkId", method = RequestMethod.GET)
	@ResponseBody
	public String checkId(String user_id) throws Exception {
		// 아이디 중복 확인
		// 맞으면 return 0	view에서 data == 0이면 valid
		// 틀리면 return -1	view에서 data == -1이면 invalid
		return "";
	}
	
	// 회원가입 완료 페이지
	@RequestMapping(value = "/joinSuccess", method = RequestMethod.GET)
	public String joinSuccess(Users user) throws Exception {
		// users 테이블에 삽입
		return "";
	}

	/*
	 * 매핑 더 필요함 (회원정보수정, 배송조회, 주문취소, 주문목록 등등) 
	 */
	// 마이페이지
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPage(Model model) throws Exception {
		return "";
	}

}
