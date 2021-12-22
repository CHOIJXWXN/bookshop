package com.bookshop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Orderinterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(Orderinterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {	
		try {
            String user_id = (String) request.getSession().getAttribute("user_id");
            if (user_id != null) {
                return true;
            } else {
                ModelAndView modelAndView = new ModelAndView("redirect:/login");
                modelAndView.addObject("msg", "로그인이 필요합니다");
                throw new ModelAndViewDefiningException(modelAndView);
            }
        } catch (Exception e) {
            ModelAndView modelAndView = new ModelAndView("redirect:/login");
            modelAndView.addObject("msg", "로그인이 필요합니다");
            throw new ModelAndViewDefiningException(modelAndView);
        }
	}

}
