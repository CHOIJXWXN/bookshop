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
    <%-- 카카오 주소검색 API --%>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${path }/resources/js/mainjs/kakao.js" charset="UTF-8"></script>
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
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
            <a href="${path }/mypage/profile" class="active">
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
                <div class="row pw">
                  <label for="user_pw">&nbsp;&nbsp;새 비밀번호</label>
                  <input type="password" id="user_pw" name="user_pw" placeholder="영문 대소문자/숫자/특수문자 조합, 8자 ~ 16자">
                  <p class="form_check">비밀번호는 8~16자리의 영어, 숫자, 특수문자 조합으로 설정 가능합니다.</p>
                </div>
                <!-- 비밀번호 확인 -->
                <div class="row pw_check">
                  <label for="user_pw2">&nbsp;&nbsp;비밀번호 확인</label>
                  <input type="password" id="user_pw2" name="user_pw2">
                  <p class="pass">확인되었습니다.</p>
                  <p class="fail">비밀번호가 다릅니다.</p>
                </div>
                <!-- 이름 -->
                <div class="row">
                  <label for="user_name">*&nbsp;이름</label>
                  <input type="text" id="user_name" name="user_name" placeholder="숫자, 특수문자는 입력하실 수 없습니다." value="${users.user_name}">
                </div>
                <!-- 생년월일 -->
                <div class="row row_birth">
                  <label for="user_birth">&nbsp;&nbsp;생년월일</label>
                  <input type="date" id="user_birth" name="user_birth" value="${users.user_birth}">
                   <i class="fas fa-calendar-alt"></i>
                </div>
                <!-- 닉네임 -->
                <div class="row">
                  <label for="nickname">&nbsp;&nbsp;닉네임</label>
                  <input type="text" id="user_nickname" name="user_nickname" maxlength="10" placeholder="최대 10글자" value="${users.user_nickname}">
                </div>
                 <!-- 이메일 -->
                 <div class="row">
                  <label for="user_email">*&nbsp;이메일</label>
                  <input type="text" id="user_email" name="user_email" value="${users.user_email}" readonly="true" style="outline:none">
                </div>
                <!-- 휴대폰번호 -->
                <div class="row">
                  <label for="phone_num">*&nbsp;전화번호</label>
                  <input type="tel" id="user_phone" name="user_phone" minlength="11" maxlength="11" value="${users.user_phone}">
                </div>
                <!-- 주소 -->
                <div class="row_3">
                  <label >*&nbsp;주소</label>
                  <div class="wrap">
                    <div class="wrap2">
                        <input type="text" id="addr_1" name="addr_1" readonly="true"  value="${addr_1}" />  
                        <input type="button" id="findPost" onclick="DaumPostcode()" value="우편번호 검색" />
                    </div>   
                    <!-- <button type="button">우편번호 검색</button>  -->
                    <input type="text" id="addr_2" name="addr_2" readonly="true" value="${addr_2}" />              
                    <input type="text" id="addr_3" name="addr_3" value="${addr_3}" />
                  </div>          
                </div>
                <!-- 독서기록 이름 -->
                <c:if test="${not empty users.user_title}">
                <div class="row" style="border-top:0;">
                  <label for="user_title">*&nbsp;독서기록 이름</label>
                  <input type="text" id="user_title" name="user_title" value="${users.user_title}" >
                </div>
                </c:if>
                
                
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
