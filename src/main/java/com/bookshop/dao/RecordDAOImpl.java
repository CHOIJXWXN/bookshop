package com.bookshop.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bookshop.vo.Record;
import com.bookshop.vo.RecordPlus;
import com.bookshop.vo.Users;

@Repository
public class RecordDAOImpl implements RecordDAO {
	
	@Inject
	SqlSession sqlSession;
	
	final String SESSION = "com.bookshop.mappers.record";

	@Override
	public List<RecordPlus> getRecord(String user_id, int pageNum) throws Exception {
		int start = (pageNum - 1) * 12;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("start", start);
		return sqlSession.selectList(SESSION + ".getRecord", map);
	}
	
	@Override
	public int getRecordCnt(String user_id) throws Exception {
		return sqlSession.selectOne(SESSION + ".getRecordCnt", user_id);
	}

	@Override
	public void addRecord(Record record) throws Exception {
		sqlSession.insert(SESSION + ".addRecord", record);
	}

	@Override
	public void updateRecord(Record record) throws Exception {
		sqlSession.update(SESSION + ".updateRecord", record);
	}
	
	@Override
	public void deleteRecord(int record_id) throws Exception {
		sqlSession.delete(SESSION + ".deleteRecord", record_id);
	}

	@Override
	public Record getCertainRecord(String user_id, String book_id) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("book_id", book_id);
		return sqlSession.selectOne(SESSION + ".getCertainRecord", map);
	}

	@Override
	public RecordPlus getCertainRecordPlus(int record_id) throws Exception {
		return sqlSession.selectOne(SESSION + ".getCertainRecordPlus", record_id);
	}

	@Override
	public String getRecordTitle(String user_id) throws Exception {
		return sqlSession.selectOne(SESSION + ".getRecordTitle", user_id);
	}

	@Override
	public void addRecordTitle(Users users) throws Exception {
		sqlSession.update(SESSION + ".addRecordTitle", users);
	}

	@Override
	public Record getRecordById(int record_id) throws Exception {
		return sqlSession.selectOne(SESSION + ".getRecordById", record_id);
	}

}