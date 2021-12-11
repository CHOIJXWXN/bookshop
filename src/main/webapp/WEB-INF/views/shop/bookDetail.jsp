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
    <link rel="stylesheet" href="${path }/resources/css/bookDetail.css" />
  </head>
  <body>
    <div id="wrap">
      <!-- [1] 네비게이션 -->
      <jsp:include page="../mainNav.jsp">
      <!-- [2] 메인화면 -->
       <!-- [2] 메인화면 -->
      <section id="book_detail">
        <!-- [2-1] 책 썸네일 & 가격정보 -->
        <article id="book_info">
          <!-- 책 썸네일 -->
          <div class="book_img_box">
            <div class="book_thum">
              <img src="../../resources/images/book_cover_big_temp1.gif" alt="">
              <!-- 확대버튼 -->
              <a href="#" class="zoom_btn">확대</a>
            </div>
          </div>
          <!-- [2-2] 가격 정보 & 구매하기 -->
          <div class="book_buy_info">
            <!-- (1) 책 제목 -->
            <header class="book_ttl">
              <h3>시선으로부터</h3>
            </header>
            <!--(2) 책 가격 -->
            <ul class="book_price_info">
              <li>
                <h4>판매가</h4>
                <p>00,000원</p>
              </li>
              <li>
                <h4>구매혜택</h4>
                <p>포인트&nbsp;+00원(5%)</p>
              </li>
              <li>
                <h4>배송비</h4>
                <p>3,000원&nbsp;(20,000원 이상 구매시 배송비 무료)</p>
              </li>
              <li>
                <h4>출판사</h4>
                <p>출판사이름</p>
              </li>
            </ul>
            <!-- (3) 구매 정보 요약 -->
            <div class="buy_summary">
              <h4>시선으로부터</h4>
              <select name="book_num" class="book_num">
                <option value="1" selected="selected">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
              </select>
              <span class="book_price">00,000원</span>
            </div>
            <!-- (4) 총 금액 -->
            <div class="buy_total">
              <h4 class="buy_total_ttl">총 합계금액</h4>
              <span class="buy_total_price">00,000원</span>
            </div>
             <!-- (5) 장바구니 & 구매하기 버튼 -->
            <ul class="buy_btns">
              <li><a href="#">Add to Cart</a></li>
              <li><a href="#">Buy Now</a></li>
            </ul>
          </div>
         
        </article>
        <!-- [2-2] 책 상세페이지 영역 -->
        <article id="book_intro">
          <!-- (1) 책 제목 영역 -->
          <header class="book_intro_header">
            <h3>시선으로부터.</h3>
            <span>정세랑</span>
          </header>
          <!-- (2) 책 상세설명 이미지 불러오기 -->
          <img class="book_detail_img" src="../../resources/images/book_detail_img_temp.gif" alt="">
        </article>
        <!-- [2-3] 책 탭메뉴 영역 -->
        <article id="book_tab_mn">
          <div id="book_tab_box">
            <label for="tab1">배송 안내</label>
            <input type="radio" id="tab1" name="tab" />
            <label for="tab2">교환 반품</label>
            <input type="radio" id="tab2" name="tab" />
            <label for="tab3">책 리뷰</label>
            <input type="radio" id="tab3" name="tab" checked />

              <!-- 탭 내용 영역 -->
              <section class="delivery">delivery
                <!-- 빈공간 -->
                <div class="blank"></div>
              </section>
              <section class="change">change
                <!-- 빈공간 -->
                <div class="blank"></div>
              </section>
              <!-- **탭메뉴-3**리뷰페이지 -->
              <section class="review">
                <!-- 리뷰 입력 박스 -->
                <form method="POST" action="/writeReview">
                  <div class="write_form">
                    <!-- 리뷰 입력 박스 헤더 -->
                    <header class="form_ttl">
                      <!-- 책 사진 -->
                      <div class="book_img">
                        <img src="../../resources/images/book_cover_temp2.gif" alt="">
                      </div>
                      <!-- 책 요약 -->
                      <ul class="book_info">
                        <li>책제목</li>
                        <li>작가</li>
                        <li>출판사</li>
                      </ul>
                      <!-- 리뷰 title -->
                      <div class="review_msg">
                        <h3>이 책 어떠셨나요?</h3>
                        <div class="review_score">
                          <i class="far fa-star fa-2x"></i>
                          <i class="far fa-star fa-2x"></i>
                          <i class="far fa-star fa-2x"></i>
                          <i class="far fa-star fa-2x"></i>
                          <i class="far fa-star fa-2x"></i>
                        </div>
                      </div>
                    </header>
                    <!-- 리뷰 입력칸 -->
                    <input type="textarea" name="write_review" id="write_review_box" placeholder="로그인 후 리뷰등록 가능합니다." />
                   
                    <!-- 리뷰 등록 버튼 -->
                    <input type="submit" id="upload_review" value="리뷰 등록하기" />
                  </div>
                </form>
                <!-- 등록된 리뷰수, 평점 평균 -->
                <div class="review_status">
                  <span>등록된 리뷰 수 : 45개</span>
                  <span>&nbsp;&nbsp;평점 평균 : 3.5점</span>
                </div>
                <!-- 등록된 리뷰 리스트 3개씩  -->
                <div class="review_row">
                  <div class="review_writer">
                    <span>user_nickname</span>
                    <span>2021-12-10</span>
                  </div>
                  <div class="review_star">                  
                      <i class="far fa-star"></i>
                      <i class="far fa-star"></i>
                      <i class="far fa-star"></i>
                      <i class="far fa-star"></i>
                      <i class="far fa-star"></i>                   
                  </div>
                  <div class="view_review">
                    <p>꼭 나이가 많은 사람만 읽어야할 책이 아니다. '나는 누구인가?', '앞으로 살아갈 동안 무엇을 해야하는가? 등 삶에 대한 질문에 유리
                      한 답을 내어줄 수 있을 진정한 어른의 조언같은 책, 선물용으로 좋을 것 같다.꼭 나이가 많은 사람만 읽어야할 책이 아니다. '나는 누구인가?', '앞으로 살아갈 동안 무엇을 해야하는가? 등 삶에 대한 질문에 유리
                      한 답을 내어줄 수 있을 진정한 어른의 조언같은 책, 선물용으로 좋을 것 같다.</p>
                  </div>
                </div>
                <div class="review_row">
                  <div class="review_writer">
                    <span>user_nickname</span>
                    <span>2021-12-10</span>
                  </div>
                  <div class="review_star">
                    <i class="far fa-star"></i>
                      <i class="far fa-star"></i>
                      <i class="far fa-star"></i>
                      <i class="far fa-star"></i>
                      <i class="far fa-star"></i> 
                  </div>
                  <div class="view_review">
                    <p>꼭 나이가 많은 사람만 읽어야할 책이 아니다. '나는 누구인가?', '앞으로 살아갈 동안 무엇을 해야하는가? 등 삶에 대한 질문에 유리
                      한 답을 내어줄 수 있을 진정한 어른의 조언같은 책, 선물용으로 좋을 것 같다.</p>
                  </div>
                </div>
                <div class="review_row">
                  <div class="review_writer">
                    <span>user_nickname</span>
                    <span>2021-12-10</span>
                  </div>
                  <div class="review_star">
                    <i class="far fa-star"></i>
                      <i class="far fa-star"></i>
                      <i class="far fa-star"></i>
                      <i class="far fa-star"></i>
                      <i class="far fa-star"></i> 
                  </div>
                  <div class="view_review">
                    <p>꼭 나이가 많은 사람만 읽어야할 책이 아니다. '나는 누구인가?', '앞으로 살아갈 동안 무엇을 해야하는가? 등 삶에 대한 질문에 유리
                      한 답을 내어줄 수 있을 진정한 어른의 조언같은 책, 선물용으로 좋을 것 같다.꼭 나이가 많은 사람만 읽어야할 책이 아니다. '나는 누구인가?', '앞으로 살아갈 동안 무엇을 해야하는가? 등 삶에 대한 질문에 유리
                      한 답을 내어줄 수 있을 진정한 어른의 조언같은 책, 선물용으로 좋을 것 같다.꼭 나이가 많은 사람만 읽어야할 책이 아니다. '나는 누구인가?', '앞으로 살아갈 동안 무엇을 해야하는가? 등 삶에 대한 질문에 유리
                      한 답을 내어줄 수 있을 진정한 어른의 조언같은 책, 선물용으로 좋을 것 같다.</p>
                  </div>
                </div>
                <!-- 페이징처리 -->
                <ul class="page_num">
                  <li><a href="#">prev</a></li>
                  <li><a href="#">next</a></li>
                </ul>
                <!-- 빈공간 -->
                <div class="blank"></div>
              </section>             
          </div>         
        </article>              
      </section> 
      
    </div>
  </body>
</html>
