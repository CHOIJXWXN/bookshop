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
    <link rel="stylesheet" href="${path}/resources/css/admin_order.css" />
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
                      <td>0건</td>
                      <td>0건</td>
                      <td>0건</td>
                  </tr>
              </table>
            </div>
            <div id="order_info_list">
              <div>
                <span class="title">주문목록 / 배송조회 내역 총 0 건</span>
                <div class="func_btns">
                  <button class="btn" onclick="location.href='${path}/admin/start'">배송중 처리</button>
                  <button class="btn" onclick="location.href='${path}/admin/end'">배송완료 처리</button>
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
                <tr>
                  <td><input type="checkbox"></td>
                  <td>20211207-000001</td>
                  <td>abcd</td>
                  <td>92473632</td>
                  <td>책 제목 | 작가</td>
                  <td>14,000원 / 1개</td>
                  <td>배송중</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>20211207-000001</td>
                  <td>abcd</td>
                  <td>92473632</td>
                  <td>책 제목 | 작가</td>
                  <td>14,000원 / 1개</td>
                  <td>배송중</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>20211207-000001</td>
                  <td>abcd</td>
                  <td>92473632</td>
                  <td>책 제목 | 작가</td>
                  <td>14,000원 / 1개</td>
                  <td>배송중</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>20211207-000001</td>
                  <td>abcd</td>
                  <td>92473632</td>
                  <td>책 제목 | 작가</td>
                  <td>14,000원 / 1개</td>
                  <td>배송중</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>20211207-000001</td>
                  <td>abcd</td>
                  <td>92473632</td>
                  <td>책 제목 | 작가</td>
                  <td>14,000원 / 1개</td>
                  <td>배송중</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>20211207-000001</td>
                  <td>abcd</td>
                  <td>92473632</td>
                  <td>책 제목 | 작가</td>
                  <td>14,000원 / 1개</td>
                  <td>배송중</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>20211207-000001</td>
                  <td>abcd</td>
                  <td>92473632</td>
                  <td>책 제목 | 작가</td>
                  <td>14,000원 / 1개</td>
                  <td>배송중</td>
                </tr>
              </table>
            </div>
          </div>
        </div>
      </section>
    </div>
  </body>
</html>