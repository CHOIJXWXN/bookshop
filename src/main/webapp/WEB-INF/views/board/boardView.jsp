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
    <link rel="stylesheet" href="${path }/resources/css/viewAsk.css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  	<script>
  		$(document).ready(function() {
	    	$('#goback').click(function(){
	        location.href='../ask/';
	    	});
  		});
  </script>
  
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
                 <div class="row_h1">
                     <h3>제목</h3>
                     <p class="ask_ttl">${book.book_title }</p>
                 </div>
                 <div class="row_h2">
                    <h3>문의상품</h3>
                    <!-- book_id 숨겨두기 -->
                    <div class="book_id">${ask.book_id }</div>
                    <div class="book_thumbnail">
                        <!-- 책표지 불러오기 -->
                        <img src="${path}/resources/images/bookcover/${book.book_cover }" alt="">
                    </div>
                    <div class="book_ttl">
                        <h4 class="ttl">${book.book_title }</h4>
                        <p class="writer">${book.book_writer }</p>
                    </div>
                    <!-- order_num 숨겨두었음 -->
                    <div class="order_num">${order_num }</div>
                </div>               
             </div>        
             <!-- 문의 내용 불러오기 -->
             <div id="ask_contents">
       			<textarea id="qna_contents" readonly="true">${ask.ask_contents}</textarea>
             </div> 
             <!-- 등록된 댓글 -->
             <div id="ask_reply_box">
                 <h2>Reply</h2>
                 <!-- 댓글 수 만큼 반복 시작 -->
                 <div class="reply_row">
                     <div class="reply_contents">
                         <p>댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.</p>
                     </div>
                     <div class="reply_writer">
                         <p>gingerbeerlemonlime</p>
                     </div>
                     <div class="reply_date">
                        <p>2021-12-18</p>
                     </div>
                 </div>
                 <!-- 댓글 수 만큼 반복 끝-->
                 <!-- 여기부터 삭제 -->
                 <div class="reply_row">
                    <div class="reply_contents">
                        <p>댓글내용입니다.댓글내용입니다.댓글내용입니다.</p>
                    </div>
                    <div class="reply_writer">
                        <p>관리자</p>
                    </div>
                    <div class="reply_date">
                       <p>2021-12-19</p>
                    </div>
                </div>
                <div class="reply_row">
                    <div class="reply_contents">
                        <p>댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.</p>
                    </div>
                    <div class="reply_writer">
                        <p>gingerbeerlemonlime</p>
                    </div>
                    <div class="reply_date">
                       <p>2021-12-20</p>
                    </div>
                </div>
                <!-- 여기까지 삭제 -->
             </div>
             <div class="write_reply">
                <h2>Write</h2>
                <textarea id="write_reply" placeholder="댓글을 남겨주세요."></textarea>
             </div>
             <!-- 삭제버튼 -->
             <div class="btn_box">
                 <button type="button" id="goback" class="goback">←&nbsp;List</button>
                 <button type="button" class="upload_reply">SAVE</button>
                 <!-- <button type="button" class="delete">DELETE</button> -->
             </div>
         </div>
     
      </section>
    </div>
  </body>
  
</html>
