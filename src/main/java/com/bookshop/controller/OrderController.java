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
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookshop.service.OrderService;
import com.bookshop.vo.Book;
import com.bookshop.vo.Cart;
import com.bookshop.vo.CartPlus;

@Controller
@RequestMapping(value = "/order/*")
public class OrderController {
	
	@Inject
	OrderService orderService;
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	// 주문 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String order(CartPlus cartPlus, Model model) throws Exception {
		model.addAttribute("cartPlus", cartPlus);
		return "";
	}
	
	/*
	 * 장바구니 바로가기 / 쇼핑 계속 하기
	 */
	// 장바구니 상품 추가 기능
	@RequestMapping(value = "/addCart", method = RequestMethod.GET)
	public String addCart(Cart cart) throws Exception {
		orderService.addCart(cart);
		return "";
	}
	
	/*
	 * onclick으로 해당 li나 td 태그 remove()
	 */
	// 장바구니 상품 삭제 기능 (Ajax)
	@RequestMapping(value = "/deleteCart", method = RequestMethod.GET)
	@ResponseBody
	public String deleteCart(Cart cart) throws Exception {
		if (cart.book_title == null) {
			return "-1"; // 아무 것도 선택하지 않고 삭제 버튼을 누르면 -1 반환
		} else {
			orderService.deleteCart(cart);
			return "0";  // 삭제했으면 0 반환
		}
	}
	
	// 장바구니 페이지
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(HttpSession session, Model model) throws Exception {
		// (해당 유저의 List<Cart>, List<Book>) HashMap
		String user_id = (String) session.getAttribute("user_id");
		model.addAttribute("cartPlus", orderService.viewCart(user_id));
		return "";
	}
	
	// 선택 상품 주문 기능
	@RequestMapping(value = "/getOrderSelect", method = RequestMethod.GET)
	public String getOrderSelect(CartPlus cartPlus, Model model) throws Exception {
		model.addAttribute("cartPlus", cartPlus);
		return "redirect:/";
	}
	
	// 전체 상품 주문 기능
	@RequestMapping(value = "/getOrderAll", method = RequestMethod.GET)
	public String getOrderAll(String user_id, Model model) throws Exception {
		model.addAttribute("cartPlus", orderService.viewCart(user_id));
		return "redirect:/";
	}

}
