package com.bookshop.service;

import java.util.HashMap;

import com.bookshop.vo.Record;
import com.bookshop.vo.RecordPlus;
import com.bookshop.vo.Users;

public interface RecordService {

	// 기록 메인 페이지
	// 기록 리스트, 페이징
	public HashMap<String, Object> view(String user_id, int pageNum) throws Exception;
	// 책 검색 (책 리스트, 페이징)
	public HashMap<String, Object> search(String keyword, int pageNum) throws Exception;
	
	// 기록 작성 페이지
	// 기록 작성
	public void write(Record record) throws Exception;
	
	// 기록 상세 페이지
	// 기록 가져오기
	public Record getRecord(String user_id, String book_id) throws Exception;
	// 기록 보기
	public RecordPlus viewOne(int record_id) throws Exception;
	// 기록 수정
	public void edit(Record record) throws Exception;
	// 기록 삭제
	public void delete(int record_id) throws Exception;
	
	// 기록 이름 설정 페이지
	// 기록장 이름 설정 여부
	public String title(String user_id) throws Exception;
	// 기록장 이름 설정
	public void setTitle(Users users) throws Exception;
	
}
