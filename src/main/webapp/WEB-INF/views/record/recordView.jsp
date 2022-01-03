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
   <link rel="stylesheet" href="${path }/resources/css/mainNav.css" />
   <link rel="stylesheet" href="${path }/resources/css/recordView.css" />
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">  
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  </head>
  <body>
    <div id="wrap">
     <!-- [1] 메인 네비게이션 -->
     <jsp:include page="../mainNav.jsp" />  
      <!-- [2] 메인화면 -->
      <!-- 전체화면 -->
      <section id="write_record">
        <form action="./edit" method="POST">
        <!-- 레코드박스 -->
        <div class="record_box">
            <div class="book_info">
              <input type="hidden" name="record_id" value="${recordPlus.record_id}">
              <!-- 책 썸네일 -->
              <div class="img_wrap"><img src="../../resources/images/bookcover/${recordPlus.book_cover}" alt=""></div>
              <!-- 책 정보-->
              <div class="info_wrap">
                <div class="ttl">
                  <h3>책제목</h3>
                  <div class="book_ttl_wrap">
                    <p class="book_ttl">${recordPlus.book_title}</p>
                  </div>
                </div>
                <div class="writer">
                  <h3>작가</h3>
                  <p class="book_writer">${recordPlus.book_writer}</p>
                </div>
                <div class="pub">
                  <h3>출판사</h3>
                  <p class="book_pub">${recordPlus.book_pub}</p>
                </div>
                <div class="time">
                  <h3>독서기간</h3>
                  <div class="date_wrap">
                  	<input type="date" class="read_time" name="record_init_date" value="${recordPlus.record_init_date}" readonly>
	                <span>~</span>
	                <input type="date" class="read_time" name="record_fin_date" value="${recordPlus.record_fin_date}" readonly>
                  </div>
                </div>
                <div class="score">
                 <h3>평점</h3>
                 <div class="book_score old-star-rating">             	
                 	<!-- 빈 별 -->
                 	<c:forEach var="i" begin="${recordPlus.record_score +1}" end="5">
                 	<input type="radio" id="star" name="old_record_score" v-model="ratings" disabled/>
                    <label for="star" class="fas fa-star"></label>
                 	</c:forEach>
                 	<!-- 채워진 별 -->
                 	<c:forEach var="i" begin="1" end="${recordPlus.record_score}">
                 	<input type="radio" id="star" name="old_record_score" v-model="ratings" disabled/>
                    <label for="star" class="fas fa-star filled"></label>
                 	</c:forEach>
                  </div>
                </div>
              </div>
            </div>
            <!-- 입력폼 -->
            <div class="contents">
              <div id="old_contents">${recordPlus.record_contents}</div>
              <div id="editor" style="display:none;"><textarea id="summernote" name="record_contents">${recordPlus.record_contents}</textarea></div>
            </div>
            <!-- 버튼 -->
             <div class="btns_wrap">
              <button type="button" class="edit">EDIT</button>
              <button type="button" class="delete" onclick="location.href='./delete?record_id=${recordPlus.record_id}'">DELETE</button>
              <button class="save" style="display: none;">SAVE</button>
            </div>
        </div>
        </form>
      </section>    
    </div>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<script>
  		$(document).ready(function() {
  			
  			$('.edit').click(function() {
    			$('#old_contents').remove();
    			$('#editor').show();
    			$('.save').show();
    			$('.edit').hide();
    			$('.delete').hide();
    			$('input[type=date]').attr('readonly', false);
    			$('div.note-insert').hide();
    			$('div.note-view').hide();
    			$('.old-star-rating').remove();
    			var str = '';
    			str += '<div class="book_score star-rating">';
    			str += '<input type="radio" id="5-stars" name="record_score" value="5" v-model="ratings"/>';
    			str += '<label for="5-stars" class="fas fa-star"></label>';
    			str += '<input type="radio" id="4-stars" name="record_score" value="4" v-model="ratings"/>';
    			str += '<label for="4-stars" class="fas fa-star"></label>'; 
    			str += '<input type="radio" id="3-stars" name="record_score" value="3" v-model="ratings"/>';
    			str += '<label for="3-stars" class="fas fa-star"></label>'; 
    			str += '<input type="radio" id="2-stars" name="record_score" value="2" v-model="ratings"/>';
    			str += '<label for="2-stars" class="fas fa-star"></label>'; 
    			str += '<input type="radio" id="1-stars" name="record_score" value="1" v-model="ratings"/>';
    			str += '<label for="1-stars" class="fas fa-star"></label>';
    			str += '</div>';
    			$('.score').append(str);
    			$('input[type=radio][value=${recordPlus.record_score}]').prop('checked', true);
    	    });
  			
  			$('#summernote').summernote({
  				height: 300,                 
  				minHeight: 200,             
  				maxHeight: 250,             
  				focus: true,               
  				lang: 'ko-KR'
  			});
  			
  			$('form').submit(function(event) {
          	  if ($('.note-editable p').text() == '') {      		  
          		  alert('기록이 비어있습니다');
          		  event.preventDefault();
          	  }
            });
  			
  		});
  	</script>
  </body>
</html>