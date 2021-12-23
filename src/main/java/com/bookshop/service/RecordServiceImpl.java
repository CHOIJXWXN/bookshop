package com.bookshop.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.bookshop.dao.RecordDAO;
import com.bookshop.vo.Book;
import com.bookshop.vo.Paging;
import com.bookshop.vo.Record;
import com.bookshop.vo.RecordPlus;

@Service
public class RecordServiceImpl implements RecordService {
	
	@Inject
	RecordDAO dao;

	@Override
	public HashMap<String, Object> view(String user_id, int pageNum) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Paging paging = new Paging(pageNum, dao.getRecordCnt(user_id), 12, 5);
		map.put("list", dao.getRecord(user_id, pageNum));
		map.put("paging", paging);
		return map;
	}

	@Override
	public List<Book> search(String keyword, int pageNum) throws Exception {
		return dao.searchBook(keyword, pageNum);
	}

	@Override
	public void writeRecord(Record record) throws Exception {
		dao.addRecord(record);
	}

	@Override
	public Record getRecord(String user_id, String book_id) throws Exception {
		return dao.getCertainRecord(user_id, book_id);
	}

}