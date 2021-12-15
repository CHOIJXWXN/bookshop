package com.bookshop.controller;

import java.util.ArrayList;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookshop.service.AdminService;

@Controller
@RequestMapping(value = "/admin/*")
public class AdminController {
	
	@Inject
	AdminService adminService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	// 관리자 메인 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String admin(Model model) throws Exception {
		return "admin/admin";
	}
	
	// 주문 관리 페이지
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String order(Integer pageNum, Model model) throws Exception {
		if (pageNum == null) {
			pageNum = 1;
		}
		// 해당 페이지의 주문 리스트
		model.addAttribute("list", adminService.viewOrder(pageNum).get("list"));
		// 각각 입금전/배송중/배송완료/총 주문 개수
		model.addAttribute("before", adminService.viewOrder(pageNum).get("before"));
		model.addAttribute("start", adminService.viewOrder(pageNum).get("start"));
		model.addAttribute("end", adminService.viewOrder(pageNum).get("end"));
		model.addAttribute("tot", adminService.viewOrder(pageNum).get("tot"));
		// 페이지 번호
		model.addAttribute("pageNum", pageNum);
		return "admin/order";
	}
	
	// 배송중 변경 기능 (Ajax)
	@RequestMapping(value = "/start", method = RequestMethod.GET)
	@ResponseBody
	public String start(String order_num, Model model) throws Exception {
		adminService.deliveryStart(order_num);
		return order_num;
	}
	
	// 배송완료 변경 기능 (Ajax)
	@RequestMapping(value = "/end", method = RequestMethod.GET)
	@ResponseBody
	public String end(String order_num, Model model) throws Exception {
		adminService.deliveryEnd(order_num);
		return order_num;
	}
	
	// 상품 관리 페이지
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String product(Integer pageNum, Model model) throws Exception {
		if (pageNum == null) {
			pageNum = 1;
		}
		model.addAttribute("map", adminService.viewProduct(pageNum));
		return "admin/product";
	}
	
	// 상품 입력
	@RequestMapping(value = "/addProduct", method = RequestMethod.GET)
	public String addProduct(Model model) throws Exception {
		return "";
	}

	// 상품 수정
	@RequestMapping(value = "/updateProduct", method = RequestMethod.GET)
	public String updateProduct(Model model) throws Exception {
		return "";
	}

	// 상품 삭제
	@RequestMapping(value = "/deleteProduct", method = RequestMethod.POST)
	public String deleteProduct(ArrayList<String> book_id, Model model) throws Exception {
		for (String item : book_id) {
			adminService.deleteProduct(item);
		}
		return "admin/admin";
	}
	
	// 문의 관리 페이지
	@RequestMapping(value = "/ask", method = RequestMethod.GET)
	public String ask(Model model) throws Exception {
		return "admin/ask";
	}
	
	// 문의 관리 페이지
	@RequestMapping(value = "/viewAsk", method = RequestMethod.GET)
	public String viewAsk(Model model) throws Exception {
		return "admin/ask";
	}
	
}
