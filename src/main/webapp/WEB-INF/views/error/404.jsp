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
    <link rel="stylesheet" href="${path }/resources/css/error404.css" />
  </head>
  <body>
    <div id="wrap">
      <jsp:include page="../mainNav.jsp" />
      <section id="main">
        <!-- 배경 요소-->
        <h4 class="err_code">
        	404 ERROR
        </h4>
        <h5 class="err_msg"> 해당 페이지를 찾을 수 없습니다. </h5>
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
    