<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Book Shop</title>
    <link rel="stylesheet" href="${path }/resources/css/reset.css" />
    <link rel="stylesheet" href="${path }/resources/css/mainNav.css" />
    <link rel="stylesheet" href="${path }/resources/css/findIdP.css" />
  </head>
  <body>
   <div id="wrap">
      <!-- [1] 메인 네비게이션 -->
      <jsp:include page="../mainNav.jsp" />
      <!-- [2] 메인화면 -->
      <section id="findIdP">
        <div class="findId_success">
            <h2>${users.user_name }</h2>
            <p>${users.user_phone }</p>
            <c:forEach var="users" items="${list }">
            <div class="row">
            	<div>
	                <input type="radio" name="id_list" id="id_list" checked />
	                <label for="id_list">
	                <c:if test="${users.user_id ne null && users.user_id!=''}">
	                ${fn:substring(users.user_id,0,fn:length(users.user_id)-4)}****</c:if>
	                </label>
                </div>
            </div>
            </c:forEach>
            <ul class="btns_wrap">
                <li><a href="../login">LOGIN</a></li>
                <li><a href="../find">FIND PASSWORD</a></li>
            </ul>
        </div>
      </section>    
    </div>
  </body>
</html>