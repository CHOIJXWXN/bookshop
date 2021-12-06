package com.bookshop.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookshop.service.BookService;

@Controller
@RequestMapping(value = "/book/*")
public class BookController {
	
	@Inject
	BookService bookService;
	
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	
	// 책 메인 페이지 (all, 판매량순)
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String book(Integer pageNum, Model model) throws Exception {
		if (pageNum == null) {
			pageNum = 1;
		}
		model.addAttribute("map", bookService.book("판매량순", pageNum));
		return "";
	}
	
	// 책 메인 페이지 (all, 신규출간순)
	@RequestMapping(value = "/recentTop", method = RequestMethod.GET)
	public String recentTop(Integer pageNum, Model model) throws Exception {
		if (pageNum == null) {
			pageNum = 1;
		}
		model.addAttribute("map", bookService.book("신규출간순", pageNum));
		return "";
	}
	
	// 책 메인 페이지 (all, 리뷰순)
	@RequestMapping(value = "/reviewTop", method = RequestMethod.GET)
	public String reviewTop(Integer pageNum, Model model) throws Exception {
		if (pageNum == null) {
			pageNum = 1;
		}
		model.addAttribute("map", bookService.book("리뷰순", pageNum));
		return "";
	}	

	// 책 검색 기능 (Ajax)
	@RequestMapping(value = "/searchBook", method = RequestMethod.GET)
	@ResponseBody
	public String searchBook(String keyword) throws Exception {
		// 키워드 받아서 책 검색
		// List<Book> 전송
		// view에서 data == null이면 검색 결과 없다고 띄움
		// view에서 else면 전송 데이터 띄움
		return "";
	}	
	
	// 책 베스트셀러 페이지
	@RequestMapping(value = "/best", method = RequestMethod.GET)
	public String best(HttpSession session, Model model) throws Exception {
		// (정해진 기간의 베스트 셀러 List<Book> + 유저 기반 추천 도서 List<Book>) HashMap 가져오기 
		model.addAttribute("map", map);
		return "";
	}
	
	// 책 상세 페이지
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Integer book_id, Model model) throws Exception {
		// book_id로 Book 인스턴스 가져오기
		model.addAttribute("book", book);
		return "";
	}
	
	// 책 리뷰 탭 기능 (Ajax)
	@RequestMapping(value = "/showReview", method = RequestMethod.GET)
	@ResponseBody
	public String showReview(Integer book_id, Model model) throws Exception {
		// book_id로 List<Review> 전송
		// view에서 data == null이면 첫 리뷰를 작성해보세요! 같은 거 띄우기
		// view에서 else면 전송 데이터 띄움
		return "";
	}
	
	// 책 리뷰 추가 기능
	/*
	 * https://walbatrossw.github.io/spring-mvc/2018/03/13/12-spring-mvc-board-ajax-reply-presentation.html
	 */
	@RequestMapping(value = "/addReview", method = RequestMethod.GET)
	public String addReview(Model model) throws Exception {
		return "";
	}

}
