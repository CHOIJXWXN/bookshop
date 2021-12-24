package com.bookshop.dao;

import java.util.List;

import com.bookshop.vo.Book;
import com.bookshop.vo.OrderPlus;
import com.bookshop.vo.Orders;

public interface AdminDAO {

	public List<String> getOrderNumList(int pageNum) throws Exception;
	public List<OrderPlus> getOrderListSeparate(List<String> list) throws Exception;
	public List<OrderPlus> getOrderListUnited(List<String> list) throws Exception;
	public Orders getNextPage(int pageNumber) throws Exception;	
	public void changeStatus(String order_status, String order_num) throws Exception;
	public void addDelivery(String order_num, String tracking_num) throws Exception;
	public int getOrderCnt(String order_status) throws Exception;
	public int getTotCnt() throws Exception;
	public List<Book> getBookList(int pageNum) throws Exception;
	public void deleteBook(String book_id) throws Exception;
	public void addBook(Book book) throws Exception;
	
}
