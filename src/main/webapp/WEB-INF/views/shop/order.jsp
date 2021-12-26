<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>주문 페이지</title>
    <link rel="stylesheet" href="${path}/resources/css/reset.css" />
    <link rel="stylesheet" href="${path}/resources/css/order.css" />
    <link rel="stylesheet" href="${path}/resources/css/mainNav.css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <%-- 카카오 주소검색 API --%>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${path }/resources/js/mainjs/kakao.js" charset="UTF-8"></script>
    <!-- 결제 api -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
    $(document).ready(function() {
    	
    	// 결제 전 입력 공란 검증
        $('#pay_btn').click(function() {
            if ($('#recipient').val() == '') {
            	alert('받으시는 분 이름을 적어주세요');
            } else if (($('#addr1').val() == '' && $('#addr2').val() == '' && $('#addr3').val() == '') || $('#addr4').val() == '') {
            	alert('받으시는 분 주소를 적어주세요');
            } else if ($('#r_phone_num').val() == '') {
            	alert('받으시는 분 연락처를 적어주세요');
            } else if (!$('#order_agree').prop('checked')) {
            	alert('약관에 동의해주세요');
            } else {
          	  requestPay();
            }
        });
    	
    	$('input.chk_box').click(function() {
    		if ($('input.chk_box:checked').length == 0) {
    			$('input[type=checkbox]').prop('checked', false);
    		} else {
    			$('input[type=checkbox]').prop('checked', true);  			
    		}
    	});
    	
    	// 포인트 변화 기능
    	var point = 0;
		$('#point_use').on("keyup change", function() {
			point = parseInt($('#point_use').val());
			if ($('#point_use').val() == '') {
				point = 0;
			}
			if (point > ${user.user_point}) {
				point = parseInt(point/10);
				$('#point_use').val(point);
			}
			$('.book_price_tot_pt').text(parseInt($('#book_price_tot').text()) - point + '원');
		});
		$('#all_point').click(function() {
			if ($(this).is(":checked")) {
				point = ${user.user_point};
			} else {
				point = 0;
			}
			$('#point_use').val(point);
			$('.book_price_tot_pt').text(parseInt($('#book_price_tot').text()) - point + '원');
		});
		// 수량 변화에 따른 가격 변경 기능
    	// 바로 주문 시
    	<c:if test="${not empty direct}">
    	var price = parseInt($('#price_${direct.book_id}').text());
    	var shippingCost = 3000;
    	$('.book_price').text(${direct.book_price * direct.book_cnt} + '원');
    	$('.point').text('적립예정 포인트 : ' + ${direct.book_price * direct.book_cnt * 0.05} + '원');
    	if (${direct.book_price * direct.book_cnt >= 20000}) {
    		$('#shippingCost').text('0원');
    		$('.shippingCostTbl').text('무료배송');
    		shippingCost = 0;
    	} else {
    		$('#shippingCost').text('3000원');
    		$('.shippingCostTbl').text('3000원');
    		shippingCost = 3000;
    	}
    	$('#book_price_tot').text(${direct.book_price * direct.book_cnt} + shippingCost + '원');
    	$('.book_price_tot_pt').text(parseInt($('#book_price_tot').text()) - point + '원')
    	$('#book_cnt_${direct.book_id}').change(function() {
    		var cnt = parseInt($('#book_cnt_${direct.book_id}').val());
    		$('#book_price_${direct.book_id}').text(price * cnt + '원');
    		$('.book_price').text(price * cnt + '원');
    		$('.point').text('적립예정 포인트 : ' + price * cnt * 0.05 + '원');
    		if (price * cnt >= 20000) {
    			$('.shippingCostTbl').text('무료배송');
    			$('#shippingCost').text('0원');
    			shippingCost = 0;
    		} else {
    			$('.shippingCostTbl').text('3000원');
    			$('#shippingCost').text('3000원');
    			shippingCost = 3000;
    		}
    		$('#book_price_tot').text(price * cnt + shippingCost + '원');
    		$('.book_price_tot_pt').text(parseInt($('#book_price_tot').text()) - point + '원');
    	});
    	</c:if>
    	// 전체 상품 주문 시
    	<c:if test="${not empty allList}">
    	var book_price = 0;
    	var shippingCost = 3000;
    	<c:forEach var="all" items="${allList}">
    	book_price += ${all.book_price * all.book_cnt};
    	$('.book_price').text(book_price + '원');
    	$('#book_cnt_${all.book_id}').change(function() { 
    		$('#book_price_${all.book_id}').text(parseInt($('#price_${all.book_id}').text()) * parseInt($('#book_cnt_${all.book_id}').val()) + '원');
    		book_price = 0;
    		<c:forEach var="all" items="${allList}">
    		book_price += parseInt($('#price_${all.book_id}').text()) * parseInt($('#book_cnt_${all.book_id}').val());
    		</c:forEach>
    		$('.book_price').text(book_price + '원');
    		if (book_price >= 20000) {
    			shippingCost = 0;
    			$('.shippingCostTbl').text('무료배송');
    		} else {
    			shippingCost = 3000;
    			$('.shippingCostTbl').text('3000원');
    		}
    		$('#book_price_tot').text(book_price + shippingCost + '원');
    		$('.point').text('적립예정 포인트 : ' + book_price * 0.05 + '원');
    		$('.book_price_tot_pt').text(parseInt($('#book_price_tot').text()) - point + '원');
    	});
    	</c:forEach>
    	if (book_price >= 20000) {
    		shippingCost = 0;
    		$('#shippingCost').text('0원');
    		$('tr.row_style').filter(':first').append('<td class="shippingCostTbl" rowspan="${fn:length(allList)}" style="border-left: 0.5px solid #707070; vertical-align: middle;"></td>');
    		$('.shippingCostTbl').text('무료배송');
    	} else {
    		shippingCost = 3000;
    		$('#shippingCost').text('3000원');
    		$('tr.row_style').filter(':first').append('<td class="shippingCostTbl" rowspan="${fn:length(allList)}" style="border-left: 0.5px solid #707070; vertical-align: middle;"></td>');
    		$('.shippingCostTbl').text('3000원');
    	}
    	$('#book_price_tot').text(book_price + shippingCost + '원');
    	$('.point').text('적립예정 포인트 : ' + book_price * 0.05 + '원');
    	$('.book_price_tot_pt').text(parseInt($('#book_price_tot').text()) - point + '원');
    	</c:if>
    	// 선택 상품 주문 시
    	<c:if test="${not empty selectList}">
    	var book_price = 0;
    	var shippingCost = 3000;
    	<c:forEach var="select" items="${selectList}">
    	book_price += ${select.book_price * select.book_cnt};
    	$('.book_price').text(book_price + '원');
    	$('#book_cnt_${select.book_id}').change(function() { 
    		$('#book_price_${select.book_id}').text(parseInt($('#price_${select.book_id}').text()) * parseInt($('#book_cnt_${select.book_id}').val()) + '원');
    		book_price = 0;
    		<c:forEach var="select" items="${selectList}">
    		book_price += parseInt($('#price_${select.book_id}').text()) * parseInt($('#book_cnt_${select.book_id}').val());
    		</c:forEach>
    		$('.book_price').text(book_price + '원');
    		if (book_price >= 20000) {
    			shippingCost = 0;
    			$('.shippingCostTbl').text('무료배송');
    			$('#shippingCost').text('0원');
    		} else {
    			shippingCost = 3000;
    			$('.shippingCostTbl').text('3000원');
    			$('#shippingCost').text('3000원');
    		}
    		$('#book_price_tot').text(book_price + shippingCost + '원');
    		$('.point').text('적립예정 포인트 : ' + book_price * 0.05 + '원');
    		$('.book_price_tot_pt').text(parseInt($('#book_price_tot').text()) - point + '원');
    	});
    	</c:forEach>
    	if (book_price >= 20000) {
    		shippingCost = 0;
    		$('#shippingCost').text('0원');
    		$('tr.row_style').filter(':first').append('<td class="shippingCostTbl" rowspan="${fn:length(allList)}" style="border-left: 0.5px solid #707070; vertical-align: middle;"></td>');
    		$('.shippingCostTbl').text('무료배송');
    	} else {
    		shippingCost = 3000;
    		$('#shippingCost').text('3000원');
    		$('tr.row_style').filter(':first').append('<td class="shippingCostTbl" rowspan="${fn:length(allList)}" style="border-left: 0.5px solid #707070; vertical-align: middle;"></td>');
    		$('.shippingCostTbl').text('3000원');
    	}
    	$('#book_price_tot').text(book_price + shippingCost + '원');
    	$('.point').text('적립예정 포인트 : ' + book_price * 0.05 + '원');
    	$('.book_price_tot_pt').text(parseInt($('#book_price_tot').text()) - point + '원');
    	</c:if>
    	
    	// 주문자 정보 체크 시 정보 처리
    	$('input[type=radio][name=delivery]').change(function() {
    		if (this.value == 'direct') { 				// 직접 입력 체크
    			$('#recipient').val('');
    			$('#recipient').attr('readonly', false);
    			$('#r_phone_num').val('');
    			$('#r_phone_num').attr('readonly', false);
    			var str = '';
    			str += '<div class="row_3" id="addr">';
    			str += '<label>*&nbsp;받으실 곳</label>';
    			str += '<button class="find_post">우편번호 검색</button>';
    			str += '<input type="text" id="addr_1" name="addr_1" readonly>';
    			str += '<input type="text" id="addr_2" name="addr_2" readonly>';
    			str += '<input type="text" id="addr_3" name="addr_3" placeholder="상세주소 입력">';
    			str += '</div>';
    			$('#addr').replaceWith(str);	
    		} else if (this.value == 'indirect') {		// 주문자 정보 동일 체크
    			$('#recipient').val('${user.user_name}');
    			$('#recipient').attr('readonly', true);
    			$('#r_phone_num').val('${user.user_phone}');
    			$('#r_phone_num').attr('readonly', true);
    			var str = '';
    			str += '<div class="row" id="addr">';
    			str += '<label>*&nbsp;받으실 곳</label>';
    			str += '<input type="text" id="addr4" value="${user.user_addr}" readonly>';
    			str += '</div>';
    			$('#addr').replaceWith(str);	
    		}
    	});
    });
    
    var name = '';
    <c:if test="${not empty direct}">
    name = '${direct.book_title}';
    </c:if>
    <c:if test="${not empty allList}">
    name = '${allList[0].book_title}';
    <c:if test="${fn:length(allList) >= 2}">
    name = '${allList[0].book_title} 외 ${fn:length(allList) - 1}';
    </c:if>
    </c:if>    
    <c:if test="${not empty selectList}">
    name = '${selectList[0].book_title}';
    <c:if test="${fn:length(selectList) >= 2}">
    name = '${selectList[0].book_title} 외 ${fn:length(selectList) - 1}';
    </c:if>
    </c:if>
    // 결제 api
	var IMP = window.IMP;
	IMP.init("imp21304345");
	function requestPay() {
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "html5_inicis",
          pay_method: "card",
          merchant_uid: "${orderNum}",							// 주문 아이디
          name: name,											// 상품 이름
          amount: parseInt($('.book_price_tot_pt').text()),		// 결제 가격
          buyer_email: "${user.user_email}",					// 구매자 이메일
          buyer_name: "${user.user_name}",						// 구매자 이름
          buyer_tel: "${user.user_phone}"						// 구매자 연락처
      }, function (rsp) {
          if (rsp.success) {
        	  var point_use = $('#point_use').val();
	       	  if (point_use == '') {
	       		  point_use = 0;
	       	  }
	       	  var book_id = [];
	       	  $('input[type=hidden]').each(function() {
	       	      book_id.push($(this).val());
	       	  });
	       	  if (book_id.length == 0) {
	       		  book_id = ["none"];
	       	  }
	       	  var book_cnt = [];
	       	  $('select').each(function() {
	       	      book_cnt.push($(this).val());
	       	  });
	       	  if (book_cnt.length == 0) {
	       		  book_cnt = [0];
	       	  }
        	  $.ajax({
        		  url: "./paid",
            	  method: "POST",
            	  data: {
            		  imp_uid: rsp.imp_uid,
                	  merchant_uid: rsp.merchant_uid,
                	  order_num: "${orderNum}",
                	  user_id: "${user_id}",
                	  order_name: $('#recipient').val(),
                	  order_addr: $('#addr_1').val() + '_' + $('#addr_2').val() + '_' + $('#addr_3').val(),
                	  order_phone: $('#r_phone_num').val(),
                	  order_tot: parseInt($('#book_price').text()),
                	  ship_cost: parseInt($('#shippingCost').text()),
                	  final_cost: parseInt($('.book_price_tot_pt').text()),
                	  comments: $('#r_comments').val(),
                	  point_use: parseInt(point_use),
                	  point_add: parseInt($('span.point').text().replace(/[^0-9]/g, '')),
                	  book_id: book_id,
                	  book_cnt: book_cnt
            	  },
            	  traditional : true,
            	  success : function(data) {
            		  if (data == 1) {
            			  location.href = "./orderSuccess";
            			  alert('성공'); 			// 성공 시 orderSuccess로 이동
            		  } else if (data == 0) {
            			  alert('실패');			// 실패 시 알림
            		  } else if (data == -1) {
            			  alert('주문한 상품이 없습니다');
            		  }         		  
            	  },
            	  error : function(data) {
            		  alert('ajax오류');
            	  }
              });
          } else {
        	  alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
          }
      });
      
	};
   
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
            <h2>ORDER</h2>
            <div class="process">
                <img src="../resources/images/process_step2.png" alt="">
            </div>
        </header>
        <!-- [2-2] 주문상세내역 -->
        <article id="order_detail">
            <!-- 소제목 -->
            <div class="ttl">
                <img src="../resources/images/order_ttl_icon.png" alt="">
                <h3>주문상세내역</h3>
            </div>
            <!-- [2-2-1] 주문 상세내역 표 -->
            <div class="container">
              <table>
                <thead>
                  <tr>
                    <th width="0"><!--book_id--></th>
                    <th width="43%">상품/옵션 정보</th>
                    <th width="10%">수량</th>
                    <th width="11%">금액</th>
                    <th width="11%">할인/적립</th>
                    <th width="12%">합계금액</th>
                    <th width="11%" class="delivery_fee">배송비</th>
                </tr>
                </thead>
                <tbody>
                
                <!-- 바로 주문하기 -->
                <c:if test="${not empty direct}">
                  <tr class="row_style">
                    <td class="hidden_col"><input type="hidden" value="${direct.book_id}"></td>
                    <td class="book_name" style="text-align: left;">
                    	<div class="img_box">
                        	<img src="../resources/images/bookcover/${direct.book_cover}" alt="">
                        </div>
                        <div class="ttl_writer_wrap">
                        	<p>${direct.book_title}&nbsp;|&nbsp;${direct.book_writer}</p>
                        </div>
                    </td>
                    <td> 
                      <select name="book_num" class="book_num" id="book_cnt_${direct.book_id}">
                      <c:forEach var="i" begin="1" end="5">
	                  <c:if test="${i eq direct.book_cnt}">
	                    <option value="${i}" selected>${i}</option>
	                  </c:if>
	                  <c:if test="${i ne direct.book_cnt}">
	                    <option value="${i}">${i}</option>
	                  </c:if>
	                  </c:forEach>
                      </select>
                    </td>
                    <td id="price_${direct.book_id}">${direct.book_price}원</td>
                    <td>5% 적립</td>
                    <td id="book_price_${direct.book_id}">${direct.book_price * direct.book_cnt}원</td>
                    <td class="shippingCostTbl" rowspan="1" style="border-left: 0.5px solid #707070;"></td>
                  </tr>
                </c:if>
                
                <!-- 전체 주문하기 -->
                <c:if test="${not empty allList}">
                <c:forEach var="all" items="${allList}">
                  <tr class="row_style">
                    <td>
                      <input type="checkbox" name="order_check">
                    </td>
                    <td class="hidden_col"><input type="hidden" value="${all.book_id}"></td>
                    <td class="book_name" style="text-align: left;">
                    	<div class="img_box">
                        	<img src="../resources/images/bookcover/${all.book_cover}" alt="">
                        </div>
                        <div class="ttl_writer_wrap">
                        	<p>${all.book_title}&nbsp;|&nbsp;${all.book_writer}</p>
                        </div>
                    </td>
                    <td> 
                      <select name="book_num" class="book_num" id="book_cnt_${all.book_id}">
                      <c:forEach var="i" begin="1" end="5">
	                  <c:if test="${i eq all.book_cnt}">
	                    <option value="${i}" selected>${i}</option>
	                  </c:if>
	                  <c:if test="${i ne all.book_cnt}">
	                    <option value="${i}">${i}</option>
	                  </c:if>
	                  </c:forEach>
                      </select>
                    </td>
                    <td id="price_${all.book_id}">${all.book_price}원</td>
                    <td>5% 적립</td>
                    <td id="book_price_${all.book_id}">${all.book_price * all.book_cnt}원</td>
                    
                  </tr>
                </c:forEach>
                </c:if>
                
                <!-- 선택 주문하기 -->
                <c:if test="${not empty selectList}">
                <c:forEach var="select" items="${selectList}">
                  <tr class="row_style">
                    <td>
                      <input type="checkbox" name="order_check">
                    </td>
                    <td class="hidden_col"><input type="hidden" value="${select.book_id}"></td>
                    <td class="book_name" style="text-align: left;">
                    	<div class="img_box">
                        	<img src="../resources/images/bookcover/${select.book_cover}" alt="">
                        </div>
                        <div class="ttl_writer_wrap">
                        	<p>${select.book_title}&nbsp;|&nbsp;${select.book_writer}</p>
                        </div>
                    </td>
                    <td> 
                      <select name="book_num" class="book_num" id="book_cnt_${select.book_id}">
                      <c:forEach var="i" begin="1" end="5">
	                  <c:if test="${i eq select.book_cnt}">
	                    <option value="${i}" selected>${i}</option>
	                  </c:if>
	                  <c:if test="${i ne select.book_cnt}">
	                    <option value="${i}">${i}</option>
	                  </c:if>
	                  </c:forEach>
                      </select>
                    </td>
                    <td id="price_${select.book_id}">${select.book_price}원</td>
                    <td>5% 적립</td>
                    <td id="book_price_${select.book_id}">${select.book_price * select.book_cnt}원</td>
                  </tr>
                </c:forEach>
                </c:if>
                
                </tbody>
              </table>
              <!-- [2-2-2] 장바구니 돌아가기 버튼 -->
              <a href="${path}/order/cart" class="go_back">장바구니 가기</a>
               <!-- [2-2-3] 주문 합계-->
               <div class="order_check_wrap">
                <div class="order_tot">
                    <ul>
                        <li>
                        	<c:if test="${not empty direct}">
                        	<h4>총 1개의 상품</h4>
                        	</c:if>
                        	<c:if test="${not empty allList}">
                        	<h4>총 ${fn:length(allList)}개의 상품</h4>
                        	</c:if>
                        	<c:if test="${not empty selectList}">
                        	<h4>총 ${fn:length(selectList)}개의 상품</h4>
                        	</c:if>
                            <span class="book_price"></span>
                        </li>
                        <li class="plus">
                          <img src="../resources/images/cart_plus.png" alt="">
                        </li>
                        <li>
                          <h4>배송비</h4>
                          <span id="shippingCost"></span>
                      </li>
                      <li class="equal">
                        <img src="../resources/images/cart_equal.png" alt="">
                      </li>
                      <li>
                          <h4>총 주문금액</h4>
                          <span id="book_price_tot"></span>
                      </li>
                      
                    </ul>
                    <p class="point"></p>
                </div>               
              </div>
            </div>
        </article>
        <!-- [2-3] 주문자 정보 -->
        <article id="order_user_info">
          <div class="container">
            <!-- 소제목 -->
            <div class="ttl">
              <img src="../resources/images/order_ttl_icon.png" alt=""/>
               <h3>주문자 정보</h3>
               <h6>* 필수 입력 사항입니다.</h6>
            </div>
            <!-- 입력 폼 -->
            <div class="row">
              <label for="user_name">*&nbsp;주문하시는 분</label>
              <input type="text" id="user_name" name="user_name" value="${user.user_name}" readonly>
            </div>
            <div class="row">
              <label for="phone_num">*&nbsp;휴대폰번호</label>
              <input type="text" id="phone_num" name="phone_num" value="${user.user_phone}" readonly>
            </div>
          </div>
          
        </article>
        <!-- [2-4] 배송 정보 -->
        <article id="order_delivery_info">
          <div class="container">
            <!-- 소제목 -->
            <div class="ttl">
              <img src="../resources/images/order_ttl_icon.png" alt="">
               <h3>배송정보</h3>
            </div>
            <!-- 입력 폼 -->
            <div class="delivery_row">
              <h2 for="user_name">*&nbsp;배송지</h2>
              <input type="radio" name="delivery" value="direct" id="direct" checked>
              <label style="font-family: 'Pretendard-Regular'; font-size: 15px;"class="direct_lb" for="direct">직접 입력</label>
              <input type="radio" name="delivery" value="indirect">
              <label class="indirect_lb" for="indirect">주문자 정보와 동일</label>
            </div>
            <div class="row">
              <label for="recipient">*&nbsp;받으실 분</label>
              <input type="text" id="recipient" name="recipient">
            </div>
            <div class="row_3" id="addr">
              <label>*&nbsp;받으실 곳</label>
              <div class="wrap">
                    <div class="wrap2">
                        <input type="text" id="addr_1" name="addr_1" readonly="true" />  
                        <input type="button" id="findPost" onclick="DaumPostcode()" value="우편번호 검색" />
                    </div>   
                    <!-- <button type="button">우편번호 검색</button>  -->
                    <input type="text" id="addr_2" name="addr_2" readonly="true" />              
                    <input type="text" id="addr_3" name="addr_3"/>
               </div>  
            </div>
            <div class="row">
              <label for="r_phone_num">*&nbsp;휴대폰번호</label>
              <input type="text" id="r_phone_num" name="r_phone_num" placeholder="- 없이 입력하세요." >
            </div>
            <div class="row">
              <label for="r_phone_num">&nbsp;&nbsp;남기실 말씀</label>
              <input type="text" id="r_comments" name="r_comments" >
            </div>
          </div>
        </article>
        <!-- [2-5] 결제 정보 -->    
        <article id="order_payment_info">
          <div class="container">
            <!-- 소제목 -->
            <div class="ttl">
              <img src="../resources/images/order_ttl_icon.png" alt="">
               <h3>결제 정보</h3>
            </div>
            <!-- 입력 폼 -->
            <div class="row">
              <label for="r_phone_num">&nbsp;&nbsp;상품 합계금액</label>
              <span class="book_price" id="book_price"></span>
            </div>
            <div class="row">
              <label for="r_phone_num">&nbsp;&nbsp;배송비</label>
              <span class="shippingCostTbl"></span>
            </div>
            <div class="row">
              <label for="r_phone_num">&nbsp;&nbsp;할인 및 적립</label>
              <span class="point"></span>
            </div>
            <div class="row">
              <label for="point">&nbsp;&nbsp;포인트 사용</label>
              <input type="number" max="${user.user_point}" step="50" id="point_use" name="point" >
              <input type="checkbox" id="all_point" name="all_point">
              <label for="all_point">전액 사용(보유 포인트: ${user.user_point}원)</label>
            </div>
            <div class="row">
              <label for="r_phone_num">&nbsp;&nbsp;최종 결제 금액</label>
              <span class="book_price_tot_pt"></span>
            </div>
          </div>
        </article>
        <!-- [2-6] 결제 수단 -->
        <article id="order_pay_method">
          <div class="container">
            <!-- 소제목 -->
            <div class="ttl">
              <img src="../resources/images/order_ttl_icon.png" alt="">
               <h3>결제수단</h3>
            </div>
            <!-- 입력 폼 -->
            <div class="pay_row">
              <h2 for="r_phone_num">&nbsp;&nbsp;일반 결제</h2>
              <input type="radio" id="pay_option" checked />
              <label for="pay_option">카드결제</label>
            </div>
           <!--  <div class="row">
              <label for="r_phone_num">&nbsp;&nbsp;무통장 입금</label>
              <input type="text" id="r_phone_num" name="r_phone_num" placeholder="- 없이 입력하세요." >
            </div> -->
          </div>
        </article>
        <!-- 최종 결제 안내 -->
        <article id="order_agree_wrap">
          <div class="order_price_sum">
            <span>최종 결제 금액&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>
            <span class="book_price_tot_pt"></span>
          </div>
          <div class="agree_chk">
            <input type="checkbox" id="order_agree" name="order_agree">
            <label for="order_agree"><span>[필수]</span>구매하실 상품의 결제정보를 확인하였으며, 구매진행에 동의합니다.</label>
          </div>
          <!-- 결제버튼 -->
		  <!-- <input type="submit" name="order_set" id="order_set" value="결제하기"> -->

 		  <button type="button" class="pay_btn" id="pay_btn">결제하기</button>

        </article>
      </section>
    </div>
  </body>
</html>