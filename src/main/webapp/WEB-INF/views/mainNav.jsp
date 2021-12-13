<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
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
              <li class="nav_1"><a href="${path }/shop">Books</a></li>
              <li class="nav_2"><a href="${path }/record">Diary</a></li>
              <li class="nav_3"><a href="${path }/ask">Board</a></li>
            </ul>
            <!-- BOOKS HOVER : 서브메뉴 보이기 -->
            <ul class="books_sub_mn">
              <li><a href="${path }/book">ALL</a></li>
              <li><a href="${path }/book/best">BEST</a></li>
            </ul>
          </nav>
          <!-- (3) 인포메뉴 -->
          <!-- case1) 로그아웃 상태 -->
          <c:if test="${empty user_id }">
          <a href="${path }/login" class="info_mn login">
            <img src="../resources/images/login.png" alt="">
            <span>Log In</span>
          </a>
          </c:if>
          <!-- case2) 로그인 상태 -->
         <c:if test="${not empty user_id }">
          <a href="${path }/mypage" class="info_mn mypage">
            <img src="../resources/images/mypage.png" alt="">
            <span>My Page</span>
          </a>
           <a href="${path }/logout" class="logout">or&nbsp;&nbsp;Log Out</a>
          </c:if>
        </div>        
      </header>
      <!-- 네비게이션 메뉴 종료 -->
</body>
</html>