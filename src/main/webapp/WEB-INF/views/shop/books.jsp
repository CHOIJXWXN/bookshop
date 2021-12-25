<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Book Shop</title>
  <link rel="stylesheet" href="${path}/resources/css/mainNav.css" />
  <link rel="stylesheet" href="${path}/resources/css/reset.css" />
  <link rel="stylesheet" href="${path}/resources/css/books1.css" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="${path}/resources/js/bookjs/search.js"></script>
  <script>
    $(document).ready(function(){
      // 카테고리 선택
      $(".category_ttl").mouseenter(function(){
        $(".category").stop().animate({"width":"250px"},400);
      });
      $(".category_ttl").mouseleave(function(){
        $(".category").stop().animate({"width":"0"},400);
      });
     
      // 판매량/신규순/평점순 정렬
      $(".order_by li").hover(
        function(){
        $(this).find(".fa-check").stop().animate({"width":"20px"},200);
      },
      function(){
        $(this).find(".fa-check").stop().animate({"width":"0"},200);
      }
      );

      $(".order_by li").click(function(){
        $(".fa-check").css({"width":"0"});
        $(this).find(".fa-check").css({"width":"20px"});
      });
    });
   </script> 
</head>
<body>
  <div id="wrap">
    <!-- [1] 네비게이션 -->
    <jsp:include page="../mainNav.jsp"/>
    <!-- [2] 메인화면 -->
    <section id="all_books">
        <!-- [2-1] 검색창 -->
        <div class="search_wrap">
            <input 
              type="text"
              placeholder="읽고싶은 책의 제목, 작가로 검색해보세요."
              name="keyword"
              maxlength="100"
              id="book_keyword"    
              class="search_box"       
            />
            <input type="hidden" name="book_genre" id="book_genre" value="${book_genre}">                  
            <button class="search_btn" id="search_btn">
            	<!-- <i class="fas fa-search fa-2x"></i> -->
                <img class="search_img" src="../../resources/images/search_btn.png" alt="">
              	<img src="" alt="">
            </button>                                              
        </div>
       <!-- [2-2] 페이지 타이틀 -->
       <header class="page_ttl">
       	 <h3>ALL BOOKS</h3>
<%--        	 <c:if test="${empty book_genre}">
         <h3>ALL BOOKS</h3>
         </c:if>
       	 <c:if test="${book_genre = 0 }">
         <h3>NOVEL</h3>
         </c:if>
         <c:if test="${book_genre = 1 }">
         <h3>POEM & ESSAY</h3>
         </c:if>
         <c:if test="${book_genre = 2 }">
         <h3>TRAVEL</h3>
         </c:if>
         <c:if test="${book_genre = -1 }">
         <h3>ALL BOOKS</h3>
         </c:if> --%>
       </header>
       <!-- [2-3] 정렬 버튼 영역 -->
       <div class="order_btns_wrap">
       	<div class="category_ttl">
       		<h3>CATEGORY&nbsp;&nbsp;&#124;</h3>
       		<ul class="category">
           	<li><a href="${path}/book?book_genre=-1">전체</a></li>
           	<li><a href="${path}/book?book_genre=0">소설</a></li>
           	<li><a href="${path}/book?book_genre=1">시/에세이</a></li>
           	<li><a href="${path}/book?book_genre=2">여행</a></li>
         </ul>
         <img src="../../resources/images/category_next.png" alt="">
       	</div> 
         <!-- 시/소설/에세이 카테고리를 선택하면 띄우지 않음 -->
         <c:if test="${book_genre < 0}">
         <ul class="order_by">
          <li><i class="fas fa-check"></i><a href="${path}/book?book_order=판매량순">판매량순</a></li>
          <li><i class="fas fa-check"></i><a href="${path}/book?book_order=신규출간순">신규출간순</a></li>
          <li><i class="fas fa-check"></i><a href="${path}/book?book_order=평점순">평점순</a></li>
         </ul>
         </c:if>        
       </div>
       <!-- [2-4] 도서 상품 리스트 영역 -->
       <article class="book_list">
         <ul class="book_prod_wrap">
         
           <!-- 받아오는 데이터 중 List<Book>(list)으로 반복문 -->
           <!-- 책 검색 시 ul 아래 태그는 모두 삭제되고 검색된 데이터로 다시 불러옴 List<Book>(searchList) -->
           <c:forEach var="book" items="${map.list}">
           	<li><a href="${path}/book/detail?book_id=${book.book_id}">
           	<div class="img_wrap">
             <img class="book_cover" src="../../resources/images/bookcover/${book.book_id}.jpg" alt="book_cover">
             </div>
             <h4 class="book_ttl">${book.book_title}</h4>
             <span class="book_price">${book.book_price}원</span>
           </a></li>
           </c:forEach>
           
         </ul>
         <!-- [2-5] 페이지 번호 -->
         <div class="paging_box">
          <ul class="page_num">
          	<!-- 이전 버튼 -->
          	<c:if test = "${map.paging.pageNumber != 1 }">
            <li><a href="${path }/book?pageNum=${map.paging.before}&book_genre=${book_genre}&book_order=${book_order}"><img src="../../resources/images/page_prev.png" alt=""></a></li>
            </c:if>
             <!-- 시작페이지번호 -->
             <c:forEach begin="${map.paging.minPage }" end="${map.paging.maxPage }" var="idx">
             <li>
               <a href="${path }/book?pageNum=${idx}&book_genre=${book_genre}&book_order=${book_order}" class="<c:out value="${map.paging.pageNumber == idx ? 'now' : ''}"/>">${idx}</a>
               <c:if test = "${map.paging.pageNumber == idx}">
               <div class="page_icon now"></div>
               </c:if>
             </li>
             </c:forEach>
             <c:if test = "${map.paging.next }">
             <li><a href="${path }/book?pageNum=${map.paging.forward}&book_genre=${book_genre}&book_order=${book_order}"><img src="../../resources/images/page_next.png" alt=""></a></li>
             </c:if>
           </ul>
         </div>
       </article>
             
    </section>
    <!-- [3] 푸터 -->
    <footer id="footer">
      푸터영역
    </footer> 
    
  </div>
  
  <script>
  $(document).ready(function(){
	var msg = '${msg}';
	if(msg != null && msg != '') alert(msg);
  });
  </script>
</body>
</html>