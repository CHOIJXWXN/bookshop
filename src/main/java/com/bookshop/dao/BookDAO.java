package com.bookshop.dao;

import java.util.List;
import com.bookshop.vo.Book;
import com.bookshop.vo.Review;

public interface BookDAO {
	
	public int getBookCnt() throws Exception;
	public int getGenreBookCnt(String book_genre) throws Exception;
	public List<Book> getBookListSell(int pageNum) throws Exception;
	public List<Book> getBookListNew(int pageNum) throws Exception;
	public List<Book> getBookListReview(int pageNum) throws Exception;
	public List<Book> getGenreBookList(String book_genre, int pageNum) throws Exception;
	public List<Book> searchBook(String keyword, int pageNum, int cnt) throws Exception;
	public int getSearchBookCnt(String keyword) throws Exception;
	public List<Book> searchGenreBook(String keyword, String book_genre, int pageNum) throws Exception;
	public int getSearchGenreBookCnt(String keyword, String book_genre) throws Exception;
	public List<Book> getBestSeller() throws Exception;
	public String getInitGenre(String user_id) throws Exception;
	public String getGenreRecomm(String user_id) throws Exception;
	public String getWriterRecomm(String user_id) throws Exception;
	public List<Book> getGenreRecommFour(String book_genre) throws Exception;
	public List<Book> getWriterRecommTwo(String book_writer) throws Exception;
	public Book getBook(String book_id) throws Exception;
	public List<Review> getReview(String book_id, int pageNum) throws Exception;
	public int getReviewCnt(String book_id) throws Exception;
	public Integer getBookScore(String book_id) throws Exception;
	public void addReview(Review review) throws Exception;
	public int getReviewFlag(Review review) throws Exception;
	
}