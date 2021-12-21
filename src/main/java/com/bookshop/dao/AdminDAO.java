package com.bookshop.dao;

import java.util.List;

import com.bookshop.vo.Book;
import com.bookshop.vo.OrderPlus;

public interface AdminDAO {

	public List<String> getOrderNumList(int pageNum) throws Exception;
	public List<OrderPlus> getOrderListSeparate(List<String> list) throws Exception;
	public List<OrderPlus> getOrderListUnited(List<String> list) throws Exception;
	public void changeToStart(String order_num) throws Exception;
	public void changeToEnd(String order_num) throws Exception;
	public int getBeforeStartCnt() throws Exception;
	public int getStartCnt() throws Exception;
	public int getEndCnt() throws Exception;
	public int getTotCnt() throws Exception;
	public List<Book> getBookList(int pageNum) throws Exception;
	public void deleteBook(String book_id) throws Exception;
	public void addBook(Book book) throws Exception;
}
