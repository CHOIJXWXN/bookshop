package com.bookshop.dao;

import java.util.List;

public interface BookDAO {
	
	public List<Book> getBookListSell(int pageNum) throws Exception;
	public List<Book> getBookListNew(int pageNum) throws Exception;
	public List<Book> getBookListReview(int pageNum) throws Exception;

}
