<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Book Shop</title>
    <link rel="stylesheet" href="${path}/resources/css/reset.css" />
    <link rel="stylesheet" href="${path }/resources/css/mainNav.css" />
    <link rel="stylesheet" href="${path}/resources/css/recordStart.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
  </head>
  <body>
    <div id="wrap">
      <!-- [1] 네비게이션 -->
      <jsp:include page="../mainNav.jsp"/> 
      <!-- [2] 메인화면 -->
      <section id="record_start">
        <form action="./addTitle" method="POST">
         <div class="start_form">
          <div class="img_box">
            <!-- <p>
              문구넣기
            </p> -->
          </div>
          <div class="contents">
            <i class="fas fa-book-open"></i>
            <h2>BOOK DIARY</h2>
            <p>독서기록 시작하기</p>
            <input type="text" class="record_name" name="user_title" placeholder="나의 독서 기록장에 특별한 이름을 지어주세요:)">
            <ul class="btns_wrap">
              <li class="start_btn"><button>Get Started</button></li>
           </ul>
          </div>           
        </div>
        </form>
      </section>    
    </div>
  </body>
</html>