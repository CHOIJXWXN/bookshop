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

import com.bookshop.service.BookService;
import com.bookshop.vo.Book;
import com.bookshop.vo.Review;

@Controller
@RequestMapping(value = "/book/*")
public class BookController {
	
	@Inject
	BookService bookService;
	
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	
	// 책 메인 페이지 (all, 판매량순)
	/*
	 * book_genre { -1 : 전체
	 * 				 0 : 소설
	 * 				 1 : 시/에세이
	 * 				 2 : 여행		  }
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String book(Integer pageNum, Model model, String book_genre) throws Exception {
		if (pageNum == null) {
			pageNum = 1;
		}
		if (book_genre == null) {
			book_genre = "-1";
		}
		if (book_genre.equals("-1")) {
			model.addAttribute("map", bookService.book("판매량순", "-1", pageNum));
		} else if (book_genre.equals("0")) {
			model.addAttribute("map", bookService.book("판매량순", "0", pageNum));
		} else if (book_genre.equals("1")) {
			model.addAttribute("map", bookService.book("판매량순", "1", pageNum));
		} else if (book_genre.equals("2")) {
			model.addAttribute("map", bookService.book("판매량순", "2", pageNum));
		}
		return "shop/books";
	}
	
	// 책 메인 페이지 (all, 신규출간순)
	@RequestMapping(value = "/recentTop", method = RequestMethod.GET)
	public String recentTop(Integer pageNum, Model model) throws Exception {
		if (pageNum == null) {
			pageNum = 1;
		}
		model.addAttribute("map", bookService.book("신규출간순", "-1", pageNum));
		return "shop/books";
	}
	
	// 책 메인 페이지 (all, 리뷰순)
	@RequestMapping(value = "/reviewTop", method = RequestMethod.GET)
	public String reviewTop(Integer pageNum, Model model) throws Exception {
		if (pageNum == null) {
			pageNum = 1;
		}
		model.addAttribute("map", bookService.book("리뷰순", "-1", pageNum));
		return "shop/books";
	}
	
	// 시 소설 에세이 카테고리별 페이지 추가

	// 책 검색 기능 (Ajax)
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> search(String keyword, Integer pageNum) throws Exception {
		if (pageNum == null) {
			pageNum = 1;
		}
		return bookService.searchBook(keyword, pageNum);
	}	
	
	// 책 베스트셀러 페이지
	@RequestMapping(value = "/best", method = RequestMethod.GET)
	public String best(HttpSession session, Model model) throws Exception {
		// (정해진 기간의 베스트 셀러 List<Book> + 유저 기반 추천 도서 List<Book>) HashMap 가져오기
		String user_id = (String) session.getAttribute("user_id");
		model.addAttribute("map", bookService.best(user_id));
		return "shop/booksBest";
	}
	
	// 책 상세 페이지
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(String book_id, Model model) throws Exception {
		model.addAttribute("book", bookService.view(book_id));
		return "shop/bookDetail";
	}
	
	// 책 리뷰 탭 기능 (Ajax)
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> review(String book_id, Integer pageNum) throws Exception {
		if (pageNum == null) {
			pageNum = 1;
		}
		return bookService.showReview(book_id, pageNum);
	}
	
   // 책 리뷰 추가 기능 (ajax)
   @RequestMapping(value = "/addReview", method = RequestMethod.GET)
   @ResponseBody
   public HashMap<String, Object> addReview(Review review, Integer pageNum) throws Exception {
      if (pageNum == null) {
         pageNum = 1;
      }
      bookService.addReview(review);
      return bookService.showReview(review.getBook_id(), pageNum);
   }

}
