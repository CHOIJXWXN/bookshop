package com.bookshop.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.bookshop.dao.RecordDAO;
import com.bookshop.vo.Book;
import com.bookshop.vo.Paging;
import com.bookshop.vo.RecordPlus;

@Service
public class RecordServiceImpl implements RecordService {
	
	@Inject
	RecordDAO dao;

	@Override
	public HashMap<String, Object> view(String user_id, int pageNum) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Paging paging = new Paging(pageNum, dao.getRecordCnt(user_id));
		map.put("list", dao.getRecord(user_id, pageNum));
		map.put("paging", paging);
		return map;
	}

	@Override
	public List<Book> search(String keyword, int pageNum) throws Exception {
		return dao.searchBook(keyword, pageNum);
	}

}