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
import com.bookshop.vo.OrderList;
import com.bookshop.vo.Orders;
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
		List<CartPlus> cartPlus = new ArrayList<CartPlus>();
		for (var i = 0; i < book_id.size(); i++) {
			orderService.updateCart(new Cart(user_id, book_id.get(i), book_cnt.get(i)));
		}
		for (var i = 0; i < checked_book_id.size(); i++) {
			cartPlus.add(orderService.viewCertainCart(new Cart(user_id, checked_book_id.get(i), 0)));
		}
		model.addAttribute("selectList", cartPlus);
		model.addAttribute("user", memberService.getUserInfo(user_id));
		model.addAttribute("orderNum", orderService.newOrderNum());
		return "shop/order";
	}
	
	// 주문 페이지 (장바구니 전체 주문)
	@RequestMapping(params = "all", value = "/", method = RequestMethod.POST)
	public String all(@RequestParam List<String> book_id, @RequestParam List<Integer> book_cnt, HttpSession session, Model model) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		for (var i = 0; i < book_id.size(); i++) {
			orderService.updateCart(new Cart(user_id, book_id.get(i), book_cnt.get(i)));
		}
		model.addAttribute("allList", orderService.viewCart(user_id));
		model.addAttribute("user", memberService.getUserInfo(user_id));
		model.addAttribute("orderNum", orderService.newOrderNum());
		return "shop/order";
	}
	
	// 주문 페이지 (바로 주문)
	@RequestMapping(params = "direct", value = "/", method = RequestMethod.GET)
	public String order(CartPlus cartPlus, HttpSession session, Model model) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		model.addAttribute("direct", cartPlus);
		model.addAttribute("user", memberService.getUserInfo(user_id));
		model.addAttribute("orderNum", orderService.newOrderNum());
		return "shop/order";
	}
	
	// 장바구니 상품 추가 기능
	@RequestMapping(value = "/addCart", method = RequestMethod.GET)
	@ResponseBody
	public String addCart(Cart cart) throws Exception {
		return orderService.addCart(cart) + "";
	}
	
	// 장바구니 상품 삭제 기능 (Ajax)
	@RequestMapping(value = "/deleteCart", method = RequestMethod.GET)
	@ResponseBody
	public String deleteCart(@RequestParam List<String> book_id, String user_id) throws Exception {
		if (book_id.contains("none")) {
			return "-1"; // 아무 것도 선택하지 않고 삭제 버튼을 누르면 -1 반환
		} else {
			Cart cart;
			for (int i = 0; i < book_id.size(); i++) {
				cart = new Cart(user_id, book_id.get(i), 0);
				orderService.deleteCart(cart);
			}
			return "0";  // 삭제했으면 0 반환
		}
	}
	
	// 장바구니 페이지
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(HttpSession session, Model model) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
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
	
	@RequestMapping(value = "/paid", method = RequestMethod.POST)
	@ResponseBody
	public String paid(String merchant_uid, Orders order, int point_use, int point_add, @RequestParam List<String> book_id, @RequestParam List<Integer> book_cnt) throws Exception {
		// 주문 추가
		int result = orderService.addOrder(order);
		if (result == 1) {
			// 포인트 차감/적립
			orderService.point(merchant_uid, point_use, point_add);
			// 판매량 증가 / 주문 목록 추가
			Cart cart;
			OrderList orderList;
			for (int i = 0; i < book_id.size(); i++) {
				cart = new Cart("", book_id.get(i), book_cnt.get(i));
				orderList = new OrderList(order.getOrder_num(), book_id.get(i), book_cnt.get(i));
				orderService.sellTot(cart);
				orderService.addOrderlist(orderList);
			}
		} else {
			
		};
		return result + "";
	}

}