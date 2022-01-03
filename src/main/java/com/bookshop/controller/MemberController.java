package com.bookshop.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookshop.service.MemberService;
import com.bookshop.service.UsersService;
import com.bookshop.vo.Users;

@Controller
@RequestMapping(value = "/mypage/*")
public class MemberController {
	
	@Inject
	MemberService memberService;	
	@Inject
	UsersService usersService;
	
	// 마이페이지 메인 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mypage(Model model) throws Exception {
		return "redirect:/mypage";		
	}

	// 회원정보 수정 전 비밀번호 재확인 페이지
	@RequestMapping(value = "/checkUser", method = RequestMethod.GET)
	public String checkUser(Model model) throws Exception {	
		return "member/checkUser";
	}
	
	// 비밀번호 재확인 기능
	/*
	 * return { 0 : 일반 유저
	 * 			1 : 관리자
	 * 		   -1 : 불일치
	 * 		  				}
	 */
	@RequestMapping(value = "/pwCheck", method = RequestMethod.GET)
	@ResponseBody
	public String pwCheck(Users users, HttpSession session) throws Exception {		
		String user_id = (String) session.getAttribute("user_id");
		users.setUser_id(user_id);
		return usersService.loginAction(users) + "";
	}	
	
	// 회원정보 수정 페이지
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(RedirectAttributes ra, Model model, HttpSession session) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		Users users = memberService.getUserInfo(user_id);
		// 주소 분리
		String[] addrList = users.getUser_addr().split("_");
		String addr_1 = addrList[0];
		String addr_2 = addrList[1];
		String addr_3 = addrList[2];
		// 유저 정보
		model.addAttribute("users", users);
		model.addAttribute("addr_1", addr_1);
		model.addAttribute("addr_2", addr_2);
		model.addAttribute("addr_3", addr_3);				
		return "member/profile";	
	}
	
	// 회원정보 수정 기능
	@RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
	public String updateProfile(Users users, String addr_1, String addr_2, String addr_3, RedirectAttributes ra, HttpSession session) throws Exception {	
		String user_id = (String) session.getAttribute("user_id");
		// 권한 검증
		if(!user_id.equals(users.getUser_id())) {
			ra.addFlashAttribute("msg", "권한이 없습니다.");
			return "redirect:/mypage";
		}
		// 회원정보 수정
		users.setUser_addr(addr_1 + "_" + addr_2 + "_" + addr_3);
		memberService.updateProfile(users);
		// +) 필수 입력값을 다 입력했는지는 검증(ajax)			
		return "redirect:/mypage/profile";
	}
	
	// 회원 탈퇴 기능
	@RequestMapping(value = "/deleteAccount", method = RequestMethod.POST)
	public String deleteAccount(HttpSession session) throws Exception {	
		String user_id = (String) session.getAttribute("user_id");
		memberService.delete(user_id);
		return "redirect:/";
	}
	
	// 주문 배송 조회 페이지 
	@RequestMapping(value = "/delivery", method = RequestMethod.GET)
	public String delivery(Integer pageNumber, Model model, HttpSession session) throws Exception{		
		String user_id = (String) session.getAttribute("user_id");
		if (pageNumber == null) {
			pageNumber = 1;
		}
		// OrderItem 리스트
		model.addAttribute("list", memberService.viewOrderList(user_id, pageNumber));
		// 페이지 번호
		model.addAttribute("pageNumber", pageNumber);
		// 다음 페이지 존재 여부
		model.addAttribute("isNext", memberService.getPageIs(user_id, pageNumber));
		// 해당 유저의 포인트
		model.addAttribute("point", memberService.getPoint(user_id));
		// 해당 유저의 주문목록 건수
		model.addAttribute("order_cnt", memberService.getOrderCnt(user_id));
		return "member/orderList";		
	}	
	
	
	
}