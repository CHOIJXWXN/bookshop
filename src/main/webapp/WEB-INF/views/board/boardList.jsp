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
                 <h3 class="board_writer">책제목</h3>
                 <h3 class="board_ttl">제목</h3>
                 <h3 class="board_date">날짜</h3>
             </div>
             <!-- 아래로 문의 리스트 10개씩 -->
             <!-- 여기부터 반복(10개) -->
             <c:forEach var="askList" items="${list }">
             <div class="row">
                 <div class="board_id">
                     <p>${askList.ask_id }</p>
                 </div>
                 <div class="board_writer">
                    <p>${askList.book_title }</p>
                 </div>
                 <div class="board_ttl">
                    <a href="#"><p style="text-align: left;">[문의종류] ${askList.ask_sort }</p></a>                    
                 </div>
                 
                 <div class="board_date">
                    <p>${askList.ask_date }</p>
                 </div>
             </div>
             </c:forEach>
             
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
