<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
         <h3>${map.title}</h3>
       </header>
       <!-- [2-2] 독서기록 목록 -->
       <c:if test="${fn:length(map.list) eq 0}">
           <div class="no_record_box">
                 <div class="img_box">
                 	<img class="no_record_icon" src="../resources/images/no_record_icon.png" alt="">
                 </div>
                 <h3>
                  아직 기록된 책이 없습니다.<br>
                  첫번째 독서기록을 남겨주세요!<br>
                  기록하기 버튼을 누르면 기록할 책을 검색할 수 있어요.<br>
                  
                 </h3>
                 <a href="#" id="add_record2">
                    <span>책 기록하기<i class="fas fa-pencil-alt"></i></span>             
                </a>
                <p>기록이 쌓일수록&nbsp;${user_id }님의 취향에 딱 맞는 책을 추천해드려요 :)</p>
           </div>
       </c:if>
       <c:if test="${fn:length(map.list) != 0}">
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
                <a href="${path}/record/view?record_id=${record.record_id}">
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
                <c:if test = "${map.paging.pageNumber > 5}">
			    <li><a href="${path}/record?pageNum=${map.paging.before}"><img src="../../resources/images/page_prev.png" alt=""></a></li>
		        </c:if>
	            <c:forEach begin="${map.paging.minPage}" end="${map.paging.maxPage}" var="idx">
	            <li>
	              <a href="${path}/record?pageNum=${idx}" class="<c:out value="${map.paging.pageNumber == idx ? 'now' : ''}"/>">${idx}</a>
	              <c:if test = "${map.paging.pageNumber == idx}">
	              <div class="page_icon now"></div>
	              </c:if>
	            </li>
	            </c:forEach>
                <c:if test = "${map.paging.next}">
		        <li><a href="${path}/record?pageNum=${map.paging.forward}"><img src="../../resources/images/page_next.png" alt=""></a></li>
		        </c:if>
           </ul>
       </div>   
       </article>
       </c:if>
    </section>
    <!-- 검색모달 -->
    <div id="modal">
        <div class="modal_content">
          <div class="search_wrap">
            <button class="close_btn"><i class="far fa-times-circle fa-3x"></i></button>
            <h3>기록할 책을 검색해주세요</h3>
            <input type="text" id="book_search" class="book_search" placeholder="제목, 작가 키워드로 검색하세요."/>
            <div class="book_box" >
            	<a class="m_prev">
                    <div class="prev_t"></div>
                    <div class="prev_b"></div>
                </a>
                 <div class="book_rewrap">
                 </div>
                <a class="m_next">
                    <div class="next_t"></div>
                    <div class="next_b"></div>
                </a>
            </div>  
        </div>
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
        
        $("#add_record2").click(function(e){
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