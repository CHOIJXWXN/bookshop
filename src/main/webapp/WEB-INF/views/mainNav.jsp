<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- [1] 헤더 -->
      <header id="header">
        <!-- 로고 -->
        <div class="header_wrap">
          <h2 class="logo">LOGO</h2>
          <!-- 네비 메뉴 -->
          <nav>
            <ul class="main_nav">
              <li class="nav_1"><a href="#">Books</a></li>
              <li class="nav_2"><a href="#">Diary</a></li>
              <li class="nav_3"><a href="#">Board</a></li>
            </ul>
            <!-- BOOKS HOVER : 서브메뉴 보이기 -->
            <ul class="books_sub_mn">
              <li><a href="#">ALL</a></li>
              <li><a href="#">FOR U</a></li>
            </ul>
          </nav>
          <!-- 인포메뉴 -->
          <!-- case1) 로그아웃 상태 -->
          <!-- <a href="#" class="info_mn">
            <img src="images/login.png" alt="">
            <span>Log In</span>
          </a> -->
          <!-- case2) 로그인 상태 -->
          <a href="#" class="info_mn">
            <img src="images/mypage.png" alt="">
            <span>My Page</span>
          </a>
        </div>
        
      </header>
</body>
</html>