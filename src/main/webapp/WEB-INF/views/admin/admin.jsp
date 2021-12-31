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
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
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
                  <i class="fas fa-box fa-2x"></i>
                  주문 관리
                </a>
              </li>
              <li class="menu">
                <a class="mn_btn" href="${path}/admin/product">
                  <i class="fas fa-book fa-2x"></i>
                  상품 관리
                </a>
              </li>
              <li class="menu">
                <a class="mn_btn" href="${path}/admin/ask">
                  <i class="fas fa-comment-dots fa-2x"></i>
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