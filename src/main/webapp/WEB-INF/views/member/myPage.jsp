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
    <link rel="stylesheet" href="${path }/resources/css/mypage.css" />
  </head>
  
 <body>
<div id="wrap">
 <jsp:include page="../mainNav.jsp" />
	<section>
	    <div id="container">
	        <h1 id="title">My Page</h1>
	        <div id="quick_mn">
	            <ul>
	                <li>
	                    <a class="mn_btn" href="${path }/mypage/delivery">
	                        <img src="../resources/images/mypage_delivery.png" alt="icon" width="100" height="100">
	                        주문 / 배송 조회
	                    </a>
	                </li>
	                
	                <li>
	                    <a class="mn_btn" href="${path }/mypage/checkUser">
	                        <img src="../resources/images/mypage_userinfo.gif" alt="icon" width="100" height="100">
	                        회원 정보 수정
	                    </a>
	                </li>
	            </ul>
	        </div>
	    </div>
	</section>
</div>
</body>
</html>
    