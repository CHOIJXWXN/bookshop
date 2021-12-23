package com.bookshop.service;

import java.util.HashMap;
import java.util.List;

import com.bookshop.vo.Book;
import com.bookshop.vo.Record;

public interface RecordService {

	public HashMap<String, Object> view(String user_id, int pageNum) throws Exception;
	public List<Book> search(String keyword, int pageNum) throws Exception;
	public void writeRecord(Record record) throws Exception;
	public Record getRecord(String user_id, String book_id) throws Exception;
	
}
