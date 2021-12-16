package com.bookshop.service;

import java.util.HashMap;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bookshop.dao.AdminDAO;
import com.bookshop.dao.BookDAO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	AdminDAO dao;
	@Inject
	BookDAO bdao;

	@Override
	public HashMap<String, Object> viewOrder(int pageNum) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("listSeparate", dao.getOrderListSeparate(dao.getOrderNumList(pageNum)));
		map.put("listUnited", dao.getOrderListUnited(dao.getOrderNumList(pageNum)));
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
		map.put("bookCnt", bdao.getBookCnt());
		map.put("novelCnt", bdao.getBookCntNovel());
		map.put("poemCnt", bdao.getBookCntPoem());
		map.put("travelCnt", bdao.getBookCntTravel());
		map.put("list", dao.getBookList(pageNum));
		return map;
	}

	@Override
	public void deleteProduct(String book_id) throws Exception {
		dao.deleteBook(book_id);
	}

}
