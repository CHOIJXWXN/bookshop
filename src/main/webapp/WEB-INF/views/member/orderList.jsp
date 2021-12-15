<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
   <meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Book Shop</title>
    <link rel="stylesheet" href="${path }/resources/css/reset.css" />
    <link rel="stylesheet" href="${path }/resources/css/mainNav.css" />
    <link rel="stylesheet" href="${path }/resources/css/orderList.css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="${path }/resources/js/memberjs/profile.js" charset="UTF-8"></script>
  </head>
  <body>
    <div id="wrap">
    <!-- [1] 메인 네비게이션 -->
      <jsp:include page="../mainNav.jsp" />
 	<!-- [2] 메인화면 -->
      <section id="delivery">
          <!-- 사이드 퀵메뉴 -->
        <div id="sidebar">
            <p id="nav_title">My Page</p>
            <a href="orderManage.html">
                <span>주문 / 배송 조회&nbsp;&nbsp;</span>
            </a>
            <a href="prodManage.html">
                <span>교환 / 반품 / 취소&nbsp;&nbsp;</span>
            </a>
            <a href="inqManage.html" class="active">
                <span>회원 정보 수정&nbsp;&nbsp;</span>
            </a>
        </div>
        <!-- 회원정보 수정 폼 -->
        <div id="order_list">
            <header>
                <ul>
                    <li class="date">날짜</li>
                    <li class="prod_name">상품명</li>
                    <li class="prod_price">상품금액 | 수량</li>
                    <li class="status">주문상태</li>
                    <li class="btn">버튼</li>
                </ul>
            </header>
            
            <c:forEach var="items" items="${list }">
            <div class="row">
                <ul>
                    <li class="date">
                      <span>${items.orders.order_date}</span>
                      <a href="#"><p>${items.orders.order_num}</p></a>
                    </li>
                    <li>
                    	<c:forEach var="item" items="${items.list }">
                    	<ul>
	                    	<li class="prod_name" style="text-align:left;">
		                        <span class="book_id">${item.book.book_id}</span>
		                        <!-- 책 표지 -->
		                        <img class="book_cover" src="../resources/images/${item.book.book_cover}" alt="">                      
		                        <!-- 책 제목 & 작가 -->
		                        <ul class="ttl_writer_wrap">
		                          <span>${item.book.book_title}</span>
		                          <span>${item.book.book_writer}</span>
		                        </ul>
		                    </li>
		                    <li class="prod_price">
		                        <span>${item.book.book_price}원 / ${item.book_cnt}개</span>
		                    </li>
                    	</ul>
                    	</c:forEach>
                    </li>
                    <li class="btn">
                      <button type="button" class="ask on">문의</button>
                      <button type="button" class="review">리뷰쓰기</button>
                      <button type="button" class="delivery">배송추적</button>
                    </li>
                    <li class="status">${items.orders.order_status }</li>
                </ul>
            </div>
            </c:forEach>
        </div>
        <div class="pagenum_wrap">
            <ul>
                <li><a href="#">&lt;&nbsp;prev</a></li>
                <li><a href="#">next&nbsp;&gt;</a></li>
            </ul>
        </div>
      </section>
    </div>
    <script>
    $(document).ready(function(){
    	var msg = '${msg}';
    	if(msg != null && msg != '') alert(msg);
    });
    </script>
  </body>
</html>
