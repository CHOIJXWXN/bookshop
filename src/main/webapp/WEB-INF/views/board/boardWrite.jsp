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
     <link rel="stylesheet" href="${path }/resources/css/writeAsk.css" />  
  </head>
  <body>
    <div id="wrap">
    <!-- [1] 메인 네비게이션 -->
      <jsp:include page="../mainNav.jsp" />
    <!-- [2] 메인화면 -->
      <section id="qna">
      <form id="wrtieAction" method="POST" action="./wrtieAction">
         <div class="container">
             <h2>QnA</h2>
             <div class="table_h">
                <!-- ask_sort (글 제목이자 문의종류) -->
                 <div class="row_h1">
                     <h3>제목</h3>
                     <select name="ask_sort" id="ask_sort" class="ask_category">
                        <option value="상품문의" selected="selected">상품문의</option>
                        <option value="배송문의">배송문의</option>
                        <option value="기타문의">기타문의</option>
                    </select>
                 </div>
                 <div class="row_h2">
                    <h3>문의상품</h3>
                    <!-- book_id 숨겨두었음 -- div 태그 에서 input hiden 이용
                    <div class="book_id" id="book_id" name="book_id">${book.book_id } </div> -->
                    <div class="book_id" >
                    <input type="hidden" id="book_id" name="book_id" value="${book.book_id }">
                    </div>
                    <div class="book_thumbnail" id="book_thumbnail" name="book_thumbnail">
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
             <!-- 내용 쓰는 부분 (ask_contents)-->
             <div>
                 <textarea id="summernote" name="ask_contents"></textarea>    
            </div>
                    
             <!-- 버튼박스 -->
             <div class="btn_box">
                 <button type="button" class="goback">←&nbsp;List</button>
                 <button type="button" class="upload" id="upload">UPLOAD</button>
             </div>
         </div> 
         </form>      
      </section>
      <!-- 모달 - 모달 띄울 때 display: block; -->
      <!-- 1번 모달) 글쓰는 도중 list버튼(목록으로 돌아가기) 눌렀을 때 -->
      <div id="go_back_list" class="ask_modal" style="display:none">
        <h3>작성중인 문의글이 저장되지 않습니다.</h3>
        <a href="../ask/">목록보기</a>
      </div>
      <%-- 문의 카테고리(제목)가 null인 경우가 없을거 같아서 주석처리함  -->
      <!-- 2번 모달) 문의 카테고리를 선택하지 않았을 때  -->
      <div id="category_null" class="ask_modal" style="display:none">
        <h3>문의종류를 선택해주세요.</h3>
        <a href="javascript:history.back();">확인</a>
      </div> --%>
      <!-- 3번 모달) 문의 내용을 작성하지 않았을 때 -->
      <div id="contents_null" class="ask_modal" style="display:none">
        <h3>문의내용을 작성해주세요.</h3>
        <!-- <a href="javascript:history.back();">확인</a>  -->
        <a id="confirm">확인</a> 
        <script>
            
        </script>
      </div>
    </div>
    
  </body>
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
<<<<<<< HEAD
     	$(document).ready(function() {
    	    $('.goback').click(function(){
    	        $('#go_back_list').show();
    	    });

    	    $('#upload').click(function () {
  	            var ask_sort = $('#ask_sort').val();
  	            var ask_contents = $('#summernote').val();
  	            alert(ask_contents);
  	            if(ask_sort == '') {
  	                $('#category_null').show();
  	                return;
  	            }
  	            // 아무 내용 없이 엔터나 띄어쓰기 입력 후 upload 클릭해도 알림 띄우기 -> ??
  	            if(ask_contents.replace(/\sl /gi,"") == '') {
  	                $('#contents_null').show();
  	                return;
  	            }
  	            /*
  	            if(ask_contents == '') {
  	            	$('#contents_null').show();
  	            }*/
  	            
  	          	$('#wrtieAction').submit();
  	            
    	    // upload.click.function    
    	    });
    	    
    	    // contents_null 모둘 확인창 클릭시
    	    $('#confirm').click(function (event){
        		$('#contents_null').hide();
        		event.preventDefault();
        	});
    	    
    	// document.ready.function   
    	});
=======
        $(document).ready(function() {
            $('.goback').click(function(){
                $('#go_back_list').show();
            });

            $('#upload').click(function () {
                var ask_sort = $('#ask_sort').val();
                var ask_contents = $('#summernote').val();
                alert(ask_contents);
                if(ask_sort == '') {
                    $('#category_null').show();
                    return;
                }
                // 아무 내용 없이 엔터나 띄어쓰기 입력 후 upload 클릭해도 알림 띄우기 -> ??
                if(ask_contents.replace(/\sl /gi,"") == '') {
                    $('#contents_null').show();
                    return;
                }
                /*
                if(ask_contents == '') {
                    $('#contents_null').show();
                }*/
                
                $('#wrtieAction').submit();
                
            // upload.click.function    
            });
            
            // contents_null 모둘 확인창 클릭시
            $('#confirm').click(function (event){
                $('#contents_null').hide();
                event.preventDefault();
            });
            
        // document.ready.function   
        });
>>>>>>> b1c7541514ba1166fef2c67f1f69bc1a42303d08
    </script> 
</html>
