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
	public HashMap<String, Object> search(String keyword, int pageNum) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Paging paging = new Paging(pageNum, dao.searchBookCnt(keyword), 3, 2);
		map.put("list", dao.searchBook(keyword, pageNum));
		map.put("paging", paging);
		return map;
	}

	@Override
	public void write(Record record) throws Exception {
		dao.addRecord(record);
	}

	@Override
	public Record getRecord(String user_id, String book_id) throws Exception {
		return dao.getCertainRecord(user_id, book_id);
	}

	@Override
	public RecordPlus viewOne(int record_id) throws Exception {
		return dao.getCertainRecordPlus(record_id);
	}

	@Override
	public void edit(Record record) throws Exception {
		dao.updateRecord(record);
	}

	@Override
	public void delete(int record_id) throws Exception {
		dao.deleteRecord(record_id);
	}

}