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
	    	
	    	$('#gobackAdmin').click(function(){
		        location.href='../admin/ask';
		    });
	    	
	    	  // 댓글 등록 + 보이기
	        $('#upload_reply').click(function() {
	           var ask_id = '${map.ask.ask_id }';
	           var askreply_contents = $('#write_reply').val();
	           
	           $.ajax({
	                type: 'GET',
	                url: './insertAskReply',
	                data: {
	                	ask_id: ask_id,
	                	askreply_contents: askreply_contents
	                },

	                dataType: 'JSON',
	                success: function(data) {
	                	 $('#replybody').empty();

	                    for (var i = 0; data.length; i++ ) {
	                        var str = '';
	                        str += '<div class="reply_row" >';
	                        str += '<div class="reply_contents" id="reply_contents">';
	                        str += '<p>' + data[i].askreply_contents + '</p>';
	                        str += '</div>';
	                        str += '<div class="reply_writer" id="reply_writer">';
	                        str += '<p>' + data[i].writer + '</p>';
	                        str += '</div>';
	                        str += '<div class="reply_date" id="reply_date">';
	                        str += '<p>' + data[i].askreply_date + '</p>'; 
	                        str += '</div>';
	                        // str += '<div class="delete"> <button type="button" id="delete_btn" class="delete_btn" onclick="deleteAskReply('+ data[i].askreply_id +')">삭제</button></div>';
	                        str += '</div>'
	                        $('#replybody').append(str);
	                        
	                    // 반복문    
	                    }
	                // success
	                }
	           // ajax     
	           });
				$('#write_reply').val('');
	         // upload_reply.click.fucntion   
	        })
	
      
 // document.ready.function    
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
                     <!-- <h3>제목</h3> --> 
                     <h3 class="ask_ttl_h">문의종류</h3> <!-- 문의 종류 -->
                     <p class="ask_ttl">${map.ask.ask_sort }</p>	<!-- 제목 -> 문의 종류 값 -->
                     <h3 class="ask_writer_h">작성자</h3>
                     <p class="ask_writer">${map.ask.writer }</p>
                 </div>
                 <!-- 문의 번호 -hidden으로 숨김 -->
                 <input type="hidden" id="ask_id" value="${map.ask.ask_id }">
                 <div class="row_h2">
                    <h3>문의상품</h3>
                    <!-- book_id 숨겨두기 -->
                    <div class="book_id">${map.ask.book_id }</div>
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
       			${map.ask.ask_contents}
             </div> 
             <!-- 등록된 댓글 -->
             <div id="ask_reply_box">
                 <h2>Reply</h2>
                  <div id="replybody">
                   <!-- 댓글 수 만큼 반복 시작 -->
                  <c:forEach var="askreply" items="${map. askreplyList}">
                	 <div class="reply_row" >
                     <div class="reply_contents" id="reply_contents">
                         <p><!-- 내용 -->${askreply.askreply_contents}</p>
                     </div>
                     <div class="reply_writer" id="reply_writer">
                         <p><!-- 작성자 -->${askreply.writer}</p>
                     </div>
                     <div class="reply_date" id="reply_date">
                        <p><!-- 작성 날짜 -->${askreply.askreply_date}</p>
                     </div>
                     <!-- 댓글 삭제 버튼 없앰
                     <c:if test="${user_id == askreply.writer }">
                     <div class="delete">
                        <button type="button" id="delete_btn" class="delete_btn" onclick="deleteAskReply(${askreply.askreply_id})">삭제</button>
                     </div>
                     </c:if>  -->
               		</div>
                  </c:forEach>
                   <!-- 댓글 수 만큼 반복 끝-->
                </div>
             </div>
             
             <!-- 댓글 등록 공간-->
             <div class="write_reply" >
                <h2>Write</h2>
                <textarea id="write_reply" placeholder="댓글을 남겨주세요."></textarea>
             </div>
             
             <div class="btn_box">
             	<!-- 회원 로그인시 목록가기 -->
             	<c:if test="${user.user_admin eq 0}">
                 <button type="button" id="goback" class="goback">←&nbsp;List</button>
                 </c:if>
                 <!-- 관리자 로그인시 목록가기 -->
                 <c:if test="${user.user_admin eq 1}">
                 <button type="button" id="gobackAdmin" class="goback">←&nbsp;AdminList</button>
                 </c:if>
                 <button type="button" id="upload_reply" class="upload_reply">SAVE</button>
                 <!-- <button type="button" class="delete">DELETE</button> -->
             </div>
         </div>
     
      </section>
    </div>
  </body>
  
</html>
