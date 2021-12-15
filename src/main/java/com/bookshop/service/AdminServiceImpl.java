package com.bookshop.service;

import java.util.HashMap;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bookshop.dao.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	AdminDAO dao;

	@Override
	public HashMap<String, Object> viewOrder(int pageNum) throws Exception {
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

	@Override
	public HashMap<String, Object> viewProduct(int pageNum) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bookCnt", dao.getBookCnt());
		map.put("novelCnt", dao.getBookCntNovel());
		map.put("poemCnt", dao.getBookCntPoem());
		map.put("travelCnt", dao.getBookCntTravel());
		map.put("list", dao.getBookList(pageNum));
		return map;
	}

	@Override
	public void deleteProduct(String book_id) throws Exception {
		dao.deleteBook(book_id);
	}

}
