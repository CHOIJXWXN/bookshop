package com.bookshop.controller;

import java.util.HashMap;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookshop.service.BookService;
import com.bookshop.service.RecordService;
import com.bookshop.vo.Book;
import com.bookshop.vo.Record;

@Controller
@RequestMapping(value = "/record/*")
public class RecordController {
	
	@Inject
	RecordService recordService;
	@Inject
	BookService bookService;
	
	private static final Logger logger = LoggerFactory.getLogger(RecordController.class);
	
	// 기록 메인 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String record(Integer pageNum, HttpSession session, Model model) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		if (pageNum == null) {
			pageNum = 1;
		}
		model.addAttribute("map", recordService.view(user_id, pageNum));	// list, paging
		return "record/recordList";
	}
	
	// 책 검색 기능 (Ajax)
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> search(String keyword, Integer pageNum, Model model) throws Exception {
		if (pageNum == null) {
			pageNum = 1;
		}
		return recordService.search(keyword, pageNum);
	}
	
	// 기록 입력 페이지
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write(String book_id, HttpSession session, RedirectAttributes ra, Model model) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		Record result = recordService.getRecord(user_id, book_id);
		if (result != null) {
			ra.addFlashAttribute("msg", "이미 기록 적음");
			return "redirect:/record/";
		} else {
			model.addAttribute("book", bookService.view(book_id));
			return "record/recordWrite";
		}	
	}
	
	// 기록 입력 기능
	@RequestMapping(value = "/addRecord", method = RequestMethod.GET)
	public String addRecord(Record record, HttpSession session, Model model) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		record.setUser_id(user_id);
		recordService.write(record);
		return "redirect:/record/";
	}
	
	// 기록 수정 페이지
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(Record record, Model model) throws Exception {
		recordService.edit(record);
		int record_id = record.getRecord_id();
		return "redirect:/record/view?record_id=" + record_id;
	}
	
	// 기록 삭제 기능
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(int record_id, Model model) throws Exception {
		recordService.delete(record_id);
		return "redirect:/record/";
	}
	
	// 기록 상세 페이지
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(int record_id, Model model) throws Exception {
		model.addAttribute("recordPlus", recordService.viewOne(record_id));
		return "record/recordView";
	}
	
}