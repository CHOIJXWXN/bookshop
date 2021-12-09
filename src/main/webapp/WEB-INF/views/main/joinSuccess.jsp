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
    <link rel="stylesheet" href="${path }/resources/css/joinSuccess.css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <%-- <script src="${path }/resource/js/jquery.js"></script> --%>
    <script src="${path }/resource/js/join.js" charset="UTF-8"></script>
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
                <img src="images/join_step3.png" alt="">
            </div>
        </header>
      <a href="${path }/login">로그인하러가기</a>
      

      </section>
    </div>
  </body>
</html>