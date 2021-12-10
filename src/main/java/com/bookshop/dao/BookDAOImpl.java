package com.bookshop.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bookshop.vo.Book;
import com.bookshop.vo.Review;

@Repository
public class BookDAOImpl implements BookDAO {
	
	@Inject
	SqlSession sqlSession;
	
	final String SESSION = "com.bookshop.mappers.book";
	
	@Override
	public int getBookCnt() throws Exception {
		return sqlSession.selectOne(SESSION + ".getBookCnt");
	}
	
	@Override
	public List<Book> getBookListSell(int pageNum) throws Exception {
		int start = (pageNum - 1) * 16;
		return sqlSession.selectList(SESSION + ".getFirstBook_id_sell", start);
	}
	
	@Override
	public List<Book> getBookListNew(int pageNum) throws Exception {
		int start = (pageNum - 1) * 16;
		return sqlSession.selectList(SESSION + ".getFirstBook_id_new", start);
	}
	
	@Override
	public List<Book> getBookListReview(int pageNum) throws Exception {
		int start = (pageNum - 1) * 16;
		return sqlSession.selectList(SESSION + ".getFirstBook_id_review", start);
	}

	@Override
	public List<Book> searchBook(String keyword) throws Exception {
		return sqlSession.selectList(SESSION + ".searchBook", keyword);
	}

	@Override
	public List<Integer> getBestSeller() throws Exception {
		return sqlSession.selectList(SESSION + ".getBestSeller");
	}
	@Override
	public String getInitGenre(String user_id) throws Exception {
		return sqlSession.selectOne(SESSION + ".getInitGenre", user_id);
	}
	
	@Override
	public String getGenreRecomm(String user_id) throws Exception {
		return sqlSession.selectOne(SESSION + ".getGenreRecomm", user_id);
	}

	@Override
	public String getWriterRecomm(String user_id) throws Exception {
		return sqlSession.selectOne(SESSION + ".getWriterRecomm", user_id);
	}

	@Override
	public List<Book> getGenreRecommFour(String book_genre) throws Exception {
		return sqlSession.selectList(SESSION + ".getGenreRecommFour", book_genre);
	}

	@Override
	public List<Book> getWriterRecommTwo(String book_writer) throws Exception {
		return sqlSession.selectList(SESSION + ".getWriterRecommFour", book_writer);
	}

	@Override
	public Book getBook(int book_id) throws Exception {
		return sqlSession.selectOne(SESSION + ".getBook", book_id);
	}

	@Override
	public List<Review> getReview(int book_id, int pageNum) throws Exception {
		int start = (pageNum - 1) * 3;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("book_id", book_id);
		map.put("start", start);
		return sqlSession.selectList(SESSION + ".getReview", map);
	}

	@Override
	public int getReviewCnt(int book_id) throws Exception {
		return sqlSession.selectOne(SESSION + ".getReviewCnt", book_id);
	}
	
   @Override
   public int getBookScore(int book_id) throws Exception {
      return sqlSession.selectOne(SESSION + ".getBookScore", book_id);
   }

   @Override
   public void addReview(Review review) throws Exception {
      sqlSession.insert(SESSION + ".addReview", review);
   }
}
