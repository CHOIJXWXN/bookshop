<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Book Shop</title>
  <link rel="stylesheet" href="${path}/resources/css/mainNav.css" />
  <link rel="stylesheet" href="${path}/resources/css/reset.css" />
  <link rel="stylesheet" href="${path}/resources/css/booksBest.css" />
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="${path}/resources/js/bookjs/search.js"></script>
</head>
<body>
  <div id="wrap">
    <!-- [1] 네비게이션 -->
    <jsp:include page="../mainNav.jsp"/>
    <!-- [2] 메인화면 -->
    <section id="all_books">
       <!-- [2-2] 페이지 타이틀 -->
       <header class="page_ttl">
         <h3>TRENDING&nbsp;&nbsp;NOW</h3>
       </header>
       <!-- [2-3] 도서 상품 리스트 영역 -->
       <article class="book_list">
         <ul class="book_prod_wrap">       
  		   <c:forEach var="book" items="${map.bestSeller}">
  		   <li><a href="${path}/book/detail?book_id=${book.book_id}">
  		   <div class="img_wrap">
  		     <img class="book_cover" src="../../resources/images/bookcover/${book.book_cover}">
  		   </div>
  		   <h4 class="book_ttl">${book.book_title}</h4>
  		   <span class="book_price">${book.book_price}원</span>
  		   </a></li>
  		   </c:forEach>
         </ul>    
       </article>
    
       <!-- [2-4] 추천 도서 타이틀 -->
       <header class="recommend_ttl">
        <h3>RECOMMEND</h3>
       </header>
       <c:if test="${not empty user_id}">
       <!-- 추가 헤더 까지 -->
       <article class="book_list">
        <ul class="book_prod_wrap">       
          <!-- 장르 추천 4개의 경우 -->
		  <c:if test="${map.flag eq 0}">
		  <c:forEach var="book" items="${map.genreList}">
		  <li><a href="${path}/book/detail?book_id=${book.book_id}">
		  <div class="img_wrap">
  		    <img class="book_cover" src="../../resources/images/bookcover/${book.book_cover}">
  		  </div>
  		  <h4 class="book_ttl">${book.book_title}</h4>
  		  <span class="book_price">${book.book_price}원</span>
		  </a></li>
		  </c:forEach>
		  </c:if>
		  
		  <!-- 장르 추천 3개 / 작가 추천 1개인 경우 -->
		  <c:if test="${map.flag eq 1}">
		  <!-- 장르 -->
		  <c:forEach var="book" varStatus="status" items="${map.genreList}">
		  <!-- 장르 네 개 중 마지막 객체 생략 -->
		  <c:if test="${not status.last}">
		  <li><a href="${path}/book/detail?book_id=${book.book_id}">
		  <div class="img_wrap">
  		    <img class="book_cover" src="../../resources/images/bookcover/${book.book_cover}">
  		  </div>
  		  <h4 class="book_ttl">${book.book_title}</h4>
  		  <span class="book_price">${book.book_price}원</span>
		  </a></li>
		  </c:if>		  
		  </c:forEach>
		  <!-- 장르 -->
		  <!-- 작가 -->
		  <!-- 작가 두 개 중 첫번째만 출력 -->
		  <li><a href="${path}/book/detail?book_id=${map.writerList[0].book_id}">
		  <div class="img_wrap">
  		    <img class="book_cover" src="../../resources/images/bookcover/${map.writerList[0].book_cover}">
  		  </div>
  		  <h4 class="book_ttl">${map.writerList[0].book_title}</h4>
  		  <span class="book_price">${map.writerList[0].book_price}원</span>
		  </a></li>
		  <!-- 작가 -->
		  </c:if>   
		  
		  <!-- 장르 추천 2개 / 작가 추천 2개인 경우 -->
		  <c:if test="${map.flag eq 2}">
		  <!-- 장르 -->
		  <c:forEach var="book" varStatus="status" items="${map.genreList}">
		  <!-- 장르 네 개 중 첫번째와 마지막 생략 -->
		  <c:if test="${not status.last and not status.first}">
		  <li><a href="${path}/book/detail?book_id=${book.book_id}">
		  <div class="img_wrap">
  		    <img class="book_cover" src="../../resources/images/bookcover/${book.book_cover}">
  		  </div>
  		  <h4 class="book_ttl">${book.book_title}</h4>
  		  <span class="book_price">${book.book_price}원</span>
		  </a></li>
		  </c:if>		 
		  </c:forEach>
		  <!-- 장르 -->
		  <!-- 작가 -->
		  <c:forEach var="book" items="${map.writerList}">
		  <li><a href="${path}/book/detail?book_id=${book.book_id}">
		  <div class="img_wrap">
  		    <img class="book_cover" src="../../resources/images/bookcover/${book.book_cover}">
  		  </div>
  		  <h4 class="book_ttl">${book.book_title}</h4>
  		  <span class="book_price">${book.book_price}원</span>
		  </a></li>
		  </c:forEach>
		  </c:if>    
       </ul>    
      </article>
      </c:if>
      <c:if test="${empty user_id}">
      <article class="book_list">
        <div class="recommend_msg">
          <div class="join_msg">
            <h3>BOOKSHOP의 회원이 되시면 취향에 맞는 책을 추천해드려요!</h3>
            <p>
              다양한 책을 추천받고<br>
              나만의 공간에 독서기록을 남겨보세요.<br>
              독서 경험이 쌓일수록 <br>
              이 곳은 당신에게 특별한 공간이 될거에요!
            </p>
            <a class="join_btn" href="../joinTerm">GO TO JOIN</a>
          </div>
          <div class="img_box">
            <img src="../../resources/images/book_store_2.jpg" alt="">
          </div>
        </div>
       </article>      
      </c:if>
    </section>
    <!-- [3] 푸터 -->
     <footer id="footer">
        <ul class="btns_group">
          <li><a href="#">AGREEMENT</a></li>
          <li><a href="#">PRIVACY POLICY</a></li>
          <li><a href="#">GUIDE</a></li>
        </ul>
        <ul class="cs_msg">
          <li>CS CENTER 09:00 ~ 18:00(월~금, 공휴일 제외)</li>
          <li>주문/교환/반품 문의&nbsp;|&nbsp;1:1 문의 게시판 이용</li>
          <li>상품 관련 문의&nbsp;|&nbsp;1:1 문의 게시판 이용</li>
        </ul>
        <ul class="com_info">
          <li>THE BOOK SHOP CEO.YOO CHOI LEE BUSINESS LICENSE. [00000000] ON-LINE REGISTER. 000 668, JUNGANG-DAERO, BUSANJIN-GU, BUSAN, REPUBLIC OF KOREA</li>
          <li>teambook3lcy@gmail.com 개인정보관리책임자 YOO CHOI LEE COPYRIGHT © 2021 THE BOOK SHOP</li>
        </ul>
      </footer>  
    <!-- 검색모달 -->
    <div class="search_modal" style="display:none">
        <div class="search_wrap">
            <h3>찾고싶은 책을 검색해주세요</h3>
            <input type="text" id="book_search" class="book_search"/>
            <p class="placeholder">제목, 작가 키워드로 검색하세요</p>
        </div>   
    </div>
  </div>
  
  <script>
  $(document).ready(function(){
	var msg = '${msg}';
	if(msg != null && msg != '') alert(msg);
  });
  </script>
</body>
</html>