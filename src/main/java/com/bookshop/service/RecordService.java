package com.bookshop.service;

import java.util.List;

import com.bookshop.vo.RecordPlus;

public interface RecordService {

	public List<RecordPlus> view(String user_id, int pageNum) throws Exception;
	
}
