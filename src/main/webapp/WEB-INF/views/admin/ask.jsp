<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>[관리자 페이지] 문의 관리</title>
    <link rel="stylesheet" href="${path}/resources/css/reset.css" />
    <link rel="stylesheet" href="${path}/resources/css/mainNav.css" />
    <link rel="stylesheet" href="${path}/resources/css/admin_ask.css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  	<script>
  		$(document).ready(function() {
  			
  			var order_status = $('.ask_status').text();
  			
  			if(order_status == '답변미완료') {
  				$('.ask_status').addClass('notdone');
  			}
  			else if(order_status == '답변완료') {
  				$('.ask_status').addClass('done');
  			}
  			
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
            <a href="${path}/admin/order">
              <span>주문 관리&nbsp;&nbsp;</span>
            </a>
            <a href="${path}/admin/product">
              <span>상품 관리&nbsp;&nbsp;</span>
            </a>
            <a href="${path}/admin/ask" class="active">
              <span>문의 관리&nbsp;&nbsp;</span>
            </a>
        </div>
        <div id="container">
            <h3 class="title">QnA</h3>
            <table>
              <tr>
                <th>No</th>
                <th>제목</th>
                <th>작성자</th>
                <th>날짜</th>
                <th>상태</th>
              </tr>
              <!-- 반복, 10개  limit 10 -->
              <c:forEach var="ask" items="${list }">
              <tr>
                <td>${ask.ask_id }</td> <!-- ask_id -->
                <td class="ask_ttl"><a href="${path}/ask/boardView?ask_id=${ask.ask_id}">[${ask.ask_sort}] ${ask.book_title}</a></td> <!-- [ask_sort],[book_title]  -->
                <td>${ask.writer }</td> <!-- ask_writer -->
                <td>${ask.ask_date}</td><!-- ask_date --> 
              	<td class="ask_status">${ask.ask_status}</td>
              </tr>
              </c:forEach>
              
            </table>
            
              <!-- 페이징 -->
            <div class="pagebox">
                 <ul class="pagenum_wrap">
                 	 <c:if test = "${pageNum != 1 }">
                     <li><a href="${path}/admin/ask?pageNum=${pageNum-1 }" class="prev">&nbsp;prev</a></li>
                     </c:if>
                     <c:if test = "${isNext eq true}">
                     <li><a href="${path}/admin/ask?pageNum=${pageNum+1 }" class="next">next&nbsp;</a></li>
                     </c:if>
                 </ul>
             </div>
        </div>
        </div>
      </section>
    </div>
  </body>
</html>
