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
  			
  			<c:forEach var="item1" items="${map.listUnited}">
  				var str1 = '';
  				str1 += '<td rowspan="${item1.cnt}"><input type="checkbox" name="order_num" value="${item1.order_num}"></td>';
  				str1 += '<td rowspan="${item1.cnt}">${item1.order_num}</td>';
  				str1 += '<td rowspan="${item1.cnt}">${item1.user_id}</td>';
  				$('.${item1.order_num}').filter(':first').prepend(str1);
  				var str2 = '';
  				str2 += '<td rowspan="${item1.cnt}">${item1.order_status}</td>';
  				$('.${item1.order_num}').filter(':first').append(str2);
  			</c:forEach>
  			
  		});
  	</script>
  </head>
  <body>
    <div id="wrap">
      <jsp:include page="../mainNav.jsp"/>
      <section>
        <div id="all_box">
          <div id="sidebar">
            <p id="nav_title">Administrator</p>
            <a href="${path}/admin/order" class="active">
              <span>주문 관리&nbsp;&nbsp;</span>
            </a>
            <a href="${path}/admin/product">
              <span>상품 관리&nbsp;&nbsp;</span>
            </a>
            <a href="${path}/admin/ask">
              <span>문의 관리&nbsp;&nbsp;</span>
            </a>
          </div>
          
          <div id="container">
            <div id="order_info">
              <h2 class="title">현재 주문 상황</h2>
              <table>
                  <tr>
                      <th>배송준비중</th>
                      <th>배송중</th>
                      <th>배송완료</th>
                  </tr>
                  <tr>
                      <td>${map.before}건</td>
                      <td>${map.start}건</td>
                      <td>${map.end}건</td>
                  </tr>
              </table>
            </div>
            <form action="./changeStatus" method="POST">
            <div id="order_info_list">
              <div>
                <h2 class="title title2">주문목록 / 배송조회 내역 총 ${map.tot} 건</h2>
                <div class="func_btns">
                  <button class="btn" name="status" id="startBtn" value="배송중">배송중 처리</button>
                  <button class="btn" name="status" id="endBtn" value="배송완료">배송완료 처리</button>
                </div>
              </div>
              <table id="table">
                <tr>
                  <th><input type="hidden"></th>
                  <th>주문번호</th>
                  <th>주문자</th>
                  <th>상품ID</th>
                  <th>상품명</th>
                  <th>상품금액/수량</th>
                  <th>처리상태</th>
                </tr>                
                <c:forEach var="item2" items="${map.listSeparate}">
                <tr class="${item2.order_num}">
                  <td>${item2.book_id}</td>
                  <td>${item2.book_title} | ${item2.book_writer}</td>
                  <td>${item2.book_price}원 / ${item2.book_cnt}개</td>
                </tr>
                </c:forEach>
              </table>
            </div>
            </form>
            <!-- 페이징 -->
            <div class="pagebox">
                 <ul class="pagenum_wrap">
                 	 <c:if test = "${pageNum != 1 }">
                     <li><a href="./order?pageNum=${pageNum-1 }" class="prev">&nbsp;prev</a></li>
                     </c:if>
                     <c:if test = "${isNext eq true}">
                     <li><a href="./order?pageNum=${pageNum+1 }" class="next">next&nbsp;</a></li>
                     </c:if>
                 </ul>
             </div>
          </div>
          
        </div>
      </section>
    </div>
  </body>
</html>