package com.bookshop.controller;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookshop.service.BookService;
import com.bookshop.service.OrderService;
import com.bookshop.vo.Book;
import com.bookshop.vo.Cart;
import com.bookshop.vo.Review;

@Controller
@RequestMapping(value = "/book/*")
public class BookController {
	
	@Inject
	BookService bookService;
	OrderService orderService;
	
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	
	// 책 메인 페이지 (all, 판매량순)
	/*
	 * book_genre { -1 : 전체
	 * 				 0 : 소설
	 * 				 1 : 시/에세이
	 * 				 2 : 여행		  }
	 */
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String book() throws Exception {
		return "redirect:/book";
	}

	// 책 검색 기능 (Ajax)
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> search(String keyword, String book_genre, Integer pageNum) throws Exception {
		if (pageNum == null) {
			pageNum = 1;
		}
		if (book_genre == null) {
			book_genre = "-1";
		}
		return bookService.searchBook(keyword, book_genre, pageNum);
	}	
	
	// 책 베스트셀러 페이지
	@RequestMapping(value = "/best", method = RequestMethod.GET)
	public String best(HttpSession session, Model model) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		if (user_id == null) {
			user_id = "";
		}
		model.addAttribute("map", bookService.best(user_id));
		return "shop/booksBest";
	}
	
	// 책 상세 페이지
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(String book_id, RedirectAttributes ra, HttpSession session, Model model) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		Book book = bookService.view(book_id);
		if (book == null) {
			ra.addFlashAttribute("msg", "해당 책이 존재하지 않습니다");
			return "redirect:/book";
		}
		model.addAttribute("book", book);
		model.addAttribute("user_id", user_id);
		return "shop/bookDetail";
	}
	
	// 책 리뷰 탭 기능 (Ajax)
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> review(String book_id, Integer pageNumber) throws Exception {
		if (pageNumber == null) {
			pageNumber = 1;
		}
		return bookService.showReview(book_id, pageNumber);
	}
	
   // 책 리뷰 추가 기능 (Ajax)
   @RequestMapping(value = "/addReview", method = RequestMethod.GET)
   @ResponseBody
   public HashMap<String, Object> addReview(Review review, Integer pageNum) throws Exception {
      if (pageNum == null) {
         pageNum = 1;
      }
      int flag = 0;
      if(bookService.flag(review) == 0) {
    	  bookService.addReview(review);
      } else {
    	  flag = 1;	//이미 존재할 때
      }
      HashMap<String, Object> map = bookService.showReview(review.getBook_id(), pageNum);      
      map.put("flag", flag);
      
      return map;
   }

}