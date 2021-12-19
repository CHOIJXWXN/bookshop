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
	 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	 <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	 <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	 <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	 <link rel="stylesheet" href="${path }/resources/css/reset.css" />
     <link rel="stylesheet" href="${path }/resources/css/mainNav.css" />
     <link rel="stylesheet" href="${path }/resources/css/writeAsk.css" /> 
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
                     <select name="ask_category" class="ask_category">
                        <option value="1" selected="selected">상품문의</option>
                        <option value="2">배송문의</option>
                        <option value="3">기타문의</option>
                    </select>
                 </div>
                 <div class="row_h2">
                    <h3>문의상품</h3>
                    <!-- book_id 숨겨두기 -->
                    <div class="book_id">12345</div>
                    <div class="book_thumbnail">
                        <img src="../../resources/images/book_cover_temp1.gif" alt="">
                    </div>
                    <div class="book_ttl">
                        <h4 class="ttl">책제목 불러오기</h4>
                        <p class="writer">책작가 불러오기</p>
                    </div>
                </div>
                 
             </div>
             <!-- 내용 쓰는 부분 -->
             <div id="summernote"></div> 
                    
             <!-- 버튼박스 -->
             <div class="btn_box">
                 <button type="button" class="goback">←&nbsp;List</button>
                 <button type="button" class="upload">UPLOAD</button>
             </div>
         </div>       
      </section>
      <!-- 모달 - 모달 띄울 때 display: block; -->
      <!-- 1번 모달) 글쓰는 도중 list버튼(목록으로 돌아가기) 눌렀을 때 -->
      <div id="go_back_list" class="ask_modal" style="display:none">
        <h3>작성중인 문의글이 저장되지 않습니다.</h3>
        <a href="../">목록보기</a>
      </div>
      <!-- 2번 모달) 문의 카테고리를 선택하지 않았을 때 -->
      <div id="category_null" class="ask_modal" style="display:none">
        <h3>문의종류를 선택해주세요.</h3>
        <a href="#">확인</a>
      </div>
      <!-- 3번 모달) 문의 내용을 작성하지 않았을 때 -->
      <div id="contents_null" class="ask_modal" style="display:none">
        <h3>문의내용을 작성해주세요.</h3>
        <a href="#">확인</a>
      </div>
    </div>
     <script>
        $(document).ready(function() {
            $('#summernote').summernote({
                height: 300,                 // set editor height
                minHeight: 300,             // set minimum height of editor
                maxHeight: 450,             // set maximum height of editor
                focus: true,               // set focus to editable area after initializing summernote
                lang: 'ko-KR' // default: 'en-US'
              });
          });
    </script>
    <script>
    	$(document).ready(function() {
    		$('.goback').click(function(){
    			$('#go_back_list').css("display","block");
    		});
    	});
    </script>
  </body>
</html>
