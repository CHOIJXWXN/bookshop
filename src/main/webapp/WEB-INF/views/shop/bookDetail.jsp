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
    <link rel="stylesheet" href="${path}/resources/css/mainNav.css" />
    <link rel="stylesheet" href="${path}/resources/css/bookDetail.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <c:if test="${not empty review}">
    <script>
    $(document).ready(function() {
    	var offset = $('label').offset();
		$('html, body').animate({
            scrollTop: offset.top
        }, 1000);
		$('#tab3').prop('checked', true);
    });
    </script>
    </c:if>
    <script src="${path}/resources/js/bookjs/detail.js"></script>
  </head>
  <body>
    <div id="wrap">
      <!-- [1] 네비게이션 -->
      <jsp:include page="../mainNav.jsp"/>
      <!-- [2] 메인화면 -->
       <!-- [2] 메인화면 -->
      <section id="book_detail">
        <!-- [2-1] 책 썸네일 & 가격정보 -->
        <article id="book_info">
          <form action="/order/" method="POST">
          <!-- 책 썸네일 -->
            <div class="book_img_box">
              <div class="book_thum">
                <img src="../../resources/images/bookcover/${book.book_cover}" alt="">               
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
                  <h4>작가</h4>
                  <p id="writer">${book.book_writer}</p>
                </li>
                <li>
                  <h4>판매가</h4>
                  <p id="price">${book.book_price} 원</p>
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
                <div class="num_price_wrap">
                	<span class="book_price" id="book_price"></span>
	                <select name="book_cnt" class="book_num">
	                  <option value="1" selected="selected">1</option>
	                  <option value="2">2</option>
	                  <option value="3">3</option>
	                  <option value="4">4</option>
	                  <option value="5">5</option>
	                </select>               
                </div>            
              </div>
              <!-- (4) 총 금액 -->
              <div class="buy_total">
                <h4 class="buy_total_ttl">총 합계금액</h4>
                <span class="buy_total_price" id="book_total_price"></span>
              </div>
                            
              <input type="hidden" name="user_id" value="${user_id}">
              <input type="hidden" name="book_id" value="${book.book_id}">
              <input type="hidden" name="book_cover" value="${book.book_cover}">
              <input type="hidden" name="book_title" value="${book.book_title}">
              <input type="hidden" name="book_writer" value="${book.book_writer}">
              <input type="hidden" name="book_price" value="${book.book_price}">
              
              <!-- (5) 장바구니 & 구매하기 버튼 -->
              <div class="buy_btns">
                <div class="add_cart"><button type="button" id="addCart" class="addCart">Add to Cart</button></div>
   	 		    <div class="buy_now"><input type="submit" name="direct" class="buyNow" value="Buy Now"/></div>  
   	 		    <!-- 장바구니 추가 모달 --> 	 
   	 		    <div class="cart_modal">
	                <div class="modal_wrap">
	                  <i class="fas fa-times-circle"></i>
	                  <div class="msg_box">
	                    <h5>장바구니에 담겼습니다.</h5>   
	                    <a href="../order/cart"><i class="fas fa-shopping-basket"></i>Go to Cart</a>
	                  </div>
	                </div>
                </div>		
              </div>

            </div>
         </form>
        </article>
        <!-- [2-2] 책 상세페이지 영역 -->
        <article id="book_intro">
          <!-- (1) 책 제목 영역 -->
          <header class="book_intro_header">
            <h3>${book.book_title}</h3>
            <span>${book.book_writer}</span>
          </header>
          <!-- (2) 책줄거리 -->
          <div class="book_story">
            <h4>책소개</h4>
            <pre>
            ${book.book_intro}
            </pre>
          </div>
          <div class="book_contents">
            <h4>목차</h4>
            <pre>
            ${book.book_contents}
            </pre>
          </div>
        </article>
        <!-- [2-3] 책 탭메뉴 영역 -->
        <article id="book_tab_mn">
          <div id="book_tab_box">
            
            <input type="radio" id="tab1" name="tab" checked/>
            <label for="tab1">배송 안내</label>
            
            <input type="radio" id="tab2" name="tab" />
            <label for="tab2">교환 반품</label>
            
            <input type="radio" id="tab3" name="tab" />
            <label for="tab3">책 리뷰</label>

              <!-- 탭 내용 영역 -->
              <section class="delivery">
             	<img src="../../resources/images/tab_delivery.png" alt="">
              </section>
              <section class="change">
               	<img src="../../resources/images/tab_refund.png" alt="">
              </section>
              <!-- **탭메뉴-3**리뷰페이지 -->
              <section class="review">
                <!-- 리뷰 입력 박스 -->
                
                  <div class="write_form">
                    <!-- 리뷰 입력 박스 헤더 -->
                    <header class="form_ttl">
                      <!-- 책 사진 -->
                      <div class="book_img">
                        <img src="../../resources/images/bookcover/${book.book_cover}" alt="">
                      </div>
                      <!-- 책 요약 -->
                      <ul class="book_info">
                        <li><p class="ttl">${book.book_title}</p></li>
                        <li><span class="writer">${book.book_writer}</span></li>
                        <li><span class="pub">${book.book_pub}</span></li>
                      </ul>
                      <!-- 리뷰 title -->
                      <div class="review_msg">
                        <h3>이 책 어떠셨나요?</h3>
                        <div class="review_score star-rating">
                          <input type="radio" id="5-stars" name="rating" value="5" v-model="ratings" checked/>
                          <label for="5-stars" class="fas fa-star"></label>
                          <input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
                          <label for="4-stars" class="fas fa-star"></label>
                          <input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
                          <label for="3-stars" class="fas fa-star"></label>
                          <input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
                          <label for="2-stars" class="fas fa-star"></label>
                          <input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
                          <label for="1-star" class="fas fa-star"></label>
                        </div>
                      </div>
                    </header>
                    <!-- 리뷰 입력칸 및 리뷰 등록 버튼 -->
                    <c:if test="${not empty user_id}">
                    <input type="textarea" name="write_review" id="write_review_box" placeholder="로그인 후 리뷰등록 가능합니다." />
                    <button type="button" id="upload_review">리뷰 등록하기</button>
                    </c:if>
                    <c:if test="${empty user_id}">
                    <input type="textarea" name="write_review" id="write_review_box" placeholder="로그인 후 리뷰등록 가능합니다." readonly />
                    <button type="button" id="upload_review" disabled>리뷰 등록하기</button>
                    </c:if>
                  </div>
               
                <!-- 등록된 리뷰수, 평점 평균 -->
                <div class="review_status">
                </div>
                <!-- 등록된 리뷰 리스트 3개씩  -->
                <div class="review_list">
                </div>
                <!-- 페이징처리 -->
                <div class="pagebox">
                 <ul class="pagenum_wrap">
                     <li><a href="" id="prev" class="prev">&nbsp;prev</a></li>
                     <li><a href="" id="next" class="next">next&nbsp;</a></li>
                 </ul>
                </div>
                <!-- 빈공간 -->
                <div class="blank"></div>
              </section>             
          </div>         
        </article>              
      </section>    
      <!-- 문의버튼 -->
      <a href="${path}/ask/writeAsk?book_id=${book.book_id}" class="ask_btn">
        <i class="fas fa-book"></i>
        <p>1 : 1<br />문의</p>
      </a>   
    </div>
    
    <script>
	$(document).ready(function(){
		var msg = '${msg}';
		if(msg != null && msg != '') alert(msg);
	});
	</script>
  </body>
</html>
