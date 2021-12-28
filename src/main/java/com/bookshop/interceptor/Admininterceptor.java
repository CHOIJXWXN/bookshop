package com.bookshop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

public class Admininterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(Admininterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		Integer admin = (Integer) request.getSession().getAttribute("admin");
		if (admin == null || admin != 1) {
			FlashMap flashMap = new FlashMap();
			flashMap.put("msg", "관리자 권한이 없습니다");
			FlashMapManager manager = RequestContextUtils.getFlashMapManager(request);
			manager.saveOutputFlashMap(flashMap, request, response);
			response.sendRedirect("/");
			return false;			
		} else {
			return true;
		}
		
	}

}
