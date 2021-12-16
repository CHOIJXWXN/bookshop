<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Book Shop</title>
  <link rel="stylesheet" href="${path }/resources/css/mainNav.css" />
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
        <!-- [2-1] 검색창 -->
        <div class="search_wrap">
            <input 
              type="text"
              placeholder="읽고싶은 책의 제목, 작가로 검색해보세요."
              name="keyword"
              maxlength="100"
              id="book_keyword"    
              class="search_box"       
            />  
            <button class="search_btn" id="search_btn">
              	<img src="images/search_btn.png" alt="">
            </button>                                           
        </div>
       <!-- [2-2] 페이지 타이틀 -->
       <header class="page_ttl">
         <h3>TRENDING&nbsp;&nbsp;NOW</h3>
       </header>
       <!-- [2-3] 도서 상품 리스트 영역 -->
       <article class="book_list">
         <ul class="book_prod_wrap">       
           <!-- 받아오는 데이터 중 List<Book>(list)으로 반복문 -->
           <!-- 책 검색 시 ul 아래 태그는 모두 삭제되고 검색된 데이터로 다시 불러옴 List<Book>(searchList) -->
  
           	<li><a href="#">
           	<div class="img_wrap">
             <img class="book_cover" src="../resources/images/bookcover/9782067242401.jpg" alt="book_cover">
             </div>
             <h4 class="book_ttl">가나다라마바사아</h4>
             <span class="book_price">20000원</span>
           </a></li>
           <li><a href="#">
            <div class="img_wrap">
          <img class="book_cover" src="../resources/images/bookcover/9782067255425.jpg" alt="book_cover">
          </div>
          <h4 class="book_ttl">가나다라마바사아</h4>
          <span class="book_price">20000원</span>
        </a></li>
        <li><a href="#">
            <div class="img_wrap">
          <img class="book_cover" src="../resources/images/bookcover/9788901248882.jpg" alt="book_cover">
          </div>
          <h4 class="book_ttl">가나다라마바사아</h4>
          <span class="book_price">20000원</span>
        </a></li>
        <li><a href="#">
            <div class="img_wrap">
          <img class="book_cover" src="../resources/images/bookcover/9782067242401.jpg" alt="book_cover">
          </div>
          <h4 class="book_ttl">가나다라마바사아</h4>
          <span class="book_price">20000원</span>
        </a></li>
        <li><a href="#">
            <div class="img_wrap">
          <img class="book_cover" src="../resources/images/bookcover/9782067242401.jpg" alt="book_cover">
          </div>
          <h4 class="book_ttl">가나다라마바사아</h4>
          <span class="book_price">20000원</span>
        </a></li>
        <li><a href="#">
            <div class="img_wrap">
          <img class="book_cover" src="../resources/images/bookcover/9782067242401.jpg" alt="book_cover">
          </div>
          <h4 class="book_ttl">가나다라마바사아</h4>
          <span class="book_price">20000원</span>
        </a></li>
        <li><a href="#">
            <div class="img_wrap">
          <img class="book_cover" src="../resources/images/bookcover/9782067242401.jpg" alt="book_cover">
          </div>
          <h4 class="book_ttl">가나다라마바사아</h4>
          <span class="book_price">20000원</span>
        </a></li>
        <li><a href="#">
            <div class="img_wrap">
          <img class="book_cover" src="../resources/images/bookcover/9782067242401.jpg" alt="book_cover">
          </div>
          <h4 class="book_ttl">가나다라마바사아</h4>
          <span class="book_price">20000원</span>
        </a></li>
        
        </ul>    
       </article>
    
       <!-- [2-4] 추천 도서 타이틀 -->
       <header class="recommend_ttl">
        <h3>RECOMMEND</h3>
      </header>
       <!-- 추가 헤더 까지 -->
       <article class="book_list">
        <ul class="book_prod_wrap">       
          <!-- 받아오는 데이터 중 List<Book>(list)으로 반복문 -->
          <!-- 책 검색 시 ul 아래 태그는 모두 삭제되고 검색된 데이터로 다시 불러옴 List<Book>(searchList) -->

              <li><a href="#">
              <div class="img_wrap">
            <img class="book_cover" src="../resources/images/bookcover/9782067242401.jpg" alt="book_cover">
            </div>
            <h4 class="book_ttl">가나다라마바사아</h4>
            <span class="book_price">20000원</span>
          </a></li>
          <li><a href="#">
           <div class="img_wrap">
         <img class="book_cover" src="../resources/images/bookcover/9788931004069.jpg" alt="book_cover">
         </div>
         <h4 class="book_ttl">가나다라마바사아</h4>
         <span class="book_price">20000원</span>
       </a></li>
       <li><a href="#">
           <div class="img_wrap">
         <img class="book_cover" src="../resources/images/bookcover/9788932008806.jpg" alt="book_cover">
         </div>
         <h4 class="book_ttl">가나다라마바사아</h4>
         <span class="book_price">20000원</span>
       </a></li>
       <li><a href="#">
           <div class="img_wrap">
         <img class="book_cover" src="../resources/images/bookcover/9782067242401.jpg" alt="book_cover">
         </div>
         <h4 class="book_ttl">가나다라마바사아</h4>
         <span class="book_price">20000원</span>
       </a></li>       
       </ul>    
      </article>
      
    </section>
    <!-- [3] 푸터 -->
    <footer id="footer">
      푸터영역
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