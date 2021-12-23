<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Book Shop</title>
  <link rel="stylesheet" href="${path }/resources/css/mainNav.css" />
  <link rel="stylesheet" href="${path}/resources/css/reset.css" />
  <link rel="stylesheet" href="${path}/resources/css/recordList.css" />
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="${path}/resources/js/recordjs/search.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
</head>
<body>
  <div id="wrap">
    <!-- [1] 네비게이션 -->
    <jsp:include page="../mainNav.jsp"/> 
    <!-- [2] 메인화면 -->
    <section id="diary">
       <!-- [2-1] 페이지 타이틀 -->
       <header class="page_ttl">
         <h3>00의 독서일기</h3>
       </header>
       <!-- [2-2] 독서기록 목록 -->
       <article class="book_list">
         <!-- 기록 추가하기 -->
         <div class='add_book'>
             <a href="#" id="add_record">
                 <img src="../../resources/images/pencil_icon.png" alt="">
                 <span>책 기록하기</span>             
             </a>
         </div>
         <!-- 기록한 책 리스트 -->
         <ul class="book_wrap">      
            <!-- 반복할 li태그  -->
            <c:forEach var="record" items="${map.list}">
           	<li>
                <a href="#">
           	    <div class="img_wrap">
                <img class="book_cover" src="../resources/images/bookcover/${record.book_cover}" alt="book_cover">
                </div>
                <h4 class="book_ttl">${record.book_title}</h4>
                <span class="book_score">
                	<c:forEach begin="1" end="${record.record_score}">
                	<i class="fas fa-star on"></i>
                	</c:forEach>
                	<c:forEach begin="${record.record_score + 1}" end="5">
                	<i class="fas fa-star"></i>
                	</c:forEach>
                </span>
                </a>
            </li> 
            </c:forEach>
         </ul>  
         <!-- 페이징 -->

        <!-- [2-5] 페이지 번호 -->
        <div class='paging_box'>
           <ul class="page_num">
               <!-- 이전, 다음 버튼 없을 때 a태그만 안나오도록 li도 같이 지우면 안됨 -->
                <li><a href="#"><img src="../../resources/images/page_prev.png" alt=""></a></li>
                <li>
                    <ul>
                        <li>
                            <a href="#" class="now">1</a>
                            <div class="page_icon now"></div>
                        </li>
                        <li><a href="#">
                            <a href="#">2</a>
                            <div class="page_icon"></div>
                        </a></li>
                        <li><a href="#">
                            <a href="#">3</a>
                            <div class="page_icon"></div>
                        </a></li>
                        <li><a href="#">
                            <a href="#">4</a>
                            <div class="page_icon"></div>
                        </a></li>
                        <li><a href="#">
                            <a href="#">5</a>
                            <div class="page_icon"></div>
                        </a></li>
                    </ul>
                </li>
                <li><a href="#"><img src="../../resources/images/page_next.png" alt=""></a></li>
           </ul>
       </div>   
       </article>    
    </section>
    <!-- 검색모달 -->
    <div id="modal">
        <div class="modal_content">
          <div class="search_wrap">
            <button class="close_btn"><img src="images/close_btn.png" alt=""></button>
            <h3>기록할 책을 검색해주세요</h3>
            <input type="text" id="book_search" class="book_search" placeholder="제목, 작가 키워드로 검색하세요."/>
            <input type="hidden" id="pageNum" value="${pageNum}"/>
            <div class="book_box" >
            </div>
            
          </div>
            <a href="#" class="prev">prev</a>
            <a href="#" class="next">next</a>
        </div>
        <div class="modal_layer"></div>
    </div>
  </div>
  <!-- 모달 스크립트 -->
  <!-- 모달 창 클릭했을 때 보이고 바깥 레이어 클릭했을 때 숨기기 -->
  <script>
    $(document).ready(function () {
        $("#modal").hide();
        $("#add_record").click(function(e){
            e.preventDefault();
            $("#modal").show();
         });

     $(".modal_layer").click(function(){
        $("#modal").hide();
     });
     $(".close_btn").click(function(){
        $("#modal").hide();
     });

    });    
  </script>  
  
  <script>
	$(document).ready(function(){
		var msg = '${msg}';
		if(msg != null && msg != '') alert(msg);
	});
  </script>
  
</body>
</html>