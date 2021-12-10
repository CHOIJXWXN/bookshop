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
    <link rel="stylesheet" href="${path }/resources/css/join.css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <%-- <script src="${path }/resource/js/jquery.js"></script> --%>
    <script src="${path }/resources/js/mainjs/join.js" charset="UTF-8"></script>
  </head>
	<body>
    <div id="wrap">
      <!-- [1] 메인 네비게이션 -->
      <jsp:include page="../mainNav.jsp" />
      <!-- [2] 메인화면 -->
      <section>
        <!-- [2-1] 제목 -->
        <header class="join1_header">
            <h2>JOIN US!</h2>
            <div class="process">
                <img src="../../resources/images/join_step2.png" alt="">
            </div>
        </header>
        <!-- [2-2] 회원 정보 입력 -->
        <div class="guide_msg">
          <p>* 필수 입력 사항입니다.</p>
        </div>
        <form method="POST" action="./joinAction">
          <div id="join_form">
            <div class="container">
              <!-- 입력 폼 -->
              <!-- 아이디 -->
              <div class="row_msg">
                <label for="user_id">*&nbsp;아이디</label>
                <input type="text" id="user_id" name="user_id" placeholder="영문소문자/숫자, 4 ~ 16 자리">
                <p class="pass">사용가능한 아이디입니다.</p>
                <p class="fail">이미 가입된 아이디입니다.</p>
                <button class="id_check">중복확인</button>
              </div>
              <!-- 비밀번호 -->
              <div class="row">
                <label for="user_pw">*&nbsp;비밀번호</label>
                <input type="text" id="user_pw" name="user_pw"  placeholder="영문 대소문자/숫자/특수문자, 10자 ~ 16자">
              </div>
              <!-- 비밀번호 확인 -->
              <div class="row_msg">
                <label for="user_pw2">*&nbsp;비밀번호 확인</label>
                <input type="text" id="user_pw2" name="user_pw2">
                <p class="pass">확인되었습니다.</p>
                <p class="fail">비밀번호가 다릅니다.</p>
              </div>
              <!-- 이름 -->
              <div class="row">
                <label for="user_name">*&nbsp;이름</label>
                <input type="text" id="user_name" name="user_name">
              </div>
              <!-- 생년월일 -->
              <div class="row">
                <label for="user_birth">&nbsp;&nbsp;생년월일</label>
                <input type="text" id="user_birth" name="user_birth" placeholder="ex)19801223">
              </div>
              <!-- 닉네임 -->
              <div class="row">
                <label for="nickname">&nbsp;&nbsp;닉네임</label>
                <input type="text" id="nickname" name="nickname">
              </div>
               <!-- 이메일 -->
               <div class="row">
                <label for="user_email">*&nbsp;이메일</label>
                <input type="text" id="user_email" name="user_email" style="width: 240px">
                <select name="book_num" class="book_num">
                  <option value="" selected="selected">직접 입력</option>
                  <option value="naver.com">naver.com</option>
                  <option value="hanmail.com">hanmail.com</option>
                  <option value="gmail.com">gmail.com</option>
              </select>
                <button class="id_check">확인</button>
              </div>
              <!-- 휴대폰번호 -->
              <div class="row">
                <label for="phone_num">*&nbsp;휴대폰번호</label>
                <input type="text" id="phone_num" name="phone_num" placeholder="- 없이 입력하세요">
                <button class="id_check">인증</button>
              </div>
              <!-- 주소 -->
              <div class="row_3">
                <label >*&nbsp;주소</label>
                <input type="text" id="addr_1" name="addr_1" readonly="true">  
                <button>우편번호 검색</button> 
                <input type="text" id="addr_2" name="addr_2" readonly="true">              
                <input type="text" id="addr_3" name="addr_3" placeholder="상세 주소 입력">
              </div>
              <!-- 좋아하는 장르 -->
              <div class="row final">
                <label>*&nbsp;가장 좋아하는 장르</label>
                <input type="radio" name="genre" value="소설" checked>소설
                <input type="radio" name="genre" value="시/에세이">시/에세이
                <input type="radio" name="genre" value="여행">여행
              </div>
              
            </div>
            <div class="submit_btn">
              <input type="submit" value="회원가입">
            </div>
            
          </div>
        </form>
      </section>
    </div>
  </body>
</html>