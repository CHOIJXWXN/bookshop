package com.bookshop.service;

import java.util.HashMap;

public interface AdminService {
	
	public HashMap<String, Object> view(int pageNum) throws Exception;
	public void deliveryStart(String order_num) throws Exception;
	public void deliveryEnd(String order_num) throws Exception;

}
