package com.bookshop.vo;

public class Paging {

	private int pageNumber;	// 현재 페이지 번호
	private int count;		// 전체 게시물 갯수
	private int minPage;	// 페이징 최솟값
	private int maxPage;	// 페이징 최댓값
	private boolean next;	// 다음 섹션이 존재하는지 여부
	private int before;		// 이전 버튼을 눌렀을 때 이동할 페이지번호
	private int forward;	// 다음 버튼을 눌렀을 때 이동할 페이지번호
	
	public Paging() {}
	
	public Paging(int pageNumber, int count) {
		
		// 한 페이지에 보여줄 게시물의 수
		final int BOARD_CNT = 16;
		// 한 섹션에 보여줄 페이지의 수
		final int PAGING_CNT = 5;
		
		this.pageNumber = pageNumber;
		this.count      = count;
		
		int section;
		if(pageNumber % PAGING_CNT == 0) section = pageNumber / PAGING_CNT;
		                            else section = pageNumber / PAGING_CNT + 1;
		
		next = count > section * (PAGING_CNT * BOARD_CNT);
		
		minPage = 1 + (section - 1) * PAGING_CNT;
		if(next) maxPage = section * PAGING_CNT;
		else {
			if(count % BOARD_CNT == 0) maxPage = count / BOARD_CNT;
			                      else maxPage = count / BOARD_CNT + 1;
		}
		
		forward = 1 + section * PAGING_CNT;
		before  = (section - 1) * PAGING_CNT;
		
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getMinPage() {
		return minPage;
	}

	public void setMinPage(int minPage) {
		this.minPage = minPage;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public boolean getNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getBefore() {
		return before;
	}

	public void setBefore(int before) {
		this.before = before;
	}

	public int getForward() {
		return forward;
	}

	public void setForward(int forward) {
		this.forward = forward;
	}	
	
}
