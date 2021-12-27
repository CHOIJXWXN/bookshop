package com.bookshop.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class PageException {
	
	// 404 에러
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String notFoundException(Exception e) {
		return "error/404";
	}
	
	@ExceptionHandler(Exception.class)
	public String AllException(Exception e, Model model) {
		model.addAttribute("msg", e.getCause());
		return "error/500";
	}

}
