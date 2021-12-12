<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Book Shop</title>
  <link rel="stylesheet" href="${path}/resources/css/reset.css" />
  <link rel="stylesheet" href="${path}/resources/css/books1.css" />
  <script src="${path}/resources/js/bookjs/search.js"></script>
</head>
<body>
  <div id="wrap">
    <!-- [1] 네비게이션 -->
    <jsp:include page="../mainNav.jsp">
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
            <label>
              <button class="search_btn" id="search_btn">
              	<img src="" alt="">
              </button> 
            </label>                                               
        </div>
       <!-- [2-2] 페이지 타이틀 -->
       <header class="page_ttl">
         <h3>ALL BOOKS</h3>
       </header>
       <!-- [2-3] 정렬 버튼 영역 -->
       <div class="order_btns_wrap">
         <ul class="category">
           <li><a href="${path}/book?book_genre=0">시</a></li>
           <li><a href="${path}/book?book_genre=1">소설</a></li>
           <li><a href="${path}/book?book_genre=2">에세이</a></li>
         </ul>
         
         <!-- 시/소설/에세이 카테고리를 선택하면 띄우지 않음 -->
         <c:if test="${empty book_genre}">
         <ul class="order_by">
          <li><a href="${path}/book">판매량순</a></li>
          <li><a href="${path}/book/recentTop">신규출간순</a></li>
          <li><a href="${path}/book/reviewTop">평점순</a></li>
         </ul>
         </c:if>
         
       </div>
       <!-- [2-4] 도서 상품 리스트 영역 -->
       <article class="book_list">
         <ul class="book_prod_wrap">
         
           <!-- 받아오는 데이터 중 List<Book>(list)으로 반복문 -->
           <!-- 책 검색 시 ul 아래 태그는 모두 삭제되고 검색된 데이터로 다시 불러옴 List<Book>(searchList) -->
           <c:forEach var="book" items="${map.list}">
           	<li><a href="${path}/book/detail?book_id=${book.book_id}">
             <img class="book_cover" src="../../resources/images/book_cover_temp1.gif" alt="book_cover">
             <h4 class="book_ttl">${book.book_title}</h4>
             <span class="book_price">${book.book_price}원</span>
           </a></li>
           </c:forEach>
           
         </ul>
         <!-- [2-5] 페이지 번호 -->
         <div class="paging_box">
          <ul class="page_num">
            <li><a href="#"><img src="images/page_prev.png" alt=""></a></li>
             <li>
               <a href="#" class="now">1</a>
               <div class="page_icon now"></div>
             </li>
             <li><a href="#">2</a><div class="page_icon"></div></li>
             <li><a href="#">3</a><div class="page_icon"></div></li>
             <li><a href="#">4</a><div class="page_icon"></div></li>
             <li><a href="#">5</a><div class="page_icon"></div></li>
             <li><a href="#"><img src="../../resources/images/page_next.png" alt=""></a></li>
           </ul>
         </div>
       </article>
             
    </section>
    <!-- [3] 푸터 -->
    <footer id="footer">
      푸터영역
    </footer> 
    
  </div>
</body>
</html>