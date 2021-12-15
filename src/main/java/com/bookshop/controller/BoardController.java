package com.bookshop.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bookshop.service.BoardService;

@Controller
@RequestMapping(value = "/board/*")
public class BoardController {
	
	@Inject
	BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	// 주문 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String board(Model model) throws Exception {
		return "board/boardList";
	}

}
