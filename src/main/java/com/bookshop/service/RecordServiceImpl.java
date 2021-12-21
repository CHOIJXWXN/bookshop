package com.bookshop.service;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.bookshop.dao.RecordDAO;

@Service
public class RecordServiceImpl implements RecordService {
	
	@Inject
	RecordDAO dao;

}