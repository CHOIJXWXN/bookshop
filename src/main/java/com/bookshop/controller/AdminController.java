package com.bookshop.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookshop.service.AdminService;
import com.bookshop.vo.AskList;
import com.bookshop.vo.Book;

@Controller
@RequestMapping(value = "/admin/*")
public class AdminController {
	
	@Inject
	AdminService adminService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	// 관리자 메인 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String admin(HttpSession session, Model model) throws Exception {
		return "redirect:/admin";
	}
	
	// 주문 관리 페이지
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String order(Integer pageNum, Model model) throws Exception {
		if (pageNum == null) {
			pageNum = 1;
		}
		// 해당 페이지의 주문 리스트
		model.addAttribute("map", adminService.viewOrder(pageNum)); // listSeparate, listUnited, before, start, end, tot
		// 페이지 번호
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("isNext", adminService.getNextPage(pageNum, "orders"));             
		return "admin/order";
	}
	
	// 배송중 변경 기능
	@RequestMapping(params = "status", value = "/changeStatus", method = RequestMethod.GET)
	public String start(@RequestParam List<String> order_num, String status, HttpServletRequest request, Model model) throws Exception {
		for (var i = 0; i < order_num.size(); i++) {
			adminService.delivery(status, order_num.get(i));
		}
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}
	
	// 상품 관리 페이지
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String product(Integer pageNum, Model model) throws Exception {
		if (pageNum == null) {
			pageNum = 1;
		}
		model.addAttribute("map", adminService.viewProduct(pageNum));
		model.addAttribute("isNext", adminService.getNextPage(pageNum, "book"));   
		model.addAttribute("pageNum", pageNum);
		return "admin/product";
	}
	
	// 상품 입력
	@RequestMapping(value = "/addProduct", method = RequestMethod.GET)
	public String addProduct(Model model) throws Exception {
		return "admin/addProduct";
	}
	
	// 상품 입력 기능
	@RequestMapping(value = "/addProductAction", method = RequestMethod.POST)
	public String addProductAction(Book book, MultipartFile book_cover_file, Model model) throws Exception {
		adminService.addProduct(book, book_cover_file);
		return "redirect:/admin/product";
	}

	// 상품 삭제
	@RequestMapping(value = "/deleteProduct", method = RequestMethod.POST)
	public String deleteProduct(@RequestParam List<String> book_id, Model model, HttpServletRequest request, RedirectAttributes ra) throws Exception {
		if (book_id == null) {
			ra.addFlashAttribute("msg", "상품이 선택되지 않았습니다");
			return "redirect:/admin/product";
		}
		for (int i = 0; i < book_id.size(); i++) {
			adminService.deleteProduct(book_id.get(i));
		}
		// 컨트롤러에서 새로고침
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}
	
	// 문의 관리 페이지
	@RequestMapping(value = "/ask", method = RequestMethod.GET)
	public String ask(Model model, AskList asklist, String book_id) throws Exception {
		
		List<AskList> list = adminService.getAdminAskList(asklist);
		
		model.addAttribute("list", list);
		
		return "admin/ask";
	}
	
	
	// 문의 관리 페이지
	@RequestMapping(value = "/viewAsk", method = RequestMethod.GET)
	public String viewAsk(Model model) throws Exception {
		
		return "redirect:/ask";
	}
	
	
}
