<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>[관리자 페이지] 주문 관리</title>
    <link rel="stylesheet" href="${path}/resources/css/reset.css" />
    <link rel="stylesheet" href="${path}/resources/css/mainNav.css" />
    <link rel="stylesheet" href="${path}/resources/css/admin_order.css" />
  	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  	
  	<script>
  	$(document).ready(function() {

  		$('#startBtn').click(function() {
  			$.ajax({
  				type : "GET",
  				url : "./start",
  				data : {
  					// 수정 필요
  					order_num : order_num
  				},
  				dataType : "text",
  				success : function(data) {
  					if (data != null) {
  						$('#status_' + data).text("배송중");
  					}
  					else {
  						alert('배송중 변경에 실패하였습니다');
  					}
  				},
  				error : function(data) {
  					
  				}
  			});
  		});
  		
  		$('#endBtn').click(function() {
  			$.ajax({
  				type : "GET",
  				url : "./end",
  				data : {
  					order_num : order_num
  				},
  				dataType : "text",
  				success : function(data) {
  					if (data != null) {
  						$('#status_' + data).text("배송완료");
  					}
  					else {
  						alert('배송완료 변경에 실패하였습니다');
  					}
  				},
  				error : function(data) {
  					
  				}
  			});
  		});
  		
  	});
    </script>
    
  </head>
  <body>
    <div id="wrap">
      <jsp:include page="../mainNav.jsp"/>
      <section>
        <div id="section">
          <div id="sidebar">
            <p id="nav_title">Administrator</p>
            <a href="${path}/admin/order" class="active">주문 관리</a>
            <a href="${path}/admin/product">상품 관리</a>
            <a href="${path}/admin/ask">문의 관리</a>
          </div>
          <div id="container">
            <div id="order_info">
              <span class="title">현재 주문 상황</span>
              <table>
                  <tr>
                      <th>입금전</th>
                      <th>배송중</th>
                      <th>배송완료</th>
                  </tr>
                  <tr>
                      <td>${before}건</td>
                      <td>${start}건</td>
                      <td>${end}건</td>
                  </tr>
              </table>
            </div>
            <div id="order_info_list">
              <div>
                <span class="title">주문목록 / 배송조회 내역 총 ${tot} 건</span>
                <div class="func_btns">
                  <button class="btn" id="startBtn">배송중 처리</button>
                  <button class="btn" id="endBtn">배송완료 처리</button>
                </div>
              </div>
              <table id="table">
                <tr>
                  <th><input type="checkbox"></th>
                  <th>주문번호</th>
                  <th>주문자</th>
                  <th>상품ID</th>
                  <th>상품명</th>
                  <th>상품금액/수량</th>
                  <th>처리상태</th>
                </tr>
                <c:forEach var="item" items="${list}">
                <tr>
                  <td><input type="checkbox"></td>
                  <td>${item.order_num}</td>
                  <td>${item.user_id}</td>
                  <td>${item.book_id}</td>
                  <td>${item.book_title} | ${item.book_writer}</td>
                  <td>${item.book_price}원 / ${item.book_cnt}개</td>
                  <td id="status_${item.order_num}">${item.order_status}</td>
                </tr>
                </c:forEach>
              </table>
            </div>
          </div>
        </div>
      </section>
    </div>
  </body>
</html>