<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="${path}/resources/css/reset.css" />
    <link rel="stylesheet" href="${path}/resources/css/mainNav.css" />
    <link rel="stylesheet" href="${path}/resources/css/admin.css" />
  </head>
  <body>
    <div id="wrap">
      <jsp:include page="../mainNav.jsp"/>
      <section>
        <div id="container">
          <h1 id="title">관리자 페이지</h1>
          <div id="quick_mn">
            <ul>
              <li class="menu">
                <a class="mn_btn" href="${path}/admin/order">
                  <img src="" alt="icon" width="100" height="100">
                  주문 관리
                </a>
              </li>
              <li class="menu">
                <a class="mn_btn" href="${path}/admin/product">
                  <img src="" alt="icon" width="100" height="100">
                  상품 관리
                </a>
              </li>
              <li class="menu">
                <a class="mn_btn" href="${path}/admin/ask">
                  <img src="" alt="icon" width="100" height="100">
                  문의 관리
                </a>
              </li>
            </ul>
          </div>
        </div>
      </section>
    </div>
  </body>
</html>