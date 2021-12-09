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
    <link rel="stylesheet" href="${path }/resources/css/login.css" />
  </head>
  <body>
    <div id="wrap">
    <!-- [1] 메인 네비게이션 -->
      <jsp:include page="../mainNav.jsp" />
      <!-- [2] 메인화면 -->
      <section id="login_view">
        <form  method="POST" action="/loginAction">
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
                    <lable for="save_id">아이디 저장</lable>
                </div>
                <input type="submit" value="LOGIN">
            </div>
        </form>
        <div class="join_find">
            <p>아직 회원이 아니신가요?</p>
            <div class="btn_group">
                <a href="${path }/joinTerm" class="join">회원가입</a>
                <a href="${path }/find" class="find_id_pw">아이디 / 비밀번호 찾기</a>
            </div>
        </div>
        
      </section>
    </div>
  </body>
</html>