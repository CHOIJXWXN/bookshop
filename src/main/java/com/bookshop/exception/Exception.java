package com.bookshop.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import org.springframework.http.HttpStatus;

@ControllerAdvice
public class Exception {	

	// 404 에러
	@ExceptionHandler({NoHandlerFoundException.class})
	public String notFoundException(Exception e) {
		return "error/404";
	}
	
	// 500 에러 / 일반적인 서버 에러 메세지로 요청 사항을 이행할 수 없는 상태
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	public String internalServerError(Exception e, Model model) {
		model.addAttribute("error_msg", HttpStatus.INTERNAL_SERVER_ERROR.getReasonPhrase());		
		return "error/500";
	}

}
