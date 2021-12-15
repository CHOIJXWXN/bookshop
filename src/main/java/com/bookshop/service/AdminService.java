package com.bookshop.service;

import java.util.HashMap;

public interface AdminService {
	
	public HashMap<String, Object> viewOrder(int pageNum) throws Exception;
	public void deliveryStart(String order_num) throws Exception;
	public void deliveryEnd(String order_num) throws Exception;
	public HashMap<String, Object> viewProduct(int pageNum) throws Exception;
	public void deleteProduct(String book_id) throws Exception;
}
