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
            <a href="${path }/mypage/delivery" class="on">
                <span>주문 / 배송 조회&nbsp;&nbsp;</span>
            </a>
            <a href="prodManage.html">
                <span>교환 / 반품 / 취소&nbsp;&nbsp;</span>
            </a>
            <a href="${path }mypage/profile" class="active">
                <span>회원 정보 수정&nbsp;&nbsp;</span>
            </a>
        </div>
        <!-- 회원정보 수정 폼 -->
        <div id="order_list">
            <!-- 보유포인트 -->
            <div class="point">
                <p>주문목록 / 배송조회 내역 총 ${order_cnt } 건</p>
                <p>
                    <img src="../resources/images/point.png" alt="">
                    보유 포인트 : ${point}원
                </p>
            </div>
            <header>
                <div class="date"><h3>날짜</h3></div>
                <div class="prod_name"><h3>상품명</h3></div>
                <div class="prod_price"><h3>상품금액 | 수량</h3></div>              
                <div class="btn"><h3>버튼</h3></div>
                <div class="status"><h3>주문상태</h3></div>
            </header>
            <!-- 주문번호당 주문 반복 s -->
            <c:forEach var="items" items="${list }">
            <div class="row">
                <!-- 주문번호, 주문날짜 -->
               <div class="order_num">
                    <span>${items.orders.order_date }</span>
                    <a href="#"><p>${items.orders.order_num }</p></a>
               </div>
               <div class="book_list">
                   <!-- 주문한 책 리스트 반복 s -->
                   <c:forEach var="item" items="${items.list }">
                   <!-- 1번 -->
                   <div class="each_book">
                       <!-- 표지, 도서명, 작가 -->
                       <div class="prod_name">
                            <span class="book_id">${item.book.book_id }</span>
                            <!-- 책 표지 -->
                            <img class="book_cover" src="../resources/images/${item.book.book_cover }" alt="">                      
                            <!-- 책 제목 & 작가 -->
                            <div class="ttl_writer_wrap">
                                <span>${item.book.book_title }</span>
                                <span>${item.book.book_writer }</span>
                            </div>
                       </div>
                       <!-- 가격, 수량 -->
                       <div class="prod_price">
                            <span>${item.book.book_price }원 / ${item.book_cnt }개</span>
                       </div>
                       <!-- 문의, 리뷰, 배송추적 버튼 -->
                       <div class="btn">
                            <button type="button" class="ask on">문의</button>
                            <button type="button" class="review">리뷰쓰기</button>
                            <button type="button" class="delivery">배송추적</button>
                       </div>
                   </div>
                   <!-- 1번 종료 -->
                   </c:forEach>
                   <!-- 주문한 책 리스트 반복 e-->
               </div>
               <!-- 주문 상태 -->
               <div class="order_status"><span>${items.orders.order_status }</span></div>
            </div>
            </c:forEach>          
        </div>
        <!-- 페이지 넘버 -->
        <div class="pagenum_wrap">
            <ul>
                <li><a href="#" class="prev"><span>&nbsp;prev</span></a></li>
                <li><a href="#" class="next"><span>next&nbsp;</span></a></li>
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
