package com.bookshop.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookshop.service.BookService;
import com.bookshop.service.RecordService;
import com.bookshop.service.UsersService;
import com.bookshop.vo.Users;

@Controller
public class MainController {
	
	@Inject
	UsersService usersService;
	@Inject
	BookService bookService;
	@Inject
	RecordService recordService;

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);	
	
	// 메인 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Model model, HttpServletRequest request) throws Exception {
		return "main/main";
	}	
	
	// 로그인 페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) throws Exception {
		return "main/login";
	}
	
	// 로그인 실행 기능
	/*
	 * return { 0 : 일반 유저
	 * 			1 : 관리자
	 * 		   -1 : 불일치
	 * 		  				}
	 */
	@RequestMapping(value = "/loginAction", method = RequestMethod.POST)
	@ResponseBody
	public String loginAction(Users users, HttpSession session, RedirectAttributes ra) throws Exception {
		// 아이디와 비밀번호 검증
		int result = usersService.loginAction(users);
		// 일치 시 세션에 user_id로 해당 유저 아이디 값 저장 (관리자일 때는 admin 이름으로 1 값 저장)
		if (result == 0) {
			session.setAttribute("user_id", users.getUser_id());	
		} else if (result == 1) {
			session.setAttribute("user_id", users.getUser_id());
			session.setAttribute("admin", 1);
		}
		return result + "";
	}
		
	// 아이디/비밀번호 찾기 페이지
	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String find(Model model) throws Exception {
		return "main/find";
	}
	
	// 이메일로 아이디 찾기 기능
	/*
	 * return { 0 : 일치
	 * 		   -1 : 불일치
	 * 					  }
	 */
	@RequestMapping(value = "/findIdEAction", method = RequestMethod.POST)
	@ResponseBody
	public String findIdEAction(Users users, Model model) throws Exception {	
		return usersService.findIdEAction(users) + "";
	}
	
	// 이메일 인증 시 아이디 제공 페이지
	@RequestMapping(value = "/findIdE", method = RequestMethod.POST) 
	public String findIdE(Users users, Model model) throws Exception {
		// 이메일로 찾은 유저 정보
		model.addAttribute("users", usersService.findIdE(users));		
		return "main/findIdE";
	}

	// 핸드폰 번호로 아이디 찾기 기능
	/*
	 * return { 0 : 일치
	 * 		   -1 : 불일치
	 * 					  }
	 */
	@RequestMapping(value = "/findIdPAction", method = RequestMethod.POST)
	@ResponseBody
	public String findIdPAction(Users users, Model model) throws Exception {	
		return usersService.findIdPAction(users) + "";
	}
	
	// 휴대폰 인증 시 아이디 제공 페이지
	@RequestMapping(value = "/findIdP", method = RequestMethod.POST)
	public String findIdP(Users users, Model model) throws Exception {
		// 핸드폰으로 찾은 유저 정보
		model.addAttribute("list", usersService.findIdP(users));		
		return "main/findIdP";
	}

	// 이메일로 비밀번호 찾기 기능 (비밀번호 임의 변경 및 랜덤 비밀번호 전송)
	/*
	 * return { 0 : 일치
	 * 		    1 : 아이디 불일치
	 * 			2 : 이메일 불일치
	 * 		   -1 : 데이터베이스 오류
	 * 					  		  }
	 */
	@RequestMapping(value = "/findPwEAction", method = RequestMethod.POST)
	@ResponseBody
	public String findPwEAction(Users users, Model model) throws Exception {
		return usersService.findPwEAction(users) + "";
	}
   
	// 인증 시 제공 페이지 (이메일)
	@RequestMapping(value = "/findPwE", method = RequestMethod.POST)
	public String findPwE(Users users, Model model) throws Exception {
		// 입력값으로 찾은 유저 정보
		model.addAttribute("users", usersService.findPwE(users));
		return "main/findPwE";
	}	
   
	// 인증 시 제공 페이지 (핸드폰)
	@RequestMapping(value = "/findPwP", method = RequestMethod.GET)
	public String helpPwP(Model model) throws Exception {
		return "main/findPwP";
	}
 
	// 로그아웃 기능
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}

	// 회원가입 약관 페이지 (1)
	@RequestMapping(value = "/joinTerm", method = RequestMethod.GET)
	public String join(Model model) throws Exception {
		return "main/joinTerm";
	}
	
	// 회원가입 페이지 (2)
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinTerm(Model model) throws Exception {
		return "main/join";	
	}
	
	// 아이디 중복 확인 기능
	/*
	 * return { 0 : 중복 없음
	 * 		   -1 : 중복
	 * 					    }
	 */
	@RequestMapping(value = "/checkId", method = RequestMethod.GET)
	@ResponseBody
	public String checkId(String user_id) throws Exception {
		return usersService.checkId(user_id) + "";
	}
	
	// 이메일 중복 확인 기능
	/*
	 * return { 0 : 중복 없음
	 * 		   -1 : 중복
	 * 					    }
	 */
	@RequestMapping(value = "/checkEmail", method = RequestMethod.GET)
	@ResponseBody
	public String checkEmail(String user_email) throws Exception {
		return usersService.checkEmail(user_email) + "";
	}
		
	// 회원가입 완료 페이지 (3)
	@RequestMapping(value = "/joinSuccess", method = RequestMethod.POST)
	public String joinSuccess(Users users, String addr_1, String addr_2, String addr_3, String user_email_id, String user_email_domain) throws Exception {
		users.setUser_addr(addr_1 + "_" +  addr_2 + "_" + addr_3);
		users.setUser_email(user_email_id +"@"+ user_email_domain);
		// 유저 추가
		usersService.joinSuccess(users);
		return "main/joinSuccess";
	}

	// 책 메인 페이지
	/*
	 * book_genre { -1 : 전체
	 * 				 0 : 소설
	 * 				 1 : 시/에세이
	 * 				 2 : 여행		  }
	 */
	@RequestMapping(value = "/book", method = RequestMethod.GET)
	public String book(Integer pageNum, Model model, String book_genre, String book_order) throws Exception {		
		if (pageNum == null) {
			pageNum = 1;
		}
		// 입력값 누락 처리
		if (book_genre == null) {
			book_genre = "-1";
		}
		if (book_order == null) {
			book_order = "판매량순";
		}
		// 모든 책 리스트 (16개씩)
		model.addAttribute("map", bookService.book(book_order, book_genre, pageNum)); // list, paging
		model.addAttribute("book_genre", book_genre);
		model.addAttribute("book_order", book_order);
		return "shop/books";
	}
	
	// 관리자 메인 페이지
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(HttpSession session, Model model) throws Exception {
		return "admin/admin";
	}
	
	// 마이페이지 메인 페이지
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(Model model) throws Exception {
		return "member/myPage";		
	}
	
	// 기록 메인 페이지
	@RequestMapping(value = "/record", method = RequestMethod.GET)
	public String record(Integer pageNum, HttpSession session, Model model) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		// 기록장 이름 설정 페이지
		if (recordService.title(user_id) == null) {
			return "record/recordStart";
		}
		if (pageNum == null) {
			pageNum = 1;
		}
		// 모든 기록 리스트 및 페이징 (12개씩)
		model.addAttribute("map", recordService.view(user_id, pageNum)); // list, paging, title		
		return "record/recordList";
	}
	
	// 약관동의 페이지(AGREEMENT)
	@RequestMapping(value = "/agreement", method = RequestMethod.GET)
	public String agreement(Model model) throws Exception {
		return "member/agreement";		
	}
	
	// 개인정보처리방침 페이지(PRIVACY)
	@RequestMapping(value = "/privacy", method = RequestMethod.GET)
	public String privacy(Model model) throws Exception {
		return "member/privacy";		
	}
	
	// 가이드 페이지(GUIDE)
	@RequestMapping(value = "/guide", method = RequestMethod.GET)
	public String guide(Model model) throws Exception {
		return "member/guide";		
	}

}