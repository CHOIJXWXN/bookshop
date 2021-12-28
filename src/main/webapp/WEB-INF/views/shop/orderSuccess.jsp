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
    <link rel="stylesheet" href="${path}/resources/css/mainNav.css" />
    <link rel="stylesheet" href="${path }/resources/css/order_set.css" />
  </head>
<body>
    <div id="wrap">
     <!-- [1] 네비게이션 -->
     <jsp:include page="../mainNav.jsp"/>
      <!-- [2] 메인화면 -->
      <section id="order_set">
        <!-- [2-1] 제목 -->
        <header class="order_ttl">
            <h2>ORDER CONFIRMATION</h2>
            <div class="process">
               <div class="process_wrap">
                 <!-- 원아이콘 -->
                 <ul class="circle">
                   <li></li>
                   <li></li>
                   <li class="now"></li>
                 </ul>
                 <ul class="pro_name">
                   <li>STEP 1 | 장바구니</li>
                   <li>STEP 2 | 주문서 작성 & 결제</li>
                   <li class="now">STEP 3 | 주문완료</li>
                 </ul>
               </div>
            </div>
        </header>
        <!-- [2-2] 결제완료 -->
        <article id="order_confirmation">
            <!-- 소제목(빈공간) -->
            <div class="ttl"></div>
            <!-- 결제완료 메세지 -->
            <div class="msg_box">
              <img src="../resources/images/order_set_icon.png" alt="">
              <h3>결제가 완료되었습니다.</h3>
              <p>감사합니다.</p>
            </div>
        </article>
        <!-- [2-3] 주문 요약 정보 -->
        <article id="order_summary">
          <div class="container">
            <!-- 소제목 -->
            <div class="ttl">
              <img src="../resources/images/order_ttl_icon.png" alt="">
               <h3>주문 | 결제 정보</h3>
               <p>${map.order.order_date}</p>
            </div>
            <!-- 입력 폼 -->
            <div class="row">
              <label>&nbsp;&nbsp;주문번호</label>
              <p>${map.order.order_num}</p>
            </div>
            <div class="row_3">
              <label>&nbsp;&nbsp;배송지정보</label>
              <div class="delivery_info">
                <p>${map.order.order_name}</p>
                <p>${map.order.order_phone}</p>
                <p>${map.order.order_addr}</p>
                <p>${map.order.comments}</p>
              </div>
            </div>
            <div class="row">
              <label>&nbsp;&nbsp;총 결제금액</label>
              <p>
                ${map.order.final_cost}원
              </p>
            </div>
            <div class="row">
              <label>&nbsp;&nbsp;적립 후 보유 포인트</label>
              <p>
                ${map.point}원
              </p>
            </div>
          </div>         
        </article>
        <div class="btns_group">
          <a href="${path}/mypage/delivery" class="order_view">배송조회</a>
          <a href="${path}/book/" class="shop_view">SHOP</a>      
        </div>
        

      </section>
    </div>
  </body>
</html>
