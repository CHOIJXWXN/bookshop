package com.bookshop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

public class Logininterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(Logininterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {	
		String user_id = (String) request.getSession().getAttribute("user_id");
		if (user_id == null) {
			FlashMap flashMap = new FlashMap();
			flashMap.put("msg", "로그인이 필요한 서비스입니다");
			FlashMapManager manager = RequestContextUtils.getFlashMapManager(request);
			manager.saveOutputFlashMap(flashMap, request, response);
			response.sendRedirect("/login");
			return false;			
		} else {
			return true;
		}
	}

}
