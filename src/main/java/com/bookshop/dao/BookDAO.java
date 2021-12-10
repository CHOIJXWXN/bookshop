package com.bookshop.dao;

import java.util.List;

import com.bookshop.vo.Book;
import com.bookshop.vo.Review;

public interface BookDAO {
	
	public int getBookCnt() throws Exception;
	public List<Book> getBookListSell(int pageNum) throws Exception;
	public List<Book> getBookListNew(int pageNum) throws Exception;
	public List<Book> getBookListReview(int pageNum) throws Exception;
	public List<Book> searchBook(String keyword) throws Exception;
	public List<Integer> getBestSeller() throws Exception;
	public String getInitGenre(String user_id) throws Exception;
	public String getGenreRecomm(String user_id) throws Exception;
	public String getWriterRecomm(String user_id) throws Exception;
	public List<Book> getGenreRecommFour(String book_genre) throws Exception;
	public List<Book> getWriterRecommTwo(String book_writer) throws Exception;
	public Book getBook(int book_id) throws Exception;
	public List<Review> getReview(int book_id, int pageNum) throws Exception;
	public int getReviewCnt(int book_id) throws Exception;
	public int getBookScore(int book_id) throws Exception;
	public void addReview(Review review) throws Exception;
	
}
