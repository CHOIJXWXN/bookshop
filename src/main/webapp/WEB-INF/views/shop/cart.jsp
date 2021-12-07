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
    <link rel="stylesheet" href="${path }/resources/css/book_cart.css" />
  </head>
  <body>
    <div id="wrap">
       <!-- [1] 네비게이션 -->
      <jsp:include page="../mainNav.jsp">
      <!-- [2] 메인화면 -->
      <section id="book_order">
        <!-- [2-1] 제목 -->
        <header class="order_ttl">
            <h2>CART</h2>
            <div class="process">
                <img src="images/process_step1.png" alt="">
            </div>
        </header>
        <!-- [2-2] 주문상세내역 -->
        <article id="order_detail">
            <!-- 소제목(빈공간) -->
            <div class="ttl"></div>
            <!-- 주문 상세내역 표 -->
            <div class="container">
              <table>
                <thead>
                  <tr>
                    <th width="5%"><input type="checkbox" name="order_check" class="chk_box"></th>
                    <th width="0"><!--book_id--></th>
                    <th width="40%">상품/옵션 정보</th>
                    <th width="10%">수량</th>
                    <th width="11%">금액</th>
                    <th width="11%">할인/적립</th>
                    <th width="12%">합계금액</th>
                    <th width="11%">배송비</th>
                </tr>
                </thead>
                <tbody>
                  <tr class="row_style">
                    <td>
                      <input type="checkbox" name="order_check">
                    </td>
                    <td class="hidden_col"><!--book_id--></td>
                    <td class="book_name" style="text-align: left;">
                        <img src="images/book_cover_temp1.gif" alt="">
                        <span>책 제목&nbsp;|&nbsp;작가</span>
                    </td>
                    <td> 
                        <select name="book_num" class="book_num">
                            <option value="1" selected="selected">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </td>
                    <td>14,000원</td>
                    <td>5% 적립</td>
                    <td>14,000원</td>
                    <td rowspan="3" style="border-left: 0.5px solid #707070;">3,000원</td>
                </tr>
                <tr class="row_style">
                  <td><input type="checkbox" name="order_check"></td>
                  <td class="hidden_col"><!--book_id--></td>
                  <td class="book_name" style="text-align: left;">
                      <img src="images/book_cover_temp1.gif" alt="">
                      <span>책 제목&nbsp;|&nbsp;작가</span>
                  </td>
                  <td> 
                      <select name="book_num" class="book_num">
                          <option value="1" selected="selected">1</option>
                          <option value="2">2</option>
                          <option value="3">3</option>
                          <option value="4">4</option>
                          <option value="5">5</option>
                      </select>
                  </td>
                  <td>14,000원</td>
                  <td>5% 적립</td>
                  <td>14,000원</td>
              </tr>
              
              <tr class="row_style">
                <td><input type="checkbox" name="order_check"></td>
                <td class="hidden_col"><!--book_id--></td>
                <td class="book_name" style="text-align: left;">
                    <img src="images/book_cover_temp1.gif" alt="">
                    <span>책 제목&nbsp;|&nbsp;작가</span>
                </td>
                <td> 
                    <select name="book_num" class="book_num">
                        <option value="1" selected="selected">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </td>
                <td>14,000원</td>
                <td>5% 적립</td>
                <td>14,000원</td>
            </tr>
                </tbody>
              </table>
               <!-- [2-3] 선택상품 삭제 -->
              <a href="#" class="chk_delete">선택 상품 삭제</a>
              <!-- [2-4] 장바구니 합계 (주문 넘기기전 상태) -->
              <div class="order_prev_check_wrap">
                <div class="cart_tot">
                    <ul>
                        <li>
                            <h4>총 1개의 상품</h4>
                            <span>14,000원</span>
                        </li>
                        <li class="plus">
                          <img src="images/cart_plus.png" alt="">
                        </li>
                        <li>
                          <h4>배송비</h4>
                          <span>3,000원</span>
                      </li>
                      <li class="equal">
                        <img src="images/cart_equal.png" alt="">
                      </li>
                      <li>
                          <h4>총 주문금액</h4>
                          <span>17,000원</span>
                      </li>
                      
                    </ul>
                    <p>적립예정 포인트 : 1000원</p>
                </div>
                <!-- [2-5] 주문 버튼 -->
                <ul class="order_btns_wrap">
                    <li class="chk_only"><a href="#">선택 상품 주문</a></li>
                    <li class="all"><a href="#">전체 상품 주문</a></li>
                </ul>
              </div>
              
            </div>
        </article>
       

      </section>
    </div>
  
</html>


<!-- <div class="form-group">
    <input type="text" class="form-control" placeholder="아이디" name="userId" maxlength="20">					
</div> -->