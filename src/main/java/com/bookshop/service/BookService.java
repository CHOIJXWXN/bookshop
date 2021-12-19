package com.bookshop.service;

import java.util.HashMap;

import com.bookshop.vo.Book;
import com.bookshop.vo.Review;

public interface BookService {
	
	public HashMap<String, Object> book(String order, String genre, int pageNum) throws Exception;
	public HashMap<String, Object> searchBook(String keyword, String book_genre, int pageNum) throws Exception;
	public HashMap<String, Object> best(String user_id) throws Exception;
	public Book view(String book_id) throws Exception;
	public HashMap<String, Object> showReview(String book_id, int pageNum) throws Exception;
	public void addReview(Review review) throws Exception;
	
}