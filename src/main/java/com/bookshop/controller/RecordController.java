package com.bookshop.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bookshop.service.RecordService;

@Controller
@RequestMapping(value = "/record/*")
public class RecordController {
	
	@Inject
	RecordService recordService;
	
	private static final Logger logger = LoggerFactory.getLogger(RecordController.class);
	
	// 관리자 메인 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String record(Model model) throws Exception {
		return "";
	}
	
}