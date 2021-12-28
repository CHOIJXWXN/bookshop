package com.bookshop.service;

import java.util.HashMap;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.bookshop.dao.RecordDAO;
import com.bookshop.util.Xss;
import com.bookshop.vo.Paging;
import com.bookshop.vo.Record;
import com.bookshop.vo.RecordPlus;

@Service
public class RecordServiceImpl implements RecordService {
	
	@Inject
	RecordDAO dao;

	// 기록 메인 페이지
	// 기록 리스트, 페이징
	@Override
	public HashMap<String, Object> view(String user_id, int pageNum) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Paging paging = new Paging(pageNum, dao.getRecordCnt(user_id), 12, 5);
		map.put("list", dao.getRecord(user_id, pageNum));
		map.put("paging", paging);
		return map;
	}

	// 책 검색 (책 리스트, 페이징)
	@Override
	public HashMap<String, Object> search(String keyword, int pageNum) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Paging paging = new Paging(pageNum, dao.searchBookCnt(keyword), 3, 2);
		map.put("list", dao.searchBook(keyword, pageNum));
		map.put("paging", paging);
		return map;
	}

	// 기록 작성 페이지
	// 기록 작성
	@Override
	public void write(Record record) throws Exception {
		dao.addRecord(record);
	}

	// 기록 상세 페이지
	// 기록 가져오기
	@Override
	public Record getRecord(String user_id, String book_id) throws Exception {
		return dao.getCertainRecord(user_id, book_id);
	}

	// 기록 보기
	@Override
	public RecordPlus viewOne(int record_id) throws Exception {
		RecordPlus recordPlus = dao.getCertainRecordPlus(record_id);
//		recordPlus.setRecord_contents(Xss.setXss(recordPlus.getRecord_contents()));
		return recordPlus;
	}
	
	// 기록 수정
	@Override
	public void edit(Record record) throws Exception {
		dao.updateRecord(record);
	}

	// 기록 삭제
	@Override
	public void delete(int record_id) throws Exception {
		dao.deleteRecord(record_id);
	}

}