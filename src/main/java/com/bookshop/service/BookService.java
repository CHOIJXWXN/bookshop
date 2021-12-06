package com.bookshop.service;

import java.util.HashMap;

public interface BookService {
	
	public HashMap<String, Object> book(String order, int pageNum) throws Exception;
	
}
