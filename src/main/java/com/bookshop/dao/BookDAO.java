package com.bookshop.dao;

import java.util.List;
import com.bookshop.vo.Book;
import com.bookshop.vo.Review;

public interface BookDAO {
	
	public int getBookCnt() throws Exception;
	public int getBookCntNovel() throws Exception;
	public int getBookCntPoem() throws Exception;
	public int getBookCntTravel() throws Exception;
	public List<Book> getBookListSell(int pageNum) throws Exception;
	public List<Book> getBookListNew(int pageNum) throws Exception;
	public List<Book> getBookListReview(int pageNum) throws Exception;
	public List<Book> getBookListNovel(int pageNum) throws Exception;
	public List<Book> getBookListPoem(int pageNum) throws Exception;
	public List<Book> getBookListTravel(int pageNum) throws Exception;
	public List<Book> searchBook(String keyword, int pageNum) throws Exception;
	public int getSearchBookCnt(String keyword) throws Exception;
	public List<String> getBestSeller() throws Exception;
	public String getInitGenre(String user_id) throws Exception;
	public String getGenreRecomm(String user_id) throws Exception;
	public String getWriterRecomm(String user_id) throws Exception;
	public List<Book> getGenreRecommFour(String book_genre) throws Exception;
	public List<Book> getWriterRecommTwo(String book_writer) throws Exception;
	public Book getBook(String book_id) throws Exception;
	public List<Review> getReview(String book_id, int pageNum) throws Exception;
	public int getReviewCnt(String book_id) throws Exception;
	public int getBookScore(String book_id) throws Exception;
	public void addReview(Review review) throws Exception;
	
}
