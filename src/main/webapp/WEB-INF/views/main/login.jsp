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
    <link rel="stylesheet" href="${path }/resources/css/login.css" />  
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="${path}/resources/js/mainjs/login.js"></script>
  </head>
  <body>
    <div id="wrap">
    <!-- [1] 메인 네비게이션 -->
      <jsp:include page="../mainNav.jsp" />
      <!-- [2] 메인화면 -->
      <section id="login_view">
      <!-- form tag 삭제 
        <form name="fform" method="POST" action="/loginAction">-->
            <!-- 로그인 박스 -->
            <div class="container">
                <header>LOGIN</header>
                <div class="row">
                    <input type="text" name="user_id" id="user_id" placeholder="아이디">
                </div>
                <div class="row">
                    <input type="password" name="user_pw" id="user_pw" placeholder="비밀번호">
                </div>
                <div class="row_s">
                    <input type="checkbox" name="save_id" id="save_id">
                    <label for="save_id">아이디 저장</label>
                </div>
                <input type="hidden" name="pre_page" value="${pre_page}">
                <!-- msg 공간 추가 -->
                <p id="msg_id" style="color:red;">아이디를 입력하세요.</p>
                <p id="msg_pw" style="color:red;">비밀번호를 입력하세요.</p>
                <p id="msg1" style="color:red;">아이디 또는 비밀번호가 잘못 입력되었습니다.</p>
                <!-- type submit -> button 변경
                <input type="submit" value="LOGIN">-->
                <input type="button"  id="btn_login" value="LOGIN">
            </div>
       <!-- </form>  -->
       
        <div class="join_find">
            <p>아직 회원이 아니신가요?</p>
            <div class="btn_group">
                <a href="${path }/joinTerm" class="join">회원가입</a>
                <a href="${path }/find" class="find_id_pw">아이디 / 비밀번호 찾기</a>
            </div>
        </div>
        
        
      </section>
    </div>
    
    <script>
	$(document).ready(function() {		
		var msg = '${msg}';
		if(msg != null && msg != '') {
			alert(msg);
		}
	})
	</script>
  </body>
</html>