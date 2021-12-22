<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Book Shop</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="${path }/resources/css/reset.css" />
    <link rel="stylesheet" href="${path }/resources/css/mainNav.css" />
    <link rel="stylesheet" href="${path }/resources/css/style.css" />
  </head>
  <body>
    <div id="wrap">
      <jsp:include page="../mainNav.jsp" />
      <section id="main">
        <!-- 대표 메뉴 -->
        <ul class="q_mn">
          <li><a href="${path }/record">diary 독서기록</a></li>
          <li><a href="${path }/book">book shop 책 쇼핑몰</a></li>
        </ul>
        <!-- 배경 요소-->
        <h1 class="bg_msg">
        READ<br>
        AND WRITE
        </h1>
        <div class="bg_line"></div>
      </section>
      <!-- 푸터 -->
      <footer id="footer">
        푸터영역
      </footer>
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
    