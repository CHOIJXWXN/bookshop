package com.bookshop.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bookshop.dao.AdminDAO;
import com.bookshop.dao.BookDAO;
import com.bookshop.vo.AskList;
import com.bookshop.vo.Book;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	AdminDAO dao;
	@Inject
	BookDAO bdao;	

	// 주문 관리 페이지
	// 주문리스트, 배송준비중 건수, 배송중 건수, 배송완료 건수, 모든 주문 건수
	@Override
	public HashMap<String, Object> viewOrder(int pageNum) throws Exception {		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("listSeparate", dao.getOrderListSeparate(pageNum));
		map.put("listUnited", dao.getOrderListUnited(pageNum));
		map.put("before", dao.getOrderCnt("배송준비중"));
		map.put("start", dao.getOrderCnt("배송중"));
		map.put("end", dao.getOrderCnt("배송완료"));
		map.put("tot", dao.getTotCnt());
		return map;
	}
	
	// 다음 페이지 존재 여부
	@Override
	public boolean getNextPage(int pageNum, String type) throws Exception {		
		return dao.getNextPage((pageNum * 20) + 1, type) != null;
	}
	
	// 배송중/배송완료 변경, 배송중 변경 시 랜덤 운송장번호 생성 및 배송 테이블에 데이터 입력
	@Override
	public void delivery(String order_status, String order_num) throws Exception {
		dao.changeStatus(order_status, order_num);
		if (order_status.equals("배송중")) {
			Random random = new Random();
			String first = random.nextInt(100000) + "";
			String last = random.nextInt(100000) + "";
			dao.addDelivery(order_num, first+last);		// 10자리 난수 문자열
		}
	}

	// 상품 관리 페이지
	// 모든 책 수량, 소설 책 수량, 시/에세이 책 수량, 여행 책 수량, 모든 책 리스트)
	@Override
	public HashMap<String, Object> viewProduct(int pageNum) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bookCnt", bdao.getBookCnt());
		map.put("novelCnt", bdao.getGenreBookCnt("소설"));
		map.put("poemCnt", bdao.getGenreBookCnt("시/에세이"));
		map.put("travelCnt", bdao.getGenreBookCnt("여행"));
		map.put("list", dao.getBookList(pageNum));
		return map;
	}

	// 해당 상품 삭제
	@Override
	public void deleteProduct(String book_id) throws Exception {
		dao.deleteBook(book_id);
	}

	// 해당 상품 입력
	@Override
	public void addProduct(Book book, MultipartFile book_cover) throws Exception {
		dao.addBook(book);
		if (book_cover.isEmpty()) {
			return;
		}
		book_cover.transferTo(new File("../resources/images/bookcover/" + book.getBook_id() + ".jpg"));
	}

	// 문의 관리 페이지
	// 모든 문의 리스트
	@Override
	public List<AskList> getAdminAskList(AskList asklist) throws Exception {		
		return dao.getAdminAskList(asklist);
	}	

}
