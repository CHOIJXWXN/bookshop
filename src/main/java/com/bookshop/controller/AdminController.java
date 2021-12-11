package com.bookshop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/admin/*")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	// 관리자 메인 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String admin(Model model) throws Exception {
		return "admin/admin";
	}
	
	// 상품 관리 페이지
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String product(Model model) throws Exception {
		return "";
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
	@RequestMapping(value = "/deleteProduct", method = RequestMethod.GET)
	public String deleteProduct(Model model) throws Exception {
		return "";
	}
	
	// 주문 관리 페이지
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String order(Model model) throws Exception {
		return "admin/order";
	}

}
