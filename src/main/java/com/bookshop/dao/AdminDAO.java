package com.bookshop.dao;

import java.util.List;

import com.bookshop.vo.AskList;
import com.bookshop.vo.AskReply;
import com.bookshop.vo.Book;
import com.bookshop.vo.OrderPlus;

public interface AdminDAO {

	public List<OrderPlus> getOrderListSeparate(int pageNum) throws Exception;
	public List<OrderPlus> getOrderListUnited(int pageNum) throws Exception;
	public Object getNextPage(int pageNumber, String table) throws Exception;
	public void changeStatus(String order_status, String order_num) throws Exception;
	public void addDelivery(String order_num, String tracking_num) throws Exception;
	public int getOrderCnt(String order_status) throws Exception;
	public int getTotCnt() throws Exception;
	public List<Book> getBookList(int pageNum) throws Exception;
	public void deleteBook(String book_id) throws Exception;
	public void addBook(Book book) throws Exception;
	
	public List<AskList> getAdminAskList() throws Exception;

	
}
