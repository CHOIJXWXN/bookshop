package com.bookshop.service;

import java.util.HashMap;

import com.bookshop.vo.Book;
import com.bookshop.vo.Review;

public interface BookService {
	
	// 책 메인 페이지
	// 각 정렬순서와 카테고리에 맞는 책 리스트, 페이징
	public HashMap<String, Object> book(String order, String genre, int pageNum) throws Exception;
	
	// 책 찾기 기능
	// 키워드에 부합하는 책 리스트, 페이징, 책 장르, 책 수량, 키워드
	public HashMap<String, Object> searchBook(String keyword, String book_genre, int pageNum) throws Exception;
	
	// 베스트 셀러 페이지
	// 베스트셀러 책 리스트, 장르 추천 책 리스트, 작가 추천 책 리스트, 플래그
	public HashMap<String, Object> best(String user_id) throws Exception;
	
	// 책 상세 페이지
	// 해당 책 정보
	public Book view(String book_id) throws Exception;
	// 해당 책의 리뷰 리스트, 페이징, 리뷰 개수, 평점 평균
	public HashMap<String, Object> showReview(String book_id, int pageNumber) throws Exception;
	// 리뷰 추가
	public void addReview(Review review) throws Exception;
	// 해당 유저가 해당 책 리뷰를 쓴 적 있는지 검증
	public int flag(Review review) throws Exception;
	
}