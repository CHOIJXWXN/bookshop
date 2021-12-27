package com.bookshop.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.bookshop.vo.AskList;
import com.bookshop.vo.Book;

public interface AdminService {
	
	// 주문 관리 페이지
	// 주문리스트, 배송준비중 건수, 배송중 건수, 배송완료 건수, 모든 주문 건수
	public HashMap<String, Object> viewOrder(int pageNum) throws Exception;
	// 다음 페이지 존재 여부
	public boolean getNextPage(int pageNum, String type) throws Exception;	
	// 배송중/배송완료 변경, 배송중 변경 시 랜덤 운송장번호 생성 및 배송 테이블에 데이터 입력
	public void delivery(String order_status, String order_num) throws Exception;
	
	// 상품 관리 페이지
	// 모든 책 수량, 소설 책 수량, 시/에세이 책 수량, 여행 책 수량, 모든 책 리스트)
	public HashMap<String, Object> viewProduct(int pageNum) throws Exception;
	// 해당 상품 삭제
	public void deleteProduct(String book_id) throws Exception;
	// 해당 상품 입력
	public void addProduct(Book book, MultipartFile book_cover) throws Exception;	
	
	// 문의 관리 페이지
	// 모든 문의 리스트
	public List<AskList> getAdminAskList(AskList asklist) throws Exception;
	
}
