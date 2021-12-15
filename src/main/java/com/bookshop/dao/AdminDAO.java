package com.bookshop.dao;

import java.util.List;

import com.bookshop.vo.OrderPlus;

public interface AdminDAO {

	public List<OrderPlus> getOrderList(int pageNum) throws Exception;
	public void changeToStart(String order_num) throws Exception;
	public void changeToEnd(String order_num) throws Exception;
	public int getBeforeStartCnt() throws Exception;
	public int getStartCnt() throws Exception;
	public int getEndCnt() throws Exception;
	public int getTotCnt() throws Exception;

}
