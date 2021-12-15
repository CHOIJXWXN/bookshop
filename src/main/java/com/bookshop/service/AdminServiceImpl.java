package com.bookshop.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bookshop.dao.AdminDAO;
import com.bookshop.vo.OrderPlus;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	AdminDAO dao;

	@Override
	public HashMap<String, Object> view(int pageNum) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", dao.getOrderList(pageNum));
		map.put("before", dao.getBeforeStartCnt());
		map.put("start", dao.getStartCnt());
		map.put("end", dao.getEndCnt());
		map.put("tot", dao.getTotCnt());
		return map;
	}

	@Override
	public void deliveryStart(String order_num) throws Exception {
		dao.changeToStart(order_num);
		
	}

	@Override
	public void deliveryEnd(String order_num) throws Exception {
		dao.changeToEnd(order_num);
	}

}
