package com.bookshop.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.bookshop.vo.AskList;
import com.bookshop.vo.Book;

public interface AdminService {
	
	public HashMap<String, Object> viewOrder(int pageNum) throws Exception;
	public boolean getNextPage(int pageNum, String type) throws Exception;
	public void delivery(String order_status, String order_num) throws Exception;
	public HashMap<String, Object> viewProduct(int pageNum) throws Exception;
	public void deleteProduct(String book_id) throws Exception;
	public void addProduct(Book book, MultipartFile book_cover) throws Exception;
	
	public List<AskList> getAdminAskList(AskList asklist) throws Exception;
	
}
