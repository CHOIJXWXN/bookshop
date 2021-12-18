package com.bookshop.controller;

import java.util.ArrayList;
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
import com.bookshop.vo.Users;

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
		user_id = "abcd";
		Cart cart;
		List<CartPlus> cartPlus = new ArrayList<CartPlus>();
		for (var i = 0; i < book_id.size(); i++) {
			cart = new Cart(user_id, book_id.get(i), book_cnt.get(i));
			orderService.updateCart(cart);
		}
		for (var i = 0; i < checked_book_id.size(); i++) {
			cart = new Cart();
			cart.setUser_id(user_id);
			cart.setBook_id(checked_book_id.get(i));
			cartPlus.add(orderService.viewCertainCart(cart));
		}
		model.addAttribute("selectList", cartPlus);
		model.addAttribute("user", memberService.getUserInfo(user_id));
		return "shop/order";
	}
	
	// 주문 페이지 (장바구니 전체 주문)
	@RequestMapping(params = "all", value = "/", method = RequestMethod.POST)
	public String all(@RequestParam List<String> book_id, @RequestParam List<Integer> book_cnt, HttpSession session, Model model) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		user_id = "abcd";
		Cart cart;
		for (var i = 0; i < book_id.size(); i++) {
			cart = new Cart(user_id, book_id.get(i), book_cnt.get(i));
			orderService.updateCart(cart);
		}
		model.addAttribute("allList", orderService.viewCart(user_id));
		model.addAttribute("user", memberService.getUserInfo(user_id));
		return "shop/order";
	}
	
	// 주문 페이지 (바로 주문)
	@RequestMapping(params = "direct", value = "/", method = RequestMethod.GET)
	public String order(CartPlus cartPlus, HttpSession session, Model model) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		user_id = "abcd";
		model.addAttribute("direct", cartPlus);
		model.addAttribute("user", memberService.getUserInfo(user_id));
		return "shop/order";
	}
	
	/*
	 * 장바구니 바로가기 / 쇼핑 계속 하기
	 */
	// 장바구니 상품 추가 기능
	@RequestMapping(value = "/addCart", method = RequestMethod.GET)
	@ResponseBody
	public String addCart(Cart cart) throws Exception {
		return orderService.addCart(cart) + "";
	}
	
	/*
	 * onclick으로 해당 li나 td 태그 remove()
	 */
	// 장바구니 상품 삭제 기능 (Ajax)
	@RequestMapping(value = "/deleteCart", method = RequestMethod.GET)
	@ResponseBody
	public String deleteCart(CartPlus cartPlus) throws Exception {
		if (cartPlus.getBook_title() == null) {
			return "-1"; // 아무 것도 선택하지 않고 삭제 버튼을 누르면 -1 반환
		} else {
			orderService.deleteCart(cartPlus);
			return "0";  // 삭제했으면 0 반환
		}
	}
	
	// 장바구니 페이지
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(HttpSession session, Model model) throws Exception {
		// (해당 유저의 List<Cart>, List<Book>) HashMap
		String user_id = (String) session.getAttribute("user_id");
		user_id = "abcd";
		model.addAttribute("list", orderService.viewCart(user_id));
		return "shop/cart";
	}
	
	// 선택 상품 주문 기능
	@RequestMapping(value = "/getOrderSelect", method = RequestMethod.GET)
	public String getOrderSelect(CartPlus cartPlus, Model model) throws Exception {
		model.addAttribute("cartPlus", cartPlus);
		return "redirect:/order/";
	}
	
	// 전체 상품 주문 기능
	@RequestMapping(value = "/getOrderAll", method = RequestMethod.GET)
	public String getOrderAll(String user_id, Model model) throws Exception {
		model.addAttribute("cartPlus", orderService.viewCart(user_id));
		return "redirect:/order/";
	}

}