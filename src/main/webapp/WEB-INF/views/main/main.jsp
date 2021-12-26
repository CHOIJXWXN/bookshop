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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&display=swap" rel="stylesheet">  
    <script src="${path }/resources/js/mainjs/main.js" charset="UTF-8"></script>
  </head>
  <body>
    <div id="wrap">
      <jsp:include page="../mainNav.jsp" />
      <!-- [2] 메인화면 -->
      <section id="main">
        <div class="container">
          <a href="${path }/record/" class="diary_mn">
            <div class="mn_box">
              <img src="../../resources/images/book_record.jpg" alt="">
              <div class="img_cover">
                <h3 class="record">RECORD</h3>
             </div>
            </div>
            <div class="go_record">
              <p>독서기록</p>
              <img src="../../resources/images/main_diary_go.png" alt="">
            </div>
          </a>
          <!-- 랜덤 책글귀 -->
          <p class="book_random">
          </p>
          <!-- 랜덤 책글귀 -->
          <a href="${path }/book/" class="store_mn">
            <div class="mn_box">
              <img src="../../resources/images/book_store.jpg" alt="">
              <div class="img_cover">
                <h3 class="shop">SHOP</h3>
              </div>
            </div>
            <div class="go_store">
              <p>책상점</p>
              <img src="../../resources/images/main_store_go.png" alt="">
            </div>
          </a>
          <!-- 아이콘 -->
          <img class="bg_icon" src="../../resources/images/main_bg_icon.png" alt="">
        </div>
      </section>
      <!-- 푸터 -->
      <footer id="footer">
        <ul class="btns_group">
          <li><a href="#">AGREEMENT</a></li>
          <li><a href="#">PRIVACY POLICY</a></li>
          <li><a href="#">GUIDE</a></li>
        </ul>
        <ul class="cs_msg">
          <li>CS CENTER 09:00 ~ 18:00(월~금, 공휴일 제외)</li>
          <li>주문/교환/반품 문의&nbsp;|&nbsp;1:1 문의 게시판 이용</li>
          <li>상품 관련 문의&nbsp;|&nbsp;1:1 문의 게시판 이용</li>
        </ul>
        <ul class="com_info">
          <li>THE BOOK SHOP CEO.YOO CHOI LEE BUSINESS LICENSE. [00000000] ON-LINE REGISTER. 000 668, JUNGANG-DAERO, BUSANJIN-GU, BUSAN, REPUBLIC OF KOREA</li>
          <li>teambook3lcy@gmail.com 개인정보관리책임자 YOO CHOI LEE COPYRIGHT © 2021 THE BOOK SHOP</li>
        </ul>
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
