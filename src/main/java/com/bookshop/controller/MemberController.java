package com.bookshop.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookshop.vo.Users;
import com.bookshop.service.MemberService;

// Mypage 관련 Controller

@Controller
@RequestMapping(value = "/mypage/*")
public class MemberController {
	
	@Inject
	MemberService memberService;

	// mypage - login 되어 있어야지 보임
	
	// 마이페이지 메인화면 page
	// url 패턴이 'path/mypage/'
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mypage(RedirectAttributes ra, HttpSession session) throws Exception {
		
		// 1) 로그인이 되어있지 않으면 로그인 페이지로 이동시키고 로그인이 필요하다고 알려줌
//		if(session.getAttribute("user_id") == null) {
//			ra.addFlashAttribute("msg", "로그인이 필요합니다.");
//			return "redirect:/login";
//		}
		// 2) 로그인이 되어있으면 마이페이지 메인화면 출력
		return "member/myPage";
		
	}
	
	// 회원정보수정 page
	// url 패턴이 'path/mypage/profile' 
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(Model model, RedirectAttributes ra, HttpSession session) throws Exception {
		
		String user_id = "lsumin1127";
//		String user_id = (String) session.getAttribute("user_id");
		
		//1) 로그인이 되어있지 않으면 로그인 페이지로 이동시키고 로그인이필요하다고 알려줌
		if(user_id == null) {
			ra.addFlashAttribute("msg", "로그인이 필요합니다.");
			return "redirect:/login";
		}
		//2) 로그인이 되어있으면 유저 아이디에 일치하는 정보를 불러옴
		
		//3) 받아온 users 객체를 회원 정보 수정페이지 값 넘겨줌
		model.addAttribute("users", memberService.getUserInfo(user_id));
		
		
		return "member/profile";
	}
	
	// 회원정보 수정 기능
	// url 패턴이 'path/mypage/updateProfile' 
	// AJAX
	@RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
	@ResponseBody
	public String updateProfile(Users users, String addr1, String addr2, String addr3, RedirectAttributes ra, HttpSession session) throws Exception {
		
		String user_id = (String) session.getAttribute("user_id");
		//1) 로그인이 되어있지 않으면 로그인 페이지로 이동시키고 로그인이필요하다고 알려줌
		if(user_id == null) {
			ra.addFlashAttribute("msg", "로그인이 필요합니다.");
			return "redirect:/login";
		}
		//2) 로그인된 유저와 업데이트하고자 하는 회원정보가 일치하는지 검증 > 일치하지 않으면 권한이 없다고 알려줌
		if(!user_id.equals(users.getUser_id())) {
			ra.addFlashAttribute("msg", "권한이 없습니다.");
			return "redirect:/mypage";
		}
		//3) 일치한다면 프로필 업데이트 실행
		users.setUser_addr(addr1 + " " + addr2 + " " + addr3);
		memberService.updateProfile(users);
		// +) 필수 입력값을 다 입력했는지는 검증(ajax)
		
		
		return "redirect:/profile";
	}
	
	// 주문 배송 조회 page 
	// url 패턴이 'path/mypage/delivery'
	@RequestMapping(value = "/delivery", method = RequestMethod.GET)
	public String delivery(RedirectAttributes ra, HttpSession session) throws Exception{
		
		String user_id = (String) session.getAttribute("user_id");
		//1) 로그인이 되어있지 않으면 로그인 페이지로 이동시키고 로그인이필요하다고 알려줌
		if(user_id == null) {
			ra.addFlashAttribute("msg", "로그인이 필요합니다.");
			return "redirect:/login";
		}
		//2) userId가 매칭되는 ordernum(ORDERS) -> book_id(ORDERLIST) -> book_name,author(BOOK)
		
		// 주문날짜, 주문번호, 책 표지, 책 제목, 책id, 작가, 상품금액, 수량, 주문상태를 리스트로 받아와서 띄움
		// 보유 포인트를 받아와서 표시
		// 한페이지에 4개 리스트보여줌 이전/다음
		// 주문상태  입금전 배송중 배송완료
		// 입금전일 때 아무 버튼 x
		// 배송중일 때 배송추적 버튼
		// 배송완료일 때 리뷰쓰기 버튼 보이기
		
		
		return "member/delivery";
	}
	
	
	// 배송 조회
//	@RequestMapping(value = "/delivery", method = RequestMethod.GET)
//	public String delivery() throws Exception {
//		
//		API 이용
//		
//		return "";
//	}
	

	

	
	
	
	
	
	
}