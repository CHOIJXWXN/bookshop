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
    <link rel="stylesheet" href="${path }/resources/css/books1.css" />
  </head>
  <body>
    <div id="wrap">
      <!-- [1] 네비게이션 -->
      <jsp:include page="../mainNav.jsp">
      <!-- [2] 메인화면 -->
      <section id="all_books">
          <!-- [2-1] 검색창 -->
          <form method="GET" action="searchAction.jsp">
          <div class="search_wrap">
              <input 
                type="text"
                placeholder="읽고싶은 책의 제목, 작가로 검색해보세요."
                name="book_keyword"
                maxlength="100"
                id="book_keyword"    
                class="search_box"       
              />              
              <label>
                <input type="submit" class="search_btn" id="search_btn"/>  
              </label>                                               
          </div>
         </form>
         <!-- [2-2] 페이지 타이틀 -->
         <header class="page_ttl">
           <h3>ALL BOOKS</h3>
         </header>
         <!-- [2-3] 정렬 버튼 영역 -->
         <div class="order_btns_wrap">
           <ul class="category">
             <li><a href="#">시</a></li>
             <li><a href="#">소설</a></li>
             <li><a href="#">에세이</a></li>
           </ul>
           <ul class="order_by">
            <li><a href="#">판매량순</a></li>
            <li><a href="#">신규출간순</a></li>
            <li><a href="#">평점순</a></li>
           </ul>
         </div>
         <!-- [2-4] 도서 상품 리스트 영역 -->
         <article class="book_list">
           <ul class="book_prod_wrap">
             <li><a href="#">
               <img class="book_cover" src="../../resources/images/book_cover_temp1.gif" alt="">
               <h4 class="book_ttl">보잘 것 없는 오늘이 행복이에요</h4>
               <span class="book_price">15,000원</span>
             </a></li>
             <li><a href="#">
              <img class="book_cover" src="../../resources/images/book_cover_temp2.gif" alt="">
              <h4 class="book_ttl">시선으로부터</h4>
              <span class="book_price">18,000원</span>
             </a></li>
             <li><a href="#">
              <img class="book_cover" src="../../resources/images/book_cover_temp3.gif" alt="">
              <h4 class="book_ttl">나태주 연필화 시집</h4>
              <span class="book_price">12,000원</span>
             </a></li>
             <li><a href="#">
              <img class="book_cover" src="../../resources/images/book_cover_temp4.gif" alt="">
              <h4 class="book_ttl">눈먼 자들의 도시</h4>
              <span class="book_price">23,000원</span>
             </a></li>
             <li><a href="#">
              <img class="book_cover" src="../../resources/images/book_cover_temp2.gif" alt="">
              <h4 class="book_ttl">시선으로부터</h4>
              <span class="book_price">18,000원</span>
             </a></li>
             <li><a href="#">6</a></li>
             <li><a href="#">7</a></li>
             <li><a href="#">8</a></li>
             <li><a href="#">9</a></li>
             <li><a href="#">10</a></li>
             <li><a href="#">11</a></li>
             <li><a href="#">12</a></li>
             <li><a href="#">13</a></li>
             <li><a href="#">14</a></li>
             <li><a href="#">15</a></li>
             <li><a href="#">16</a></li>
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
