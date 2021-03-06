<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="length" value="${fn:length(list)}"/>
<c:set var="list" value="${list}"/>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>장바구니</title>
    <link rel="stylesheet" href="${path}/resources/css/reset.css" />
    <link rel="stylesheet" href="${path}/resources/css/book_cart.css" />
    <link rel="stylesheet" href="${path }/resources/css/mainNav.css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    
    <script>
    $(document).ready(function() {
    	
    	if ("${length}" == 0) {
    		$('button[name=all]').attr('disabled', true);
    	}
    	
   		$('input[type=checkbox]').click(function() {
       		if ($('input[type=checkbox]:checked').length > 0) {
       			$('button[name=select]').attr('disabled', false);
       		}
	   		if ($('.chk_box:checked') && $('input[type=checkbox]:checked').length == 1) {
	   			$('button[name=select]').attr('disabled', true);
	   		}
       	})
    	
    	$('input.chk_box').click(function() {
    		if ($('input.chk_box:checked').length == 0) {
    			$('input[type=checkbox]').prop('checked', false);
    		} else {
    			$('input[type=checkbox]').prop('checked', true);  			
    		}
    	});
    	
    	$('#deleteBtn').click(function() {
    		var book_id = [];
    		$('input[type=checkbox]:checked').each(function(i){//체크된 리스트 저장
                book_id.push($(this).val());
            });
    		if (book_id.length == 0) {
    			book_id = ["none"];
    		}
    		$.ajax({
				type : "POST",
				url : "./deleteCart",
				data : {
					book_id : book_id,
					user_id : "${user_id}"
				},
				traditional : true,
				dataType : "json",
				success : function(data){
					if (data == 0) {
						location.reload();
					} else if (data == -1) {
						alert('선택된 상품이 없습니다');
					}
				},
				error : function(data) {
					
				}
			});
    	})
    	
    	var book_price = 0;
    	var shippingCost = 3000;
    	<c:forEach items="${list}" var="item">
    		var price = parseInt("${item['book_price']}");
    		var book_id = "${item['book_id']}";
    		var book_cnt = parseInt($('#book_cnt_' + ${item['book_id']}).val());
    		$('#book_price_' + ${item['book_id']}).text(price * book_cnt + '원');
    		book_price = book_price + parseInt($('#book_price_' + ${item['book_id']}).text());
    		$('#book_cnt_' + ${item['book_id']}).change(function() {
    			book_price = book_price - parseInt($('#book_price_' + ${item['book_id']}).text());
    			var price = parseInt($('#price_' + ${item['book_id']}).text());
    			var book_cnt = parseInt($('#book_cnt_' + ${item['book_id']}).val());
        		$('#book_price_' + ${item['book_id']}).text(price * book_cnt + '원');
        		book_price = book_price + parseInt($('#book_price_' + ${item['book_id']}).text());
        		$('#book_price').text(book_price + '원');
        		$('#book_total_price').text(parseInt($('#book_price').text()) + shippingCost + '원');
            	$('#point').text('적립예정 포인트 : ' + parseInt($('#book_price').text()) * 0.05 + '원');
    		});
    	</c:forEach>
    	$('#book_price').text(book_price + '원');
    	if (book_price >= 20000) {
    		shippingCost = 0;
    		$('tbody tr:first-child').append('<td rowspan="${length}" style="border-left: 0.5px solid #707070; vertical-align: middle;">무료배송</td>')
    		$('#shippingCost').append('0원');
    	} else {
    		$('tbody tr:first-child').append('<td rowspan="${length}" style="border-left: 0.5px solid #707070; vertical-align: middle;">3000원</td>')
    		$('#shippingCost').append('3000원');
    	}
    	$('#book_total_price').text(parseInt($('#book_price').text()) + shippingCost + '원');
    	$('#point').text('적립예정 포인트 : ' + parseInt($('#book_price').text()) * 0.05 + '원');
    });
    </script>
    
  </head>
  <body>
    <div id="wrap">
       <!-- [1] 네비게이션 -->
      <jsp:include page="../mainNav.jsp"/>
      <!-- [2] 메인화면 -->
      <section id="book_order">
        <!-- [2-1] 제목 -->
        <header class="order_ttl">
            <h2>CART</h2>
            <div class="process">
               <div class="process_wrap">
                 <!-- 원아이콘 -->
                 <ul class="circle">
                   <li class="now"></li>
                   <li></li>
                   <li></li>
                 </ul>
                 <ul class="pro_name">
                   <li class="now">STEP 1 | 장바구니</li>
                   <li>STEP 2 | 주문서 작성 & 결제</li>
                   <li>STEP 3 | 주문완료</li>
                 </ul>
               </div>
            </div>
        </header>
        <!-- [2-2] 주문상세내역 -->
        <article id="order_detail">
          <!-- 소제목(빈공간) -->
          <div class="ttl"></div>
          <!-- 주문 상세내역 표 -->
          <form action="/order/" method="POST">
            <div class="container">
              <table>
                <thead>
                  <tr>
                    <th width="5%"><input type="checkbox" class="chk_box"></th>
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
                  <c:forEach var="item" items="${list}">
                  <tr class="row_style">
                    <td>
                      <input type="checkbox" name="checked_book_id" value="${item.book_id}">
                    </td>
                    <td class="hidden_col"><input type="hidden" name="book_id" value="${item.book_id}"></td>
                    <td class="book_name" style="text-align: left;">
                    	<div class="img_box">
                      		<img src="../../resources/images/bookcover/${item.book_cover}" alt="book_cover">
                      	</div>
                      	<div class="ttl_writer_wrap">
                      		<p>${item.book_title}&nbsp;|&nbsp;${item.book_writer}</p>
                      	</div>
                    </td>
                    <td> 
	                  <select name="book_cnt" class="book_num" id="book_cnt_${item.book_id}">
	                    <c:forEach var="i" begin="1" end="5">
	                   	  <c:if test="${i eq item.book_cnt}">
	                   	    <option value="${i}" selected>${i}</option>
	                   	  </c:if>
	                   	  <c:if test="${i ne item.book_cnt}">
	                      	<option value="${i}">${i}</option>
	                      </c:if>
	                    </c:forEach>
	                  </select>
                    </td>
                    <td id="price_${item.book_id}">${item.book_price}</td>
                    <td>5% 적립</td>
                    <td id="book_price_${item.book_id}"></td> 
                  </tr>
                  </c:forEach>
                </tbody>
              </table>
               <!-- [2-3] 선택상품 삭제 -->
              <button type="button" class="chk_delete" id="deleteBtn">
              	<h4>선택 상품 삭제</h4>
              </button>
              <!-- [2-4] 장바구니 합계 (주문 넘기기전 상태) -->
              <div class="order_prev_check_wrap">
                <div class="cart_tot">
                    <ul>
                        <li>
                            <h4>총 ${length}개의 상품</h4>
                            <span id="book_price"></span>
                        </li>
                        <li class="plus">
                          <img src="../../resources/images/cart_plus.png" alt="">
                        </li>
                        <li>
                          <h4>배송비</h4>
                          <span id="shippingCost"></span>
                      </li>
                      <li class="equal">
                        <img src="../../resources/images/cart_equal.png" alt="">
                      </li>
                      <li>
                          <h4>총 주문금액</h4>
                          <span id="book_total_price"></span>
                      </li>
                      
                    </ul>
                    <p id="point"></p>
                </div>
                <!-- [2-5] 주문 버튼 -->
                <ul class="order_btns_wrap">
                    <li class="chk_only"><button name="select" disabled>
                     <h4>선택 상품 주문</h4>
                    </button></li>
                    <li class="all"><button name="all">
                     <h4>전체 상품 주문</h4>
                    </button></li>
                </ul>
              </div>
              
            </div>
          </form>
        </article>
      </section>
    </div>
    

  </body>
</html>
