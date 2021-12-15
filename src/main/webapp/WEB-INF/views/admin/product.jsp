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
          <!-- 
            <div id="order_info">
              <table>
                <tr>
                  <th>전체</th>
                  <th>판매중</th>
                  <th>판매중지</th>
                </tr>
                <tr>
                  <td>000건</td>
                  <td>0건</td>
                  <td>0건</td>
                </tr>
              </table>
            </div>
           -->
            <div id="order_info_list">
              <div>
                <span class="title">주문목록 / 배송조회 내역 총 0 건</span>
                <div class="func_btns">
                    <button class="btn" onclick="location.href='${path}/admin/addProduct'">새 상품 등록</button>
                    <button class="btn" onclick="location.href='${path}/admin/updateProduct'">상품 정보 수정</button>
                    <button class="btn" onclick="location.href='${path}/admin/deleteProduct'">상품 삭제</button>
                </div>
              </div>
              <table>
                <tr>
                  <th><input type="checkbox"></th>
                  <th>NO</th>
                  <th>상품ID</th>
                  <th>상품 구분</th>
                  <th>상품명</th>
                  <th>판매가</th>
                  <th>누적 판매량</th>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>00000000</td>
                  <td>00000000</td>
                  <td>소설/시/에세이</td>
                  <td>책 제목 | 작가</td>
                  <td>14,000원</td>
                  <td>000건</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>00000000</td>
                  <td>00000000</td>
                  <td>소설/시/에세이</td>
                  <td>책 제목 | 작가</td>
                  <td>14,000원</td>
                  <td>000건</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>00000000</td>
                  <td>00000000</td>
                  <td>소설/시/에세이</td>
                  <td>책 제목 | 작가</td>
                  <td>14,000원</td>
                  <td>000건</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>00000000</td>
                  <td>00000000</td>
                  <td>소설/시/에세이</td>
                  <td>책 제목 | 작가</td>
                  <td>14,000원</td>
                  <td>000건</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>00000000</td>
                  <td>00000000</td>
                  <td>소설/시/에세이</td>
                  <td>책 제목 | 작가</td>
                  <td>14,000원</td>
                  <td>000건</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>00000000</td>
                  <td>00000000</td>
                  <td>소설/시/에세이</td>
                  <td>책 제목 | 작가</td>
                  <td>14,000원</td>
                  <td>000건</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>00000000</td>
                  <td>00000000</td>
                  <td>소설/시/에세이</td>
                  <td>책 제목 | 작가</td>
                  <td>14,000원</td>
                  <td>000건</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>00000000</td>
                  <td>00000000</td>
                  <td>소설/시/에세이</td>
                  <td>책 제목 | 작가</td>
                  <td>14,000원</td>
                  <td>000건</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>00000000</td>
                  <td>00000000</td>
                  <td>소설/시/에세이</td>
                  <td>책 제목 | 작가</td>
                  <td>14,000원</td>
                  <td>000건</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>00000000</td>
                  <td>00000000</td>
                  <td>소설/시/에세이</td>
                  <td>책 제목 | 작가</td>
                  <td>14,000원</td>
                  <td>000건</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>00000000</td>
                  <td>00000000</td>
                  <td>소설/시/에세이</td>
                  <td>책 제목 | 작가</td>
                  <td>14,000원</td>
                  <td>000건</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>00000000</td>
                  <td>00000000</td>
                  <td>소설/시/에세이</td>
                  <td>책 제목 | 작가</td>
                  <td>14,000원</td>
                  <td>000건</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>00000000</td>
                  <td>00000000</td>
                  <td>소설/시/에세이</td>
                  <td>책 제목 | 작가</td>
                  <td>14,000원</td>
                  <td>000건</td>
                </tr>
              </table>
            </div>
          </div>
        </div>
      </section>
    </div>
  </body>
</html>
