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
    <link rel="stylesheet" href="${path }/resources/css/findIdE.css" />
  </head>
  <body>
   <div id="wrap">
      <!-- [1] 메인 네비게이션 -->
      <jsp:include page="../mainNav.jsp" />
      <!-- [2] 메인화면 -->
      <section id="findIdE">
        <div class="findId_success">
            <h2>${user_name }</h2>
            <p>${user_email }</p>
            <div class="row">
                <input type="radio" name="id_list" id="id_list" checked />
                <label for="id_list">${user_id}</label>
            </div>
            <ul class="btns_wrap">
                <li><a href="#">LOGIN</a></li>
                <li><a href="#">FIND PASSWORD</a></li>
            </ul>
        </div>
      </section>    
    </div>
  </body>
</html>