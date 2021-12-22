package com.bookshop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Admininterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(Admininterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		try {
            Integer admin = (Integer) request.getSession().getAttribute("admin");
            if (admin == 1) {
                return true;
            } else {
                ModelAndView modelAndView = new ModelAndView("redirect:/");
                modelAndView.addObject("msg", "관리자 권한이 없습니다");
                throw new ModelAndViewDefiningException(modelAndView);
            }
        } catch (Exception e) {
            ModelAndView modelAndView = new ModelAndView("redirect:/");
            modelAndView.addObject("msg", "관리자 권한이 없습니다");
            throw new ModelAndViewDefiningException(modelAndView);
        }
	}

}
