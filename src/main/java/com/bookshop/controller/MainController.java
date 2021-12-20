package com.bookshop.controller;

import javax.inject.Inject;
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
import com.bookshop.service.UsersService;
import com.bookshop.vo.Users;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;

@Controller
public class MainController {
	
	@Inject
	UsersService usersService;

	@Inject
	BookService bookService;

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	
	// 메인 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Model model) throws Exception {

		return "main/main";
	}	

	// --- 로그인(login) 관련 ---

	// 로그인 페이지
	// url 패턴이 'path/login'
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) throws Exception {

		return "main/login";
	}
	
	// 로그인 실행 기능 (Ajax)
	//  url 패턴이 'path/loginAction
	// 유저 아이디/비밀번호 확인
	// 맞으면 return 0	view에서 data == 0이면  location.href 써서 메인 페이지로
	// 틀리면 return -1	view에서 data == -1이면 정보 불일치 띄우기
	// int result = userService.mtehod();
	// service 에서 반환된 result 값을 받아옴
	@RequestMapping(value = "/loginAction", method = RequestMethod.POST)
	@ResponseBody
	public String loginAction(Users users, HttpSession session, RedirectAttributes ra) throws Exception {
		int result = usersService.loginAction(users);	
		if(result == 0) {
			session.setAttribute("user_id", users.getUser_id());	
		}
		return result + "";
	}
		
	// 아이디/비밀번호 찾기 페이지
	// url 패턴이 'path/find' 
	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String find(Model model) throws Exception {
		return "main/find";
	}
	
	/* 아이디 찾기 관련 주석
	  // 존재 확인
    // 있으면 data = 0, data == 0이면 view에서 location.href="아이디 보여주는 페이지" 시키기
    // 없으면 data = -1, data == -1이면 view에서 alert 시키기
    // 아이디 찾기 DAO, Service 필요
    // 존재하면 - 아이디를 보여줌 
    // 존재하지 않으면 - 아이디가 존재하지 않음 msg 출력 후 로그인 페이지로 이동
	*/
	
	// 아이디찾기 (이메일 이용)(ajax)
	// url 패턴이 'path/findIdEAction'
	// 결과를 findIde.jsp로 보냄
	// 존재하면 0, 아이디 찾기 가능
	// 존재하지 않으면 -1, 아이디찾기 불가능
	@RequestMapping(value = "/findIdEAction", method = RequestMethod.POST)
	@ResponseBody
	public String findIdEAction(Users users, Model model) throws Exception {
		int result = usersService.findIdEAction(users);
		
		return result + "";
	}
	// url 이 'path/findIdE'
	// 결과가 존재할 시 값을 전달해 줌
	@RequestMapping(value = "/findIdE", method = RequestMethod.POST) 
	public String findIdE(Users users, Model model) throws Exception {
		
		users = usersService.findIdE(users);
		model.addAttribute("users", users);
		
		return "main/findIdE";
	}
	

	// 아이디 찾기 기능 (phone)
	// 아이디 찾기 - 휴대폰번호로 찾기 클릭
	@RequestMapping(value = "/findIdPAction", method = RequestMethod.POST)
	@ResponseBody
	public String findIdPAction(Users users, Model model) throws Exception {
		int result = usersService.findIdPAction(users);
		
		return result + "";
	}
	
	// url 패턴이 'path/findIdP'
	// 결과가 존재할 시 전달
	@RequestMapping(value = "/findIdP", method = RequestMethod.POST)
	public String findIdP(Users users, Model model) throws Exception {
		users = usersService.findIdP(users);
		model.addAttribute("users", users);
		
		return "main/findIdP";
	}
	

	
	

	/* 비밀번호 찾기 관련 주석
	 // 가입된 아이디 기준으로 비밀번호 찾음
	 // 존재 확인
	 // 있으면 data = 0, data == 0이면 view에서 redirect(/sendPw) 시키기
	 // 없으면 data = -1, data == -1이면 view에서 alert 시키기
	*/

	// 비밀번호 찾기
	// 아이디, 이름, 이메일 입력후 form 제출하면 실행
	// 임시 비밀번호 전송 기능
   @RequestMapping(value = "/findPwEAction", method = RequestMethod.POST)
   @ResponseBody
   public String findPwEAction(Users users, Model model) throws Exception {
	   int result = usersService.findPwEAction(users);
	   
      return result + "";
   }
   
   // url이 'path/findPwE' 경우
   // 결과가 존재할 시 전달
   @RequestMapping(value = "/findPwE", method = RequestMethod.POST)
	public String findPwE(Users users, Model model) throws Exception {
	   users = usersService.findPwE(users);
	   model.addAttribute("users", users);
	   
		return "main/findPwE";
	}	
   
   // 비밀번호 찾기 기능 (phone)
	// 비밀번호찾기 - 휴대폰번호로 찾기 클릭
	// url 패턴이 'path/findPwP'
	@RequestMapping(value = "/findPwP", method = RequestMethod.GET)
	public String helpPwP(Model model) throws Exception {
		return "main/findPwP";
	}
 
	// 로그아웃 기능
	// url 패턴이 'path/logout'
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}
	

	// --- 회원가입(join) 관련 ---

	
	// 회원가입 버튼 눌렀을시 
	// (회원가입 약관 페이지 출력)
		@RequestMapping(value = "/joinTerm", method = RequestMethod.GET)
		public String join(Model model) throws Exception {
			return "main/joinTerm";
		}
	
	// 회원가입 페이지
	// 약관 페이지에서 next 눌러서 넘어가면 회원가입 페이지 출력
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinTerm(Model model) throws Exception {
		
		return "main/join";
	}
	
	// 아이디 중복 확인 기능 (Ajax)
	// url 이 'path/checkId'
	@RequestMapping(value = "/checkId", method = RequestMethod.GET)
	@ResponseBody
	public String checkId(String user_id) throws Exception {
		int result = usersService.checkId(user_id);
		// 아이디 중복 확인
		// 맞으면 return 0	view에서 data == 0이면 valid
		// 틀리면 return -1	view에서 data == -1이면 invalid
		return result + "";
	}
	
	// 이메일 중복 확인 기능 (Ajax) 
	// url이 'path/checkEmail'
	@RequestMapping(value = "/checkEmail", method = RequestMethod.GET)
	@ResponseBody
	public String checkEmail(String user_email) throws Exception {
		int result = usersService.checkEmail(user_email);
		// 이메일 중복 확인 (아이디 중복 확인 기능과 동일함)
		// 존재 - return 0, view 에서 data == 0 
		// 틀리면 - return -1, view 에서 data == -1
		return result + "";
	}
	
	
	// 회원가입 완료
	// url 패턴이 'path/joinSuccess'
	// 회원가입 버튼 클릭 하면 정보 저장하고 회원가입 완료 페이지를 출력함
	
	@RequestMapping(value = "/joinSuccess", method = RequestMethod.POST)
	public String joinSuccess(Users users, String addr_1, String addr_2, String addr_3, String user_email_id, String user_email_domain) throws Exception {
		// 주소 합침
		users.setUser_addr(addr_1 + "_" +  addr_2 + "_" + addr_3);
		// 이메일주소 id와 domain 합침
		users.setUser_email(user_email_id +"@"+ user_email_domain);
		usersService.joinSuccess(users);
		// users 테이블에 삽입
		return "main/joinSuccess";
	}

	// 책 메인 페이지 (all, 판매량순)
	/*
	 * book_genre { -1 : 전체
	 * 				 0 : 소설
	 * 				 1 : 시/에세이
	 * 				 2 : 여행		  }
	 */
	@RequestMapping(value = "/book", method = RequestMethod.GET)
	public String book(Integer pageNum, Model model, String book_genre) throws Exception {
		if (pageNum == null) {
			pageNum = 1;
		}
		if (book_genre == null) {
			book_genre = "-1";
		}
		if (book_genre.equals("-1")) {
			model.addAttribute("map", bookService.book("판매량순", "-1", pageNum));
		} else if (book_genre.equals("0")) {
			model.addAttribute("map", bookService.book("판매량순", "0", pageNum));
		} else if (book_genre.equals("1")) {
			model.addAttribute("map", bookService.book("판매량순", "1", pageNum));
		} else if (book_genre.equals("2")) {
			model.addAttribute("map", bookService.book("판매량순", "2", pageNum));
		}
		model.addAttribute("book_genre", book_genre);
		return "shop/books";
	}
	



	/*
	 * 매핑 더 필요함 (회원정보수정, 배송조회, 주문취소, 주문목록 등등) 
	 */
	// 마이페이지
//	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
//	public String myPage(Model model) throws Exception {
//		return "member/myPage";
//	}

}