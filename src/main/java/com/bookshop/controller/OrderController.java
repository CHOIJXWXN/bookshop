package com.bookshop.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookshop.service.MemberService;
import com.bookshop.service.OrderService;
import com.bookshop.vo.Cart;
import com.bookshop.vo.CartPlus;
import com.bookshop.vo.OrderList;
import com.bookshop.vo.Orders;

@Controller
@RequestMapping(value = "/order/*")
public class OrderController {
	
	@Inject
	OrderService orderService;
	@Inject
	MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	// 주문 페이지 (장바구니 선택 주문)
	@RequestMapping(params = "select", value = "/", method = RequestMethod.POST)
	public String select(@RequestParam List<String> checked_book_id, @RequestParam List<String> book_id, @RequestParam List<Integer> book_cnt, HttpSession session, Model model) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		// 각 상품의 수량 수정
		for (var i = 0; i < book_id.size(); i++) {
			orderService.updateCart(new Cart(user_id, book_id.get(i), book_cnt.get(i)));
		}
		// 선택된 상품 리스트
		model.addAttribute("selectList", orderService.viewCertainCart(user_id, checked_book_id));
		// 유저 정보
		model.addAttribute("user", memberService.getUserInfo(user_id));
		// 주문 번호
		model.addAttribute("orderNum", orderService.newOrderNum());
		return "shop/order";
	}
	
	// 주문 페이지 (장바구니 전체 주문)
	@RequestMapping(params = "all", value = "/", method = RequestMethod.POST)
	public String all(@RequestParam List<String> book_id, @RequestParam List<Integer> book_cnt, HttpSession session, Model model) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		// 각 상품의 수량 수정
		for (var i = 0; i < book_id.size(); i++) {
			orderService.updateCart(new Cart(user_id, book_id.get(i), book_cnt.get(i)));
		}
		// 해당 유저의 장바구니 모든 상품 리스트
		model.addAttribute("allList", orderService.viewCart(user_id));
		// 유저 정보
		model.addAttribute("user", memberService.getUserInfo(user_id));
		// 주문 번호
		model.addAttribute("orderNum", orderService.newOrderNum());
		return "shop/order";
	}
	
	// 주문 페이지 (바로 주문)
	@RequestMapping(params = "direct", value = "/", method = RequestMethod.POST)
	public String order(CartPlus cartPlus, HttpSession session, Model model) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		// 선택된 상품 정보
		model.addAttribute("direct", cartPlus);
		// 유저 정보
		model.addAttribute("user", memberService.getUserInfo(user_id));
		// 주문 번호
		model.addAttribute("orderNum", orderService.newOrderNum());
		return "shop/order";
	}
	
	// 장바구니 상품 추가 기능
	@RequestMapping(value = "/addCart", method = RequestMethod.POST)
	@ResponseBody
	public String addCart(Cart cart) throws Exception {
		return orderService.addCart(cart) + "";
	}
	
	// 장바구니 상품 삭제 기능
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	@ResponseBody
	public String deleteCart(@RequestParam List<String> book_id, String user_id) throws Exception {
		if (book_id.contains("none")) {
			return "-1"; // 아무 것도 선택하지 않고 삭제 버튼을 누르면 -1 반환
		} else {
			orderService.deleteCart(user_id, book_id);
			return "0";  // 삭제했으면 0 반환
		}
	}
	
	// 장바구니 페이지
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(HttpSession session, Model model) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		// 해당 유저의 장바구니 리스트
		model.addAttribute("list", orderService.viewCart(user_id));
		return "shop/cart";
	}
	
	// 결제 기능
	/*
	 * return { 0 : 결제 완료
	 * 			1 : 결제 실패
	 * 		  				}
	 */
	@RequestMapping(value = "/paid", method = RequestMethod.POST)
	@ResponseBody
	public String paid(String merchant_uid, Orders order, @RequestParam Integer point_use, @RequestParam Integer point_add, @RequestParam List<String> book_id, @RequestParam List<Integer> book_cnt) throws Exception {
		// 입력값 누락 처리
		if (point_use == null) {
			point_use = 0;
		}
		if (point_add == null) {
			point_add = 0;
		}
		if (book_id.contains("none")) {
			return "-1";
		}
		if (book_cnt.contains(0)) {
			return "-1";
		}
		// 주문 추가
		int result = orderService.addOrder(order);
		if (result == 1) {
			// 포인트 차감/적립
			orderService.point(order.getUser_id(), point_use, point_add);
			// 판매량 증가 / 주문 목록 추가
			for (int i = 0; i < book_id.size(); i++) {
				orderService.paid(new Cart("", book_id.get(i), book_cnt.get(i)), new OrderList(order.getOrder_num(), book_id.get(i), book_cnt.get(i)));
			}
		}
		return result + "";
	}
	
	// 결제 성공 페이지
	@RequestMapping(value = "/orderSuccess", method = RequestMethod.GET)
	public String orderSuccess(HttpSession session, Model model) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		// 주문 정보
		model.addAttribute("map", orderService.orderInfo(user_id)); // order, point
		return "shop/orderSuccess";
	}

}