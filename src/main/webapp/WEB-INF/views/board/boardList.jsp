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
    <link rel="stylesheet" href="${path }/resources/css/board.css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="${path }/resources/js/memberjs/profile.js" charset="UTF-8"></script>
  </head>
  <body>
    <div id="wrap">
    <!-- [1] 메인 네비게이션 -->
     <jsp:include page="../mainNav.jsp" />
 	<!-- [2] 메인화면 -->
      <section id="qna">
         <div class="container">
             <h2>QnA</h2>
             <div class="table_h">
                 <h3 class="board_id">No.</h3>
                 <h3 class="book_img"></h3>
                 <h3 class="ask_category"></h3>
                 <h3 class="board_ttl">제목</h3>
                 <h3 class="board_date">날짜</h3>
             </div>
             <!-- 아래로 문의 리스트 10개씩 -->
             <!-- 여기부터 반복(10개) -->
             <div class="row">
                 <div class="board_id">
                     <p>000000</p>
                 </div>
                 <div class="book_img">
                  <div class="img_box"><img src="images/book_cover_temp5.jpg" alt=""></div>
                 </div>
                 <div class="ask_category">
                    <p>[문의종류] 상품문의</p>
                </div>
                 <div class="board_ttl">
                    <a href="#"><p style="text-align: left;">| 달러구트 꿈 꿈백화점달러구트 꿈 꿈백화점달러구트 꿈백화점달러구트 꿈백화점달러구트 꿈백화점</p></a>                    
                 </div>
                 <div class="board_date">
                    <p>2021-12-18</p>
                 </div>
             </div>
             <!-- 여기까지 반복(10개) -->                    
            </div>
            
             <!-- 페이징 -->
             <div class="pagebox">
                 <ul class="pagenum_wrap">
                     <li><a href="#" class="prev">&nbsp;prev</a></li>
                     <li><a href="#" class="next">next&nbsp;</a></li>
                 </ul>
             </div>
         </div>
         
      </section>
    </div>
  </body>
</html>
