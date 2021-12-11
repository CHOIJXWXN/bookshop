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
    <link rel="stylesheet" href="${path }/resources/css/joinSuccess.css" />
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
                <img src="../../resources/images/join_step3.png" alt="">
            </div>
        </header>
        <!-- [2-2] 가입 성공 메시지 박스 -->
        <div class="join_success_msg">
          <h3>회원가입이 완료되었습니다.</h3>
          <a href="/login">LOGIN</a>
        </div>
      </section>
    </div>
  </body>
</html>