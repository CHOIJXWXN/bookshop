<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>상세 페이지</title>
    <link rel="stylesheet" href="${path}/resources/css/reset.css" />
    <link rel="stylesheet" href="${path}/resources/css/book_detail.css" />
    <script src="${path}/resources/js/bookjs/detail.js"></script>
  </head>
  <body>
    <div id="wrap">
      <!-- [1] 네비게이션 -->
      <jsp:include page="../mainNav.jsp">
      <!-- [2] 메인화면 -->
      <section id="book_detail">
        <!-- [2-1] 책 썸네일 & 가격정보 -->
        <article id="book_info">
          <!-- 책 썸네일 -->
          <div class="book_img_box">
            <div class="book_thum">
              <img src="images/book_cover_big_temp1.gif" alt="book_cover">
              <!-- 확대버튼 -->
              <a href="#" class="zoom_btn">확대</a>
            </div>
          </div>
          <!-- [2-2] 가격 정보 & 구매하기 -->
          <div class="book_buy_info">
            <!-- (1) 책 제목 -->
            <header class="book_ttl">
              <h3>${book.book_title}</h3>
            </header>
            <!--(2) 책 가격 -->
            <ul class="book_price_info">
              <li>
                <h4>판매가</h4>
                <p id="price">${book.book_price}원</p>
              </li>
              <li>
                <h4>구매혜택</h4>
                <p id="point"></p>
              </li>
              <li>
                <h4>배송비</h4>
                <p id="shippingCost"></p>
              </li>
              <li>
                <h4>출판사</h4>
                <p>${book.book_pub}</p>
              </li>
            </ul>
            <!-- (3) 구매 정보 요약 -->
            <div class="buy_summary">
              <h4>${book.book_title}</h4>
              <select name="book_cnt" class="book_num">
                <option value="1" selected="selected">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
              </select>
              <span class="book_price" id="book_price"></span>
            </div>
            <!-- (4) 총 금액 -->
            <div class="buy_total">
              <h4 class="buy_total_ttl">총 합계금액</h4>
              <span class="buy_total_price" id="book_total_price"></span>
            </div>
             <!-- (5) 장바구니 & 구매하기 버튼 -->
            <ul class="buy_btns">
              <li><input type="submit" value="Add to Cart" onclick="javascript: form.action='./addCart';"/></li>
   	 		  <li><input type="submit" value="Buy Now" onclick="javascript: form.action='./';"/></li>
   	 		  <!-- 
              <li><a href="${path}/order/addCart">Add to Cart</a></li>
              <li><a href="${path}/order">Buy Now</a></li>
               -->
            </ul>
          </div>
         
        </article>
        <!-- [2-2] 책 상세페이지 영역 -->
        <article id="book_intro">
          <!-- (1) 책 제목 영역 -->
          <header class="book_intro_header">
            <h3>${book.book_title}</h3>
            <span>${book.book_writer}</span>
          </header>
          <!-- (2) 책 상세설명 이미지 불러오기 -->
          <img class="book_detail_img" src="../../resources/images/book_detail_img_temp.gif" alt="book_detail">
        </article>
        <!-- [2-3] 책 탭메뉴 영역 -->
        <article id="book_tab_mn">
          <div id="book_tab_box">
            <label for="tab1">배송 안내</label>
            <input type="radio" id="tab1" name="tab" checked />
            <label for="tab2">교환 반품</label>
            <input type="radio" id="tab2" name="tab" />
            <label for="tab3">책 리뷰</label>
            <input type="radio" id="tab3" name="tab" id="reviewTab" />

              <!-- 탭 내용 영역 -->
              <section class="delivery">delivery</section>
              <section class="change">change</section>
              <section class="review">review</section>
          </div>
          
        </article>
         
               
      </section>
      <!-- [3] 푸터 -->
      <footer id="footer">
        푸터영역
       </footer> 
      
    </div>
  </body>
</html>
