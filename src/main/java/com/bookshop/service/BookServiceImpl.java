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
	public HashMap<String, Object> book(String order, int pageNum) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
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
		return map;
	}

	@Override
	public List<Book> searchBook(String keyword) throws Exception {
		return dao.searchBook(keyword);
	}
	
	/*
	 * flag { 0 : 작가 추천 0개 / 장르 추천 4개
	 * 		  1 : 작가 추천 1개 / 장르 추천 3개
	 * 		  2 : 작가 추천 2개 / 장르 추천 2개 }
	 */
	@Override
	public HashMap<String, Object> best(String user_id) throws Exception {
		int flag;
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<Integer> idList = dao.getBestSeller();
		List<Book> bookList = new ArrayList<Book>();
		for (int i = 0; i < idList.size(); i++) {
			bookList.add(dao.getBook(idList.get(i)));
		}
		String book_genre = dao.getGenreRecomm(user_id);
		String book_writer = dao.getWriterRecomm(user_id);
		if (book_genre == null) {
			book_genre = dao.getInitGenre(user_id);							// 평균 3점 이상인 장르가 없으면 초기에 입력한 장르로 추천
		}
		if (book_writer == null) flag = 0;									// 평균 3점 이상인 작가가 없으면 4개 모두 장르로 추천 (writerList 넘기지 않음)
		else {
			if (dao.getWriterRecommTwo(book_writer).size() == 1) flag = 1;	// 추천 작가의 책이 하나 뿐이라면 flag가 1
			else flag = 2;													// 추천 작가의 책이 둘 이상이라면 flag가 2
			map.put("writerList", dao.getWriterRecommTwo(book_writer));
		}

		dao.getGenreRecommFour(book_genre);
		map.put("bestSeller", bookList);
		map.put("genreList", dao.getGenreRecommFour(book_genre));		
		map.put("flag", flag);
		return map;
	}

	@Override
	public Book view(int book_id) throws Exception {
		return dao.getBook(book_id);
	}
	
   @Override
   public HashMap<String, Object> showReview(int book_id, int pageNum) throws Exception {
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
