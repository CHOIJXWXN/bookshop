package com.bookshop.service;

import java.util.HashMap;
import java.util.List;

import com.bookshop.vo.Book;
import com.bookshop.vo.Record;
import com.bookshop.vo.RecordPlus;

public interface RecordService {

	public HashMap<String, Object> view(String user_id, int pageNum) throws Exception;
	public HashMap<String, Object> search(String keyword, int pageNum) throws Exception;
	public void write(Record record) throws Exception;
	public Record getRecord(String user_id, String book_id) throws Exception;
	public RecordPlus viewOne(int record_id) throws Exception;
	public void edit(Record record) throws Exception;
	public void delete(int record_id) throws Exception;
	
}
