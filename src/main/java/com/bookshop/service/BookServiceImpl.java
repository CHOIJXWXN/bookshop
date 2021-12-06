package com.bookshop.service;

import java.util.HashMap;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.bookshop.dao.BookDAO;

@Service
public class BookServiceImpl implements BookService {
	
	@Inject
	BookDAO dao;

	@Override
	public HashMap<String, Object> book(String order, int pageNum) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (order.equals("판매량순")) {
			map.put("list", dao.getBookListSell(pageNum));
			map.put("paging", );
		} else if (order.equals("신규출간순")) {
			map.put("list", dao.getBookListNew(pageNum));
			map.put("paging", );
		} else if (order.equals("리뷰순")) {
			map.put("list", dao.getBookListReview(pageNum));
			map.put("paging", );
		}	
		return map;
	}

}
