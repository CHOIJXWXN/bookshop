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
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="${path }/resources/js/mainjs/join.js" charset="UTF-8"></script>
    <%-- 카카오 주소검색 API --%>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${path }/resources/js/mainjs/kakao.js" charset="UTF-8"></script>
    <script>
    $(document).ready(function() {
    	if (sessionStorage.getItem('joinFlag') != 0) {
    		alert('회원가입 동의가 필요합니다');
    		location.href = './joinTerm';
    		return;
    	} else {
    		sessionStorage.removeItem('joinFlag');
    	}
    });
    </script>
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
               <div class="process_wrap">
                 <!-- 원아이콘 -->
                 <ul class="circle">
                   <li></li>
                   <li class="now"></li>
                   <li></li>
                 </ul>
                 <ul class="pro_name">
                   <li>STEP 1 | 약관 동의</li>
                   <li class="now">STEP 2 | 회원정보 입력</li>
                   <li>STEP 3 | 가입완료</li>
                 </ul>
               </div>
            </div>
        </header>
        <!-- [2-2] 회원 정보 입력 -->
        <div class="guide_msg">
          <p>* 필수 입력 사항입니다.</p>
        </div>
        <form id ="join_form_en" method="POST" action="./joinSuccess">
          <div id="join_form">
            <div class="container">
              <!-- 입력 폼 -->
              <!-- 아이디 -->
              <div class="row">
                <label for="user_id">*&nbsp;아이디</label>
                <input type="text" id="user_id" name="user_id" placeholder="영문소문자/숫자, 4 ~ 16 자리">
                <p class="pass" id="id_pass">사용가능한 아이디입니다.</p>
                <p class="fail" id="id_fail">이미 가입된 아이디입니다.</p>
                <p class="fail" id="id_check">아이디는 4~14자리의 영어 소문자 와 숫자로만 입력가능 합니다.</p>
                <button type="button" class="checkId" id="checkId">중복확인</button>
              </div>
             
              <!-- 비밀번호 -->
              <!-- type ="text를 type="password" 로 변경 -->
              <div class="row">
                <label for="user_pw">*&nbsp;비밀번호</label>
                <input type="password" id="user_pw" name="user_pw"  placeholder="영문 대소문자/숫자/특수문자 조합, 8자 ~ 16자">
                <p class="fail" id="pw_check">비밀번호는 8~16자리의 영어, 숫자, 특수문자 조합으로 입력가능 합니다.</p>
              </div>
              <!-- 비밀번호 확인 -->
              <!-- type ="text를 type="password" 로 변경 -->
              <div class="row">
                <label for="user_pw2">*&nbsp;비밀번호 확인</label>
                <input type="password" id="user_pw2" name="user_pw2">
                <p class="fail" id="pw_fail">비밀번호가 다릅니다.</p> 
              </div>
              <!-- 이름 -->
              <div class="row">
                <label for="user_name">*&nbsp;이름</label>
                <input type="text" id="user_name" name="user_name" placeholder="숫자, 특수문자는 입력하실 수 없습니다.">
              </div>
              <!-- 생년월일 -->
              <div class="row row_birth">
                <label for="user_birth">&nbsp;&nbsp;생년월일</label>
                <input type="date" id="user_birth" name="user_birth" placeholder="yyyy-mm-dd">
                <i class="fas fa-calendar-alt"></i>
              </div>
              <!-- 닉네임 -->
              <div class="row">
                <label for="nickname">&nbsp;&nbsp;닉네임</label>
                <input type="text" id="user_nickname" name="user_nickname"  maxlength="10" placeholder="최대 10글자">
              </div>
               <!-- 이메일 -->
               <!-- 이메일 확인 알림을 위한 p 태그 추가 -->
               <div class="row email">
                <label for="user_email">*&nbsp;이메일</label>
                <!-- 이메일 도메인 주소넣기 위해 input창 추가, 넓이 120으로 축소 
                <input type="text" id="user_email" name="user_email" style="width: 240px">-->
                <input type="text" id="user_email_id" name="user_email_id" maxlength="30" style="width: 110px">
                
                <span>@</span>
                <input type="text" id="user_email_domain" name="user_email_domain" style="width: 110px">
                <select name="user_email_domain_S" id="user_email_domain_S" class="book_num">
                  <option value="" selected="selected">직접 입력</option>
                  <option value="naver.com">naver.com</option>
                  <option value="hanmail.com">hanmail.com</option>
                  <option value="gmail.com">gmail.com</option>
              	</select>
              	<p class="fail" id="email_regfail">이메일을 정확하게 입력해주세요.</p>
             	<p class="pass" id="email_pass">사용가능한 이메일입니다.</p>
               	<p class="fail" id="email_fail">이미 존재하는 이메일입니다.</p>
                <button type="button" class="checkEmail" id="checkEmail">중복확인</button>
              </div>
              <!-- 휴대폰번호 -->
              <div class="row">
                <label for="phone_num">*&nbsp;전화번호</label>
                <input type="tel" id="user_phone" name="user_phone" maxlength="11" placeholder="- 없이 입력하세요">
              </div>
              <!-- 주소 -->
                <div class="row_3">
                  <label >*&nbsp;주소</label>
                  <div class="wrap">
                    <div class="wrap2">
                        <input type="text" id="addr_1" name="addr_1" readonly="true" placeholder="우편번호" />  
                        <input type="button" id="findPost" onclick="DaumPostcode()" value="우편번호 검색" />
                    </div>   
                    <input type="text" id="addr_2" name="addr_2" readonly="true" placeholder="주소" />              
                    <input type="text" id="addr_3" name="addr_3" placeholder="상세주소" />
                  </div>          
                </div>
			  <!-- 좋아하는 장르 -->
              <div class="row final">
                <label>*&nbsp;가장 좋아하는 장르</label>
                <input type="radio" name="user_init_genre" value="소설" checked>
                <span>소설</span>
                <input type="radio" name="user_init_genre" value="시/에세이">
                <span>시/에세이</span>
                <input type="radio" name="user_init_genre" value="여행">
                <span>여행</span>
                <p>초기 도서 추천에 이용됩니다. RECOMMEND에서 확인해보세요!</p>
              </div>
            <!-- container class div 종료 --> 
            </div>
            <!-- 제출 -form --> 
            <div class="submit_btn_wrap">
              <input type="submit" class="submit_btn" value="JOIN">
            </div>
            <!-- id=join_fron div 종료 -->
          </div>
        </form>
      </section>
     <!-- id=wrap div 종료 -->
    </div>  
  </body>
  
</html>