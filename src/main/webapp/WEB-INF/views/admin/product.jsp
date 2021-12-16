<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>[관리자 페이지] 상품 관리</title>
    <link rel="stylesheet" href="${path}/resources/css/reset.css" />
    <link rel="stylesheet" href="${path}/resources/css/mainNav.css" />
    <link rel="stylesheet" href="${path}/resources/css/admin_product.css" />
  </head>
  <body>
    <div id="wrap">
      <jsp:include page="../mainNav.jsp"/>
      <section>
        <div id="section">
          <div id="sidebar">
            <p id="nav_title">Administrator</p>
            <a href="${path}/admin/order">주문 관리</a>
            <a href="${path}/admin/product" class="active">상품 관리</a>
            <a href="${path}/admin/ask">문의 관리</a>
          </div>
          <div id="container">
            <div id="order_info">
              <table>
                <tr>
                  <th>소설</th>
                  <th>시/에세이</th>
                  <th>여행</th>
                </tr>
                <tr>
                  <td>${map.novelCnt}권</td>
                  <td>${map.poemCnt}권</td>
                  <td>${map.travelCnt}권</td>
                </tr>
              </table>
            </div>
            <form action="./deleteProduct" method="POST">
            <div id="order_info_list">
              <div>
                <span class="title">총 ${map.bookCnt} 권</span>
                <div class="func_btns">
                    <button type="button" class="btn" onclick="location.href='${path}/admin/addProduct'">새 상품 등록</button>
                    <button type="button" class="btn" onclick="location.href='${path}/admin/updateProduct'">상품 정보 수정</button>
                    <button class="btn">상품 삭제</button>
                </div>
              </div>
              <table>
                <tr>
                  <th><input type="checkbox"></th>
                  <th>상품ID</th>
                  <th>상품 구분</th>
                  <th>상품명</th>
                  <th>판매가</th>
                  <th>누적 판매량</th>
                </tr>
                <c:forEach var="item" items="${map.list}">
                <tr>
                  <td><input type="checkbox" name="book_id" value="${item.book_id}"></td>
                  <td>${item.book_id}</td>
                  <td>${item.book_genre}</td>
                  <td>${item.book_title} | ${item.book_writer}</td>
                  <td>${item.book_price}원</td>
                  <td>${item.book_sell_tot}권</td>
                </tr>
                </c:forEach>
              </table>
            </div>
            </form>
          </div>
        </div>
      </section>
    </div>
  </body>
</html>
