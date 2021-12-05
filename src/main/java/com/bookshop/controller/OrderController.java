package com.bookshop.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/order/*")
public class OrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	// 주문 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String order(HttpSession session) throws Exception {
		// 책 상세 페이지에서 바로 주문한 경우
		// 장바구니 선택 상품 주문
		// 장바구니 전체 상품 주문
		return "";
	}
	
	/*
	 * 장바구니 바로가기 / 쇼핑 계속 하기
	 */
	// 장바구니 상품 추가 기능
	@RequestMapping(value = "/addCart", method = RequestMethod.GET)
	public String addCart(String user_id, Integer book_id) throws Exception {
		// 카트에 추가
		return "";
	}
	
	/*
	 * onclick으로 해당 li나 td 태그 remove()
	 */
	// 장바구니 상품 삭제 기능 (Ajax)
	@RequestMapping(value = "/deleteCart", method = RequestMethod.GET)
	@ResponseBody
	public String deleteCart(String user_id, Cart cart) throws Exception {
		// 체크된 상품을 장바구니에서 삭제
		// 아무것도 return 안 해줘도 됨
		return "";
	}
	
	// 장바구니 페이지
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(HttpSession session, Model model) throws Exception {
		// (해당 유저의 List<Cart>, List<Book>) HashMap
		model.addAttribute("map", map);
		return "";
	}
	
	// 선택 상품 주문 기능 (그냥 바로 /로 옮겨도 될 거 같음)
	@RequestMapping(value = "/getOrderSelect", method = RequestMethod.GET)
	public String getOrderSelect(Model model) throws Exception {
		return "redirect:/";
	}
	
	// 전체 상품 주문 기능
	@RequestMapping(value = "/getOrderAll", method = RequestMethod.GET)
	public String getOrderAll(String user_id, Model model) throws Exception {
		// (해당 유저의 List<Cart>, List<Book>) HashMap
		model.addAttribute("map", map);
		return "redirect:/";
	}

}
