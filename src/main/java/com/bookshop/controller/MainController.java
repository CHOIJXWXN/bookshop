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

import com.bookshop.service.BookService;
import com.bookshop.service.UsersService;
import com.bookshop.vo.Users;

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
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) throws Exception {

		return "main/login";
	}
	
	// 로그인 실행 기능 (Ajax)
	@RequestMapping(value = "/loginAction", method = RequestMethod.GET)
	@ResponseBody
	public String loginAction(Users user, HttpSession session) throws Exception {
		int result = 0;
		// 유저 아이디/비밀번호 확인
		// 맞으면 return 0	view에서 data == 0이면  location.href 써서 메인 페이지로
		// 틀리면 return -1	view에서 data == -1이면 정보 불일치 띄우기
		// int result = userService.mtehod();
		return result + "";
	}
	
	/*
	 * 매핑 더 필요함 (아이디 찾기 기능 / 비밀번호 찾기 기능)
	 */
	
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
      // DAO - string user_id 받아옴, Impl - (selectOne, SESSOIN + ".getuser_id",user_id)
      // service - 
      // 존재하면 - 아이디를 보여줌 
      // 존재하지 않으면 - 아이디가 존재하지 않음 msg 출력 후 로그인 페이지로 이동
	*/

	// 아이디 찾기 기능 (phone)
	// 아이디 찾기 - 휴대폰번호로 찾기 클릭
	// url 패턴이 'path/findIdP'
	@RequestMapping(value = "/findIdP", method = RequestMethod.GET)
	public String helpIdP(Model model) throws Exception {
		return "main/findIdP";
	}
	
	// 아이디 찾기 기능 (email)
	// 아이디 찾기 - 이메일로 찾기 클릭
	// url 패턴이 'path/findIdE'
	@RequestMapping(value = "/findIdE", method = RequestMethod.GET)
	public String helpIdE(Model model) throws Exception {
		return "main/findIdE";
	}

	/* 비밀번호 찾기 관련 주석
	 // 가입된 아이디 기준으로 비밀번호 찾음
	 // 존재 확인
	 // 있으면 data = 0, data == 0이면 view에서 redirect(/sendPw) 시키기
	 // 없으면 data = -1, data == -1이면 view에서 alert 시키기
	*/

	// 비밀번호 찾기 기능 (phone)
	// 비밀번호찾기 - 휴대폰번호로 찾기 클릭
	// url 패턴이 'path/findPwP'
	@RequestMapping(value = "/findPwP", method = RequestMethod.GET)
	public String helpPwP(Model model) throws Exception {
		return "main/findPwP";
	}


	// 임시 비밀번호 전송 기능
   @RequestMapping(value = "/sendPw", method = RequestMethod.GET)
   public String sendPw(Model model) throws Exception {
      // 임시 비밀번호 만들고 전송
      // 그 임시 비밀번호로 업데이트
      return "/success";
   }
   
   // 임시 비밀번호 전송 성공
   @RequestMapping(value = "/success", method = RequestMethod.GET)
   public String success(Model model) throws Exception {
      return "login";
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
	// 회원가입 버튼 클릭 하면 정보 저장하고 회원가입 완료 페이지를 출력함
	
	@RequestMapping(value = "/joinSuccess", method = RequestMethod.POST)
	public String joinSuccess(Users user) throws Exception {

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