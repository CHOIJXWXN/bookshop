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
    <link rel="stylesheet" href="${path }/resources/css/findPwP.css" />
  </head>
  <body>
   <div id="wrap">
      <!-- [1] 메인 네비게이션 -->
      <jsp:include page="../mainNav.jsp" />
      <!-- [2] 메인화면 -->
      <section id="findPwP">
        <div class="findPw_success">
            <h2>임시 비밀번호가 전송되었습니다.</h2>
            <p>
                {user_id} 회원님, 임시 비밀번호를<br>
                000 - 000 - 0000 으로 보내드렸습니다.
            </p>
            
            <ul class="btns_wrap">
                <li class="login_btn"><a href="#">LOGIN</a></li>
                <li class="resend_btn"><a href="#">재전송</a></li>
            </ul>
        </div>
      </section>     
    </div>
  </body>
</html>