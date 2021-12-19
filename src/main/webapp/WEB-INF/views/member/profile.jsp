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
    <link rel="stylesheet" href="${path }/resources/css/profile.css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="${path }/resources/js/memberjs/profile.js" charset="UTF-8"></script>
  </head>
  <body>
    <div id="wrap">
    <!-- [1] 메인 네비게이션 -->
      <jsp:include page="../mainNav.jsp" />
      <!-- [2] 메인화면 -->
      <section id="changeInfo">
          <!-- 사이드 퀵메뉴 -->
        <div id="sidebar">
            <p id="nav_title">My Page</p>
            <a href="${path }/mypage/delivery">
                <span>주문 / 배송 조회&nbsp;&nbsp;</span>
            </a>
            <!-- <a href="prodManage.html">
                <span>교환 / 반품 / 취소&nbsp;&nbsp;</span>
            </a> -->
            <a href="${path }/mypage/profile" class="on">
                <span>회원 정보 수정&nbsp;&nbsp;</span>
            </a>
        </div>
        <!-- 회원정보 수정 폼 -->

        <form method="POST" action="./updateProfile">
            <div class="guide_msg">
                <p>* 필수 입력 사항입니다.</p>
              </div>
            <div id="join_form">
              <div class="container">
                <!-- 입력 폼 -->
                <!-- 아이디 -->
                <div class="row">
                  <label for="user_id">*&nbsp;아이디</label>
                  <input type="text" id="user_id" name="user_id" value="${users.user_id}" readonly="true" style="outline:none">
                </div>
                <!-- 비밀번호 -->
                <div class="row">
                  <label for="user_pw">*&nbsp;비밀번호</label>
                  <input type="password" id="user_pw" name="user_pw" value="${users.user_pw }" placeholder="영문 대소문자/숫자/특수문자, 10자 ~ 16자">
                </div>
                <!-- 비밀번호 확인 -->
                <div class="row_msg pw_check">
                  <label for="user_pw2">*&nbsp;비밀번호 확인</label>
                  <input type="password" id="user_pw2" name="user_pw2">
                  <p class="pass">확인되었습니다.</p>
                  <p class="fail">비밀번호가 다릅니다.</p>
                </div>
                <!-- 이름 -->
                <div class="row">
                  <label for="user_name">*&nbsp;이름</label>
                  <input type="text" id="user_name" name="user_name" value="${users.user_name}">
                </div>
                <!-- 생년월일 -->
                <div class="row">
                  <label for="user_birth">&nbsp;&nbsp;생년월일</label>
                  <input type="text" id="user_birth" name="user_birth" value="${users.user_birth}">
                </div>
                <!-- 닉네임 -->
                <div class="row">
                  <label for="nickname">&nbsp;&nbsp;닉네임</label>
                  <input type="text" id="user_nickname" name="user_nickname" value="${users.user_nickname}">
                </div>
                 <!-- 이메일 -->
                 <div class="row">
                  <label for="user_email">*&nbsp;이메일</label>
                  <input type="text" id="user_email" name="user_email" value="${users.user_email}" readonly="true" style="outline:none">
 
                </div>
                <!-- 휴대폰번호 -->
                <div class="row">
                  <label for="phone_num">*&nbsp;휴대폰번호</label>
                  <input type="text" id="user_phone" name="user_phone" value="${users.user_phone}">
                  <button class="id_check">인증</button>
                </div>
                <!-- 주소 -->
                <div class="row_3 final">
                  <label >*&nbsp;주소</label>
                  <input type="text" id="addr_1" name="addr_1" readonly="true"  value="${addr_1}" />  
                  <button type="button">우편번호 검색</button> 
                  <input type="text" id="addr_2" name="addr_2" readonly="true" value="${addr_2}" />              
                  <input type="text" id="addr_3" name="addr_3" value="${addr_3}" />
                </div>
                
                
              </div>
              <div class="submit_btn">
                <input type="submit" value="수정하기"/>
              </div>
              
            </div>
          </form>

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
