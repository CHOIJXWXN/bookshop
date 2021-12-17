package com.bookshop.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.bookshop.dao.BookDAO;
import com.bookshop.vo.Book;
import com.bookshop.vo.Paging;
import com.bookshop.vo.Review;

@Service
public class BookServiceImpl implements BookService {
	
	@Inject
	BookDAO dao;

	@Override
	public HashMap<String, Object> book(String order, String genre, int pageNum) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (genre.equals("-1")) {
			int bookCnt = dao.getBookCnt();
			Paging paging = new Paging(pageNum, bookCnt);
			if (order.equals("판매량순")) {
				map.put("list", dao.getBookListSell(pageNum));
				map.put("paging", paging);
			} else if (order.equals("신규출간순")) {
				map.put("list", dao.getBookListNew(pageNum));
				map.put("paging", paging);
			} else if (order.equals("리뷰순")) {
				map.put("list", dao.getBookListReview(pageNum));
				map.put("paging", paging);
			}	
		} else if (genre.equals("0")) {
			int bookCnt = dao.getBookCntNovel();
			Paging paging = new Paging(pageNum, bookCnt);
			map.put("list", dao.getBookListNovel(pageNum));
			map.put("paging", paging);
		} else if (genre.equals("1")) {
			int bookCnt = dao.getBookCntPoem();
			Paging paging = new Paging(pageNum, bookCnt);
			map.put("list", dao.getBookListPoem(pageNum));
			map.put("paging", paging);
		} else if (genre.equals("2")) {
			int bookCnt = dao.getBookCntTravel();
			Paging paging = new Paging(pageNum, bookCnt);
			map.put("list", dao.getBookListTravel(pageNum));
			map.put("paging", paging);
		}		
		return map;
	}

	@Override
	public HashMap<String, Object> searchBook(String keyword, String book_genre, int pageNum) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int bookCnt = 0;
		if (book_genre.equals("-1")) {
			bookCnt = dao.getSearchBookCnt(keyword);
			map.put("searchList", dao.searchBook(keyword, pageNum));
		} else {
			bookCnt = dao.getSearchGenreBookCnt(keyword, book_genre);
			map.put("searchList", dao.searchGenreBook(keyword, book_genre, pageNum));
		}
		Paging paging = new Paging(pageNum, bookCnt);
		map.put("searchPaging", paging);
		map.put("book_genre", book_genre);
		map.put("bookCnt", bookCnt);
		return map;
	}
	
	/*
	 * flag { 0 : 작가 추천 0개 / 장르 추천 4개
	 * 		  1 : 작가 추천 1개 / 장르 추천 3개
	 * 		  2 : 작가 추천 2개 / 장르 추천 2개 }
	 */
	@Override
	public HashMap<String, Object> best(String user_id) throws Exception {
		int flag = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<String> idList = dao.getBestSeller();
		List<Book> bookList = new ArrayList<Book>();
		String book_genre = "";
		String book_writer = "";
		for (int i = 0; i < idList.size(); i++) {
			bookList.add(dao.getBook(idList.get(i)));
		}
		if (!user_id.equals("")) {
			book_genre = dao.getGenreRecomm(user_id);
			book_writer = dao.getWriterRecomm(user_id);
			if (book_genre.equals("") || book_genre == null) {
				book_genre = dao.getInitGenre(user_id);
			}
			map.put("genreList", dao.getGenreRecommFour(book_genre));
			if (book_writer.equals("") || book_writer == null) {
				flag = 0;
			} else {
				if (dao.getWriterRecommTwo(book_writer).size() == 1) {
					flag = 1;
				} else {
					flag = 2;
				}
				map.put("writerList", dao.getWriterRecommTwo(book_writer));
			}
		}
		map.put("bestSeller", bookList);		
		map.put("flag", flag);
		return map;
	}

	@Override
	public Book view(String book_id) throws Exception {
		return dao.getBook(book_id);
	}
	
   @Override
   public HashMap<String, Object> showReview(String book_id, int pageNum) throws Exception {
      HashMap<String, Object> map = new HashMap<String, Object>();
      int reviewCnt = dao.getReviewCnt(book_id);
      List<Review> list = dao.getReview(book_id, pageNum);
      Paging paging = new Paging(pageNum, reviewCnt);
      int avgScore = dao.getBookScore(book_id);
      map.put("list", list);
      map.put("paging", paging);
      map.put("cnt", reviewCnt);
      map.put("score", avgScore);
      return map;
   }

   @Override
   public void addReview(Review review) throws Exception {
      dao.addReview(review);
   }

}