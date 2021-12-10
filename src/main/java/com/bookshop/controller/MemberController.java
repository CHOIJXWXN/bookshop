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
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mypage(Model model) throws Exception {
		return "member/myPage";
	}
	
	// 회원정보수정 page
	// url 패턴이 'path/mypage/profileUpdate' 
	@RequestMapping(value = "/profileUpdate", method = RequestMethod.GET)
	public String profileUpdate() throws Exception {
		
		return "member/myInfo";
	}
	
	// 회원정보 수정 완료
	// url 패턴이 'path/mypage/profileUpdateAction' 
	@RequestMapping(value = "/profileUpdateAction", method = RequestMethod.GET)
	public String profileUpdateAction() throws Exception {
		
		return "redirect:/profileUpdate";
	}
	
	// 주문 배송 조회 page 
	// url 패턴이 'path/mypage/orderstatus'
	@RequestMapping(value = "/orderstatus", method = RequestMethod.GET)
	public String orderstatus() throws Exception{
		
		//userId가 매칭되는 ordernum(ORDERS) -> book_id(ORDERLIST) -> book_name,author(BOOK)
		// 주문날짜, 주문번호, 책 제목, 작가, 상품금액, 수량, 주문상태를 리스트로 받아와서 띄움
		// 보유 포인트를 받아와서 표시
		// 한페이지에 4개 리스트보여줌 이전/다음
		
		
		return "member/orderList";
	}
	
	
	// 배송 조회
	@RequestMapping(value = "/delivery", method = RequestMethod.GET)
	public String delivery() throws Exception {
		
		//API 이용
		
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
		
		// 배송준비중/상품준비중/입금전 일 때 주문취소 버튼 활성화
		// 주문취소 클릭시 재확인 팝업을 띄우고 확인시 주문상태 업데이트? 주문리스트에서 삭제? 
		
		return "";
	}
	
	// 상품 교환 처리
	@RequestMapping(value = "/takeback", method = RequestMethod.GET)
	public String takeback() throws Exception {
		
		// 주문상태가 배송완료로 바뀌고 나서 교환/반품 버튼 활성화
		// 교환/반품 클릭시 모달창을 띄움
		// 모달창에서 반품 신청종류 선택 & 신청 사유(필수) 적고 신청접수 버튼 클릭
		// 버튼 클릭시 주문 상태는 반품 처리중으로 업데이트 
		// 신청사유는 null값에서 업데이트? claim 테이블? 
		
		return "redirect:/orderlist";
	}
	
	// 상품 환불 처리
	@RequestMapping(value = "/refund", method = RequestMethod.GET)
	public String refund() throws Exception {
		
		// 주문상태가 배송완료로 바뀌고 나서 교환/반품 버튼 활성화
		// 교환/반품 클릭시 모달창을 띄움
		// 모달창에서 교환/반품 신청종류 선택 & 신청 사유(필수) 적고 신청접수 버튼 클릭
		// 버튼 클릭시 주문 상태는 교환/반품 처리중으로 업데이트 
		// 신청사유는 null값에서 업데이트? claim 테이블? 
		
		return "redirect:/orderlist";
	}
	
	// 교환/ 반품/ 처리 페이지 
	
	
	
	
	
	
}
