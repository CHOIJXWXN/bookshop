package com.bookshop.service;

import java.util.HashMap;
import java.util.List;

import com.bookshop.vo.Book;

public interface RecordService {

	public HashMap<String, Object> view(String user_id, int pageNum) throws Exception;
	public List<Book> search(String keyword, int pageNum) throws Exception;
	
}
