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
             <!-- 아래로 문의 리스트 5개씩 -->
             <!-- 여기부터 반복(5개) -->
             <c:forEach var="ask" items="${list }">
             <div class="row">
                 <div class="board_id">
                     <p>${ask.ask_id }</p>
                 </div>
                 <div class="book_img">
                  <div class="img_box"><img src="${path}/resources/images/bookcover/${book.book_cover }" alt=""></div>
                 </div>
                 <div class="ask_category">
                    <p>${ask.ask_sort }</p>
                </div>
                 <div class="board_ttl">
                    <a href="${path}/ask/boardView?ask_id=${ask.ask_id}"><p style="text-align: left;"> ${ask.book_title }</p></a>                    
                 </div>
                 <div class="board_date">
                    <p>${ask.ask_date }</p>
                 </div>
             </div>
             </c:forEach>
             <!-- 여기까지 반복(5개) -->                    
            </div>
            
             <!-- 페이징 -->
             <div class="pagebox">
                 <ul class="pagenum_wrap">
                     <li><a href="#" class="prev">&nbsp;prev</a></li>
                     <li><a href="#" class="next">next&nbsp;</a></li>
                 </ul>
             </div>
             </section>
         </div>
         

  </body>
</html>
