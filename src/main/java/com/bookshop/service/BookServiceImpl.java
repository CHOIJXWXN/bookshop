package com.bookshop.service;

import java.util.HashMap;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.bookshop.dao.BookDAO;
import com.bookshop.util.Xss;
import com.bookshop.vo.Book;
import com.bookshop.vo.Paging;
import com.bookshop.vo.Review;

@Service
public class BookServiceImpl implements BookService {
	
	@Inject
	BookDAO dao;

	// 책 메인 페이지
	// 각 정렬순서와 카테고리에 맞는 책 리스트, 페이징
	@Override
	public HashMap<String, Object> book(String order, String genre, int pageNum) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (genre.equals("-1")) {			
			if (order.equals("판매량순")) {
				map.put("list", dao.getBookListSell(pageNum));				
			} else if (order.equals("신규출간순")) {
				map.put("list", dao.getBookListNew(pageNum));
			} else if (order.equals("평점순")) {
				map.put("list", dao.getBookListReview(pageNum));
			}	
			map.put("paging", new Paging(pageNum, dao.getBookCnt(), 16, 5));
		} else if (genre.equals("0")) {
			map.put("list", dao.getGenreBookList("소설", pageNum));
			map.put("paging", new Paging(pageNum, dao.getGenreBookCnt("소설"), 16, 5));
		} else if (genre.equals("1")) {
			map.put("list", dao.getGenreBookList("시/에세이", pageNum));
			map.put("paging", new Paging(pageNum, dao.getGenreBookCnt("시/에세이"), 16, 5));
		} else if (genre.equals("2")) {
			map.put("list", dao.getGenreBookList("여행", pageNum));
			map.put("paging", new Paging(pageNum, dao.getGenreBookCnt("여행"), 16, 5));
		}		
		return map;
	}

	// 책 찾기 기능
	// 키워드에 부합하는 책 리스트, 페이징, 책 장르, 책 수량, 키워드
	@Override
	public HashMap<String, Object> searchBook(String keyword, String book_genre, int pageNum) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int bookCnt = 0;
		if (book_genre.equals("-1")) {
			bookCnt = dao.getSearchBookCnt(keyword);
			map.put("searchList", dao.searchBook(keyword, pageNum, 16));
		} else {
			bookCnt = dao.getSearchGenreBookCnt(keyword, book_genre);
			map.put("searchList", dao.searchGenreBook(keyword, book_genre, pageNum));
		}
		Paging paging = new Paging(pageNum, bookCnt, 16, 5);
		map.put("searchPaging", paging);
		map.put("book_genre", book_genre);
		map.put("bookCnt", bookCnt);
		map.put("keyword", keyword);
		return map;
	}
	
	// 베스트 셀러 페이지
	// 베스트셀러 책 리스트, 장르 추천 책 리스트, 작가 추천 책 리스트, 플래그
	/*
	 * flag { 0 : 작가 추천 0개 / 장르 추천 4개
	 * 		  1 : 작가 추천 1개 / 장르 추천 3개
	 * 		  2 : 작가 추천 2개 / 장르 추천 2개 }
	 */
	@Override
	public HashMap<String, Object> best(String user_id) throws Exception {
		int flag = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();
		String book_genre = "";
		String book_writer = "";
		if (!user_id.equals("")) {
			book_genre = dao.getGenreRecomm(user_id);
			book_writer = dao.getWriterRecomm(user_id);
			if (book_genre == null || book_genre.equals("")) {
				book_genre = dao.getInitGenre(user_id);
			}
			map.put("genreList", dao.getGenreRecommFour(book_genre));
			if (book_writer == null || book_writer.equals("")) {
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
		map.put("bestSeller", dao.getBestSeller());		
		map.put("flag", flag);
		return map;
	}

	// 책 상세 페이지
	// 해당 책 정보
	@Override
	public Book view(String book_id) throws Exception {
		return dao.getBook(book_id);
	}
	
	// 해당 책의 리뷰 리스트, 페이징, 리뷰 개수, 평점 평균
	@Override
	public HashMap<String, Object> showReview(String book_id, int pageNumber) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int reviewCnt = dao.getReviewCnt(book_id);
		List<Review> list = dao.getReview(book_id, pageNumber);
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setReview_contents(Xss.setXss(list.get(i).getReview_contents()));
		}
		Integer avgScore = dao.getBookScore(book_id);
		if (avgScore == null) {
			avgScore = 0;
		}
		map.put("list", list);
		map.put("paging", new Paging(pageNumber, reviewCnt, 3, 1));
		map.put("cnt", reviewCnt);
		map.put("score", avgScore);
		return map;
	}

	// 리뷰 추가
	@Override
	public void addReview(Review review) throws Exception {
		dao.addReview(review);
	}

	// 해당 유저가 해당 책 리뷰를 쓴 적 있는지 검증
	@Override
	public int flag(Review review) throws Exception {
		return dao.getReviewFlag(review);
	}

}