package com.bookshop.dao;

import java.util.List;

import com.bookshop.vo.Record;
import com.bookshop.vo.RecordPlus;
import com.bookshop.vo.Users;

public interface RecordDAO {

	public List<RecordPlus> getRecord(String user_id, int pageNum) throws Exception;
	public int getRecordCnt(String user_id) throws Exception;
	public void addRecord(Record record) throws Exception;
	public void updateRecord(Record record) throws Exception;
	public void deleteRecord(int record_id) throws Exception;
	public Record getCertainRecord(String user_id, String book_id) throws Exception;
	public RecordPlus getCertainRecordPlus(int record_id) throws Exception;
	public String getRecordTitle(String user_id) throws Exception;
	public void addRecordTitle(Users users) throws Exception;
	public Record getRecordById(int record_id) throws Exception;

}
