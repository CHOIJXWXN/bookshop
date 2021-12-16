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
    <link rel="stylesheet" href="${path }/resources/css/find.css" />
    
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  
  </head>
  <body>
   <div id="wrap">
      <!-- [1] 메인 네비게이션 -->
      <jsp:include page="../mainNav.jsp" />
      <!-- [2] 메인화면 -->
      <!-- 전체화면 -->
      <section id="find">
        <!-- findID, findPW 감싸는 WRAP -->
       <ul id="findwrap">
         <!-- (1) findID -->
        <li class="findId">
          <!-- 제목 -->
          <h2>FIND ID</h2>
          <div id="findId_tab_box">
            <label for="tab1"><img src="../../resources/images/findIdPw_icon.png" alt="">이메일로 찾기</label>
            <input type="radio" id="tab1" name="tab" checked/>            
            <label for="tab2"><img src="../../resources/images/findIdPw_icon.png" alt="">휴대폰 번호로 찾기</label>
            <input type="radio" id="tab2" name="tab" />         
            <!-- ------------------------------------ -->
            <!-- 위의 탭박스 선택에 따라 아래 탭 컨텐츠 달라짐 -->
            <!-- 이메일로 찾기 선택시 -->
            
            <section class="email">
              <form name="findIdE" id="findIdE" method="POST" action="./findIdE">
                <div class="row">
                  <label for="user_name">이름</label>
                  <input type="text" id="user_name" name="user_name" >
                </div>
                <div class="row">
                  <label for="user_email">이메일</label>
                  <input type="text" id="user_email" name="user_email" >
                </div>
                <input type="submit" value="SEARCH">
              </form>
            </section>
            <!-- 휴대폰 번호로 찾기 선택시 -->
            <section class="phone">
              <form method="POST" action="findID_phone">
                <div class="row">
                  <label for="user_name">이름</label>
                  <input type="text" id="user_name" name="user_name" >
                </div>
                <div class="row_tel">
                  <label>휴대폰번호</label>
                  <input type="text" id="phone" name="tel1" class="tel1">
                  <input type="text" id="phone" name="tel2" >
                  <input type="text" id="phone" name="tel3" >
                </div>
                <input type="submit" value="SEARCH">
              </form>
            </section>
          </div>
        </li>
        <!-- (2) findPW -->
        <li class="findPw">
          <!-- 제목 -->
          <h2>FIND PASSWORD</h2>
          <div id="findId_tab_box">
            <label for="pw_tab1">
              <img src="../../resources/images/findIdPw_icon.png" alt="">
              이메일로 찾기
            </label>
            <input type="radio" id="pw_tab1" name="pw_tab" checked/>            
            <label for="pw_tab2"><img src="../../resources/images/findIdPw_icon.png" alt="">휴대폰 번호로 찾기</label>
            <input type="radio" id="pw_tab2" name="pw_tab" /> 
            <!-- ------------------------------------ -->
            <!-- 위의 탭박스 선택에 따라 아래 탭 컨텐츠 달라짐 -->
            <!-- 이메일로 찾기 선택시 -->
            <section class="pw_email">
              <form method="POST" action="/findPW_email">
                <div class="row">
                  <label for="user_id">아이디</label>
                  <input type="text" id="user_id" name="user_id" >
                </div>
                <div class="row">
                  <label for="user_name">이름</label>
                  <input type="text" id="user_name" name="user_name" >
                </div>
                <div class="row">
                  <label for="email">이메일</label>
                  <input type="text" id="email" name="email" >
                </div>
                <input type="submit" value="SEARCH">
             </form>
            </section>
            <!-- 휴대폰번호로 찾기 선택시 -->    
            <section class="pw_phone">
              <form method="POST" action="findPW_phone">
                <div class="row">
                  <label for="user_id">아이디</label>
                  <input type="text" id="user_id" name="user_id" >
                </div>
                <div class="row">
                  <label for="user_name">이름</label>
                  <input type="text" id="user_name" name="user_name" >
                </div>
                <div class="row_tel">
                  <label>휴대폰번호</label>
                  <input type="text" id="phone" name="tel1" class="tel1">
                  <input type="text" id="phone" name="tel2" >
                  <input type="text" id="phone" name="tel3" >
                </div>
                <input type="submit" value="SEARCH">
             </form>
            </section>
            <!-- --------------모달---------------- -->
		      <!-- 모달 띄울 때 display: block; -->
		      <div id="not_exist_msg" style="display: none;">
		        <h3>입력하신 정보로 가입된 회원 아이디는<br>존재하지 않습니다.</h3>
		        <a href="#">확인</a>
		      </div>
          </div>
        </li>
       </ul>       
      </section>
    </div>
    
<script>
	$(document).ready(function(){
		var msg = '${msg}';
		if(msg != null && msg != '') alert(msg);
	});
</script>
  </body>
</html>