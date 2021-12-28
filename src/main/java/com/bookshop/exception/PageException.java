package com.bookshop.exception;

import java.sql.SQLSyntaxErrorException;

import org.springframework.http.HttpStatus;
import org.springframework.jdbc.BadSqlGrammarException;
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
	
	// sql 에러
	@ExceptionHandler({BadSqlGrammarException.class, SQLSyntaxErrorException.class})
	public String sqlException(Exception e, Model model) {
		model.addAttribute("error_msg", e.getCause());
		return "error/500";
	}
	
	// 500 에러 / 일반적인 서버 에러 메세지로 요청 사항을 이행할 수 없는 상태
	@ExceptionHandler(Exception.class)
	public String internalServerError(Exception e, Model model) {
		model.addAttribute("error_msg", e.getCause());		
		return "error/500";
	}

}
