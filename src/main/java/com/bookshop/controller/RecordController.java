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

import com.bookshop.service.RecordService;
import com.bookshop.vo.Book;

@Controller
@RequestMapping(value = "/record/*")
public class RecordController {
	
	@Inject
	RecordService recordService;
	
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
	public List<Book> search(String keyword, Integer pageNum, Model model) throws Exception {
		if (pageNum == null) {
			pageNum = 1;
		}
		return recordService.search(keyword, pageNum);
	}
	
	// 기록 입력 페이지
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write(Model model) throws Exception {
		return "";
	}
	
	// 기록 입력 기능
	@RequestMapping(value = "/addRecord", method = RequestMethod.GET)
	public String addRecord(Model model) throws Exception {
		return "";
	}
	
	// 기록 수정 페이지
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(Model model) throws Exception {
		return "";
	}
	
	// 기록 수정 기능
	@RequestMapping(value = "/editRecord", method = RequestMethod.GET)
	public String editRecord(Model model) throws Exception {
		return "";
	}
	
	// 기록 삭제 기능
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(Model model) throws Exception {
		return "";
	}
	
	// 기록 상세 페이지
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(Model model) throws Exception {
		return "";
	}
	
}