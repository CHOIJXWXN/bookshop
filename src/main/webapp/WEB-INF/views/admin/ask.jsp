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
  </head>
  <body>
    <div id="wrap">
      <jsp:include page="../mainNav.jsp"/>
      <section>
        <div id="section">
          <div id="sidebar">
            <p id="nav_title">Administrator</p>
            <a href="${path}/admin/order">주문 관리</a>
            <a href="${path}/admin/product">상품 관리</a>
            <a href="${path}/admin/ask" class="active">문의 관리</a>
        </div>
        <div id="container">
            <h3>QnA</h3>
            <table>
              <tr>
                <th>No</th>
                <th>제목</th>
                <th>작성자</th>
                <th>날짜</th>
                <th>상태</th>
              </tr>
              <tr>
                <td>00000000</td>
                <td><a href="${path}/ask/viewAsk?ask_id=${ask_id}">[문의종류] 제목</a></td>
                <td>abcd</td>
                <td>2021-12-09</td>
                <td class="notdone">미답변</td>
              </tr>
              <tr>
                <td>00000000</td>
                <td><a href="${path}/ask/viewAsk?ask_id=${ask_id}">[문의종류] 제목</a></td>
                <td>abcd</td>
                <td>2021-12-09</td>
                <td class="done">답변완료</td>
              </tr>
              <tr>
                <td>00000000</td>
                <td><a href="${path}/ask/viewAsk?ask_id=${ask_id}">[문의종류] 제목</a></td>
                <td>abcd</td>
                <td>2021-12-09</td>
                <td class="notdone">미답변</td>
              </tr>
              <tr>
                <td>00000000</td>
                <td><a href="${path}/ask/viewAsk?ask_id=${ask_id}">[문의종류] 제목</a></td>
                <td>abcd</td>
                <td>2021-12-09</td>
                <td class="done">답변완료</td>
              </tr>
              <tr>
                <td>00000000</td>
                <td><a href="${path}/ask/viewAsk?ask_id=${ask_id}">[문의종류] 제목</a></td>
                <td>abcd</td>
                <td>2021-12-09</td>
                <td class="notdone">미답변</td>
              </tr>
              <tr>
                <td>00000000</td>
                <td><a href="${path}/ask/viewAsk?ask_id=${ask_id}">[문의종류] 제목</a></td>
                <td>abcd</td>
                <td>2021-12-09</td>
                <td class="done">답변완료</td>
              </tr>
              <tr>
                <td>00000000</td>
                <td><a href="${path}/ask/viewAsk?ask_id=${ask_id}">[문의종류] 제목</a></td>
                <td>abcd</td>
                <td>2021-12-09</td>
                <td class="notdone">미답변</td>
              </tr>
              <tr>
                <td>00000000</td>
                <td><a href="${path}/ask/viewAsk?ask_id=${ask_id}">[문의종류] 제목</a></td>
                <td>abcd</td>
                <td>2021-12-09</td>
                <td class="done">답변완료</td>
              </tr>
              <tr>
                <td>00000000</td>
                <td><a href="${path}/ask/viewAsk?ask_id=${ask_id}">[문의종류] 제목</a></td>
                <td>abcd</td>
                <td>2021-12-09</td>
                <td class="notdone">미답변</td>
              </tr>
              <tr>
                <td>00000000</td>
                <td><a href="${path}/ask/viewAsk?ask_id=${ask_id}">[문의종류] 제목</a></td>
                <td>abcd</td>
                <td>2021-12-09</td>
                <td class="done">답변완료</td>
              </tr>       
            </table>
        </div>
        </div>
      </section>
    </div>
  </body>
</html>
