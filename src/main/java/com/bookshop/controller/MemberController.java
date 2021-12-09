package com.bookshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

// Mypage 관련 Controller

@Controller
@RequestMapping(value = "mypage/*")
public class MemberController {
	
	/*
	 * 매핑 더 필요함 (회원정보수정, 배송조회, 주문취소, 주문목록 등등) 
	 */
	// mypage - login 되어 있어야지 보임
	
	// 마이페이지
	// url 패턴이 'path/mypage/'
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(Model model) throws Exception {
		return "redirect:/maypage";
	}
	
	// 회원정보수정 page
	// url 패턴이 'path/mypage/profileUpdate' 
	@RequestMapping(value = "/profileUpdate", method = RequestMethod.GET)
	public String profileUpdate() throws Exception {
		
		return "";
	}
	
	// 회원정보 수정 완료
	// url 패턴이 'path/mypage/profileUpdateAction' 
	@RequestMapping(value = "/profileUpdateAction", method = RequestMethod.GET)
	public String profileUpdateAction() throws Exception {
		
		return "";
	}
	
	// 주문 배송 조회 page 
	// url 패턴이 'path/member/orderstatus'
	@RequestMapping(value = "/orderstatus", method = RequestMethod.GET)
	public String orderstatus() throws Exception{
		
		return "/주문페이지";
	}
	
	
	// 배송 조회
	@RequestMapping(value = "/derivery", method = RequestMethod.GET)
	public String derivery() throws Exception {
		
		return "";
	}
	
	// 주문 조회
	@RequestMapping(value = "/orderlist", method = RequestMethod.GET)
	public String orderlist() throws Exception {
		// 주문한 상품 리스트 받아오기
		// List<order>
		return "";
	}
	
	// 주문 취소
	@RequestMapping(value = "/order_cancle", method = RequestMethod.GET)
	public String order_cancle() throws Exception {
		
		return "";
	}
	
	// 반품
	@RequestMapping(value = "/takeback", method = RequestMethod.GET)
	public String takeback() throws Exception {
		
		return "";
	}
	
	// 환불
	@RequestMapping(value = "refund", method = RequestMethod.GET)
	public String refund() throws Exception {
		
		return "";
	}
	
	
	
	
	
	
}
