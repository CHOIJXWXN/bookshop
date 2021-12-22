package com.bookshop.service;

import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.bookshop.dao.RecordDAO;
import com.bookshop.vo.RecordPlus;

@Service
public class RecordServiceImpl implements RecordService {
	
	@Inject
	RecordDAO dao;

	@Override
	public List<RecordPlus> view(String user_id, int pageNum) throws Exception {
		return dao.getRecord(user_id, pageNum);
	}

}