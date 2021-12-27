<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
     <meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
     <meta name="viewport" content="width=device-width, initial-scale=1.0" />
     <title>Book Shop</title>
	<!-- 글쓰기 에디터 라이브러리 -->
   <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	 <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	 <link rel="stylesheet" href="${path }/resources/css/reset.css" />  
   <link rel="stylesheet" href="${path }/resources/css/recordWrite.css" />
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">  
   <link rel="stylesheet" href="${path }/resources/css/mainNav.css" />
  </head>
  <body>
    <div id="wrap">
     <!-- [1] 메인 네비게이션 -->
     <jsp:include page="../mainNav.jsp" />  
      <!-- [2] 메인화면 -->
      <!-- 전체화면 -->
      <section id="write_record">
        <form action="./addRecord" method="GET">
        <!-- 레코드박스 -->
        <div class="record_box">
            <div class="book_info">
              <!-- 히든 -->
              <input type="hidden" name="book_id" value="${book.book_id}">
              <!-- 책 썸네일 -->
              <div class="img_wrap"><img src="../../resources/images/bookcover/${book.book_cover}" alt=""></div>
              <!-- 책 정보-->
              <div class="info_wrap">
                <div class="ttl">
                  <h3>책제목</h3>
                  <div class="book_ttl_wrap">
                    <p class="book_ttl">${book.book_title}</p>
                  </div>
                </div>
                <div class="writer">
                  <h3>작가</h3>
                  <p class="book_writer">${book.book_writer}</p>
                </div>
                <div class="pub">
                  <h3>출판사</h3>
                  <p class="book_pub">${book.book_pub}</p>
                </div>
                <div class="time">
                  <h3>독서기간</h3>
                  <div class="date_wrap">
                  	<input type="date" class="read_time" name="record_init_date" value="2022-01-01">
	                <span>~</span>
	                <input type="date" class="read_time" name="record_fin_date" value="2022-12-31">
                  </div>
                </div>
                <div class="score">
                  <h3>평점</h3>
                  <div class="book_score star-rating">
                    <input type="radio" id="5-stars" name="record_score" value="5" v-model="ratings" checked/>
                    <label for="5-stars" class="fas fa-star"></label>
                    <input type="radio" id="4-stars" name="record_score" value="4" v-model="ratings"/>
                    <label for="4-stars" class="fas fa-star"></label>
                    <input type="radio" id="3-stars" name="record_score" value="3" v-model="ratings"/>
                    <label for="3-stars" class="fas fa-star"></label>
                    <input type="radio" id="2-stars" name="record_score" value="2" v-model="ratings"/>
                    <label for="2-stars" class="fas fa-star"></label>
                    <input type="radio" id="1-star" name="record_score" value="1" v-model="ratings" />
                    <label for="1-star" class="fas fa-star"></label>
                  </div>
                </div>
              </div>
            </div>
            <!-- 입력폼 -->
            <div class="contents">
              <textarea id="summernote" name="record_contents"></textarea>
            </div>
            <!-- 버튼 -->
            <div class="btns_wrap">
              <button class="save">SAVE</button>
            </div>
        </div>
        </form>
      </section>    
    </div>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script>
      $(document).ready(function() {   
          $('#summernote').summernote({
              height: 300,                 // set editor height
              minHeight: 200,             // set minimum height of editor
              maxHeight: 250,             // set maximum height of editor
              focus: true,               // set focus to editable area after initializing summernote
              lang: 'ko-KR' // default: 'en-US'
            });
        });
  </script>
  </body>
</html>