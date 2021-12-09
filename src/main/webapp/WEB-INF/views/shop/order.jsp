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
    <link rel="stylesheet" href="${path }/resources/css/order_set.css" />
  </head>
  <body>
    <div id="wrap">
      <!-- [1] 네비게이션 -->
      <jsp:include page="../mainNav.jsp">
        <!-- [2-2] 주문상세내역 -->
        <article id="order_detail">
            <!-- 소제목 -->
            <div class="ttl">
                <img src="images/order_ttl_icon.png" alt="">
                <h3>주문상세내역</h3>
            </div>
            <!-- [2-2-1] 주문 상세내역 표 -->
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
                    <th width="11%" class="delivery_fee">배송비</th>
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
              <!-- [2-2-2] 장바구니 돌아가기 버튼 -->
              <a href="#" class="go_back">장바구니 가기</a>
               <!-- [2-2-3] 주문 합계-->
               <div class="order_check_wrap">
                <div class="order_tot">
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
              </div>
            </div>
        </article>
        <!-- [2-3] 주문자 정보 -->
        <article id="order_user_info">
          <div class="container">
            <!-- 소제목 -->
            <div class="ttl">
              <img src="images/order_ttl_icon.png" alt="">
               <h3>주문자 정보</h3>
            </div>
            <!-- 입력 폼 -->
            <div class="row">
              <label for="user_name">*&nbsp;주문하시는 분</label>
              <input type="text" id="user_name" name="user_name" >
            </div>
            <div class="row">
              <label for="address">&nbsp;&nbsp;주소</label>
              <input type="text" id="address" name="address" >
            </div>
            <div class="row">
              <label for="phone_num">*&nbsp;휴대폰번호</label>
              <input type="text" id="phone_num" name="phone_num" placeholder="- 없이 입력하세요." >
            </div>
          </div>
          
        </article>
        <!-- [2-4] 배송 정보 -->
        <article id="order_delivery_info">
          <div class="container">
            <!-- 소제목 -->
            <div class="ttl">
              <img src="images/order_ttl_icon.png" alt="">
               <h3>배송정보</h3>
            </div>
            <!-- 입력 폼 -->
            <div class="row">
              <label for="user_name">*&nbsp;배송지</label>
              <input type="radio" name="delivery" value="직접 입력" checked>직접 입력
              <input type="radio" name="delivery" value="주문자 정보와 동일">주문자 정보와 동일
            </div>
            <div class="row">
              <label for="recipient">*&nbsp;받으실 분</label>
              <input type="text" id="recipient" name="recipient">
            </div>
            <div class="row_3">
              <label>*&nbsp;받으실 곳</label>
              <button class="find_post">우편번호 검색</button>
              <input type="text" id="addr_1" name="addr_1" readonly="true">
              <input type="text" id="addr_2" name="addr_2" readonly="true">
              <input type="text" id="addr_3" name="addr_3" placeholder="상세주소 입력">
              <!-- 주소 -->
            </div>
            <div class="row">
              <label for="r_phone_num">*&nbsp;휴대폰번호</label>
              <input type="text" id="r_phone_num" name="r_phone_num" placeholder="- 없이 입력하세요." >
            </div>
            <div class="row">
              <label for="r_phone_num">&nbsp;&nbsp;남기실 말씀</label>
              <input type="text" id="r_phone_num" name="r_phone_num" >
            </div>
          </div>
        </article>
        <!-- [2-5] 결제 정보 -->    
        <article id="order_payment_info">
          <div class="container">
            <!-- 소제목 -->
            <div class="ttl">
              <img src="images/order_ttl_icon.png" alt="">
               <h3>결제 정보</h3>
            </div>
            <!-- 입력 폼 -->
            <div class="row">
              <label for="r_phone_num">&nbsp;&nbsp;상품 합계금액</label>
              <span>14,000원</span>
            </div>
            <div class="row">
              <label for="r_phone_num">&nbsp;&nbsp;배송비</label>
              <span>3,000원</span>
            </div>
            <div class="row">
              <label for="r_phone_num">&nbsp;&nbsp;할인 및 적립</label>
              <span>적립 포인트 : +70원</span>
            </div>
            <div class="row">
              <label for="point">&nbsp;&nbsp;포인트 사용</label>
              <input type="text" id="point" name="point" >
              <input type="checkbox" id="all_point" name="all_point">
              <label for="all_point">전액 사용(보유 포인트: 00원)</label>
            </div>
            <div class="row">
              <label for="r_phone_num">&nbsp;&nbsp;최종 결제 금액</label>
              <span>17,000원</span>
            </div>
          </div>
        </article>
        <!-- [2-6] 결제 수단 -->
        <article id="order_pay_method">
          <div class="container">
            <!-- 소제목 -->
            <div class="ttl">
              <img src="images/order_ttl_icon.png" alt="">
               <h3>결제수단</h3>
            </div>
            <!-- 입력 폼 -->
            <div class="row">
              <label for="r_phone_num">&nbsp;&nbsp;일반 결제</label>
              <input type="text" id="r_phone_num" name="r_phone_num" placeholder="- 없이 입력하세요." >
            </div>
            <div class="row">
              <label for="r_phone_num">&nbsp;&nbsp;무통장 입금</label>
              <input type="text" id="r_phone_num" name="r_phone_num" placeholder="- 없이 입력하세요." >
            </div>
          </div>
        </article>
        <!-- 최종 결제 안내 -->
        <article id="order_agree_wrap">
          <div class="order_price_sum">
            <span>최종 결제 금액 |</span>
            <span>17,000원</span>
          </div>
          <div class="agree_chk">
            <input type="checkbox" id="order_agree" name="order_agree">
            <label for="order_agree">[필수] 구매하실 상품의 결제정보를 확인하였으며, 구매진행에 동의합니다.</label>
          </div>
          <!-- 결제버튼 -->
          <input type="submit" name="order_set" id="order_set" value="결제하기">
        </article>
      </section>
    </div>
  </body>
</html>
