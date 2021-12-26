package com.bookshop.controller;

import java.util.List;

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
import com.bookshop.vo.OrderItem;
import com.bookshop.vo.Users;

@Controller
@RequestMapping(value = "/mypage/*")
public class MemberController {
	
	@Inject
	MemberService memberService;
	
	@Inject
	UsersService usersService;
	
	// [1] 마이페이지 메인화면 page
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mypage(Model model) throws Exception {
			return "member/myPage";		
	}
	
	// [2] 회원정보수정
	
	// [2-1] 회원정보 수정 페이지 접근시 본인 인증 페이지
	@RequestMapping(value = "/checkUser", method = RequestMethod.GET)
	public String checkUser(Model model) throws Exception {	
		return "member/checkUser";
	}
	
	// [2-2] 유저 본인 인증 비밀번호 재확인 기능
	@RequestMapping(value = "/pwCheck", method = RequestMethod.GET)
	@ResponseBody
	public String pwCheck(Users users, HttpSession session) throws Exception {		
		String user_id = (String) session.getAttribute("user_id");
		users.setUser_id(user_id);
		int result = usersService.loginAction(users);
		return result + "";
	}	
	
	// [2-3] 회원정보수정 page 
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(Model model, RedirectAttributes ra, HttpSession session) throws Exception {
		
		String user_id = (String) session.getAttribute("user_id");
		Users users = memberService.getUserInfo(user_id);
		//주소를 문자열 분리
		String[] addrList = users.getUser_addr().split("_");
		String addr_1 = addrList[0];
		String addr_2 = addrList[1];
		String addr_3 = addrList[2];
		
		model.addAttribute("users", users);
		model.addAttribute("addr_1", addr_1);
		model.addAttribute("addr_2", addr_2);
		model.addAttribute("addr_3", addr_3);
				
		return "member/profile";
	}
	
	// [3] 회원정보 수정 기능
	@RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
	public String updateProfile(Users users, String addr_1, String addr_2, String addr_3, RedirectAttributes ra, HttpSession session) throws Exception {	
		String user_id = (String) session.getAttribute("user_id");
		// 로그인된 유저와 업데이트하고자 하는 회원정보가 일치하는지 검증
		// 1) 불일치한다면 페이지 이동 후 메시지 출력
		if(!user_id.equals(users.getUser_id())) {
			ra.addFlashAttribute("msg", "권한이 없습니다.");
			return "redirect:/mypage";
		}
		// 2) 일치한다면 프로필 업데이트 실행
		users.setUser_addr(addr_1 + "_" + addr_2 + "_" + addr_3);
		memberService.updateProfile(users);
		// +) 필수 입력값을 다 입력했는지는 검증(ajax)
			
		return "redirect:/mypage/profile";
	}
	
	// [4] 주문 배송 조회 page 
	@RequestMapping(value = "/delivery", method = RequestMethod.GET)
	public String delivery(Integer pageNumber, Model model, RedirectAttributes ra, HttpSession session) throws Exception{
		
		String user_id = (String) session.getAttribute("user_id");

		// 1) 주문번호, 주문날짜, 주문상태, 책아이디, 책별 수량, 책표지, 책제목, 작가, 가격 가져오기
		if(pageNumber == null) pageNumber = 1;
		List<OrderItem> list = memberService.viewOrderList(user_id, pageNumber);	
		model.addAttribute("list", list);
		// 2) 다음 페이지 존재하는지 
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("isNext", memberService.getPageIs(user_id, pageNumber));
		// 3)보유 포인트를 가져오기
		model.addAttribute("point", memberService.getPoint(user_id));
		// 4) 주문목록 건수 받아오기
		model.addAttribute("order_cnt", memberService.getOrderCnt(user_id));
		
		return "member/orderList";
		
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