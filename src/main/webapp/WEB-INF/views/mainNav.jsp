<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
$(document).ready(function() {
	  $('.nav_1').hover(function() {		  
        $('.books_sub_mn').stop().slideDown(300);
        $('.books_sub_mn').css('display', 'flex');
    }, function() {
  	  $('.books_sub_mn').stop().slideUp(300);
    });
	  
	  $('.my_mn').hover(function() {
		  $('#my_mn').stop().slideDown(300);
		  $('#my_mn').css('display', 'flex');
	  }, function() {
		  $('#my_mn').stop().slideUp(300);
	  });
});
</script>
</head>
<body>
	<!-- [1] 헤더(메인 네비게이션) -->
      <header id="header">
        <!-- (1) 로고 -->
        <div class="header_wrap">
          <h2 class="logo">
            <a href="${path }/">LOGO</a>            
          </h2>
          <!-- (2) 네비 메뉴 -->
          <nav>
            <ul class="main_nav">
              <li class="nav_1"><a href="${path }/book">Books</a>
              	<ul class="books_sub_mn">
	              <li><a href="${path }/book">ALL</a></li>
	              <li><a href="${path }/book/best">BEST</a></li>
	            </ul>
              </li>
              <li class="nav_2"><a href="${path }/record/">Diary</a></li>
              <c:if test="${admin != 1}">
              <li class="nav_3"><a href="${path }/ask/">Board</a></li>
              </c:if>
              <c:if test="${admin == 1}">
              <li class="nav_3"><a href="${path }/admin/">Admin</a></li>
              </c:if>
            </ul>
            <!-- BOOKS HOVER : 서브메뉴 보이기 -->
            
          </nav>
          <!-- (3) 인포메뉴 -->
          <!-- case1) 로그아웃 상태 -->
          <c:if test="${empty user_id }">
          <a href="${path }/login" class="info_mn login">
            <img src="${path}/resources/images/login.png" alt="login">
            <span>Log In</span>
          </a>
          <a href="${path }/joinTerm" class="info_mn join">
            <img src="${path}/resources/images/login.png" alt="join">
            <span>Join</span>
          </a>
          </c:if>
          <!-- case2) 로그인 상태 -->
         <c:if test="${admin == 0}">
         <div class="my_mn">
           <img src="${path}/resources/images/mypage.png" alt="">
           <ul id="my_mn" style="display: none;">
	         <li><a href="${path}/mypage/">MYPAGE</a></li>
	         <li><a href="${path}/order/cart">CART</a></li>
	         <li><a href="${path}/logout">LOGOUT</a></li>
           </ul>
         </div>
         </c:if>
         <!-- case3) 관리자 상태 -->
         <c:if test="${admin == 1}">
         <div class="my_mn">
           <img src="${path}/resources/images/mypage.png" alt="">
           <ul id="my_mn" style="display: none; height: 60px">
	         <li><a href="${path}/mypage/">MYPAGE</a></li>
	         <li><a href="${path}/logout">LOGOUT</a></li>
           </ul>
         </div>
         </c:if>
        </div>        
      </header>
      <!-- 네비게이션 메뉴 종료 -->
</body>
</html>