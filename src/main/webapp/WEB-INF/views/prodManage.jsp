<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>상품 관리</title>
    <style>
        body {
            display: flex;
            justify-content: space-around;
            margin: 200px auto;
        }

        #sidebar {
            display: flex;
            width: 10%;
            height: 100%;
            flex-direction: column;
        }
        #nav_title {
            width: 120px;
            height: 50px;
            font-weight: bold;
            margin-bottom: 0;
            line-height: 50px;
            border-bottom: 1px black solid;
        }
        #sidebar a {
            width: 80px;
            height: 50px;
            line-height: 50px;
            text-decoration: none;
            color: #ccc;
            border-bottom: 1px #ccc solid; 
        }
        #sidebar .active {
            color: black;
            border-bottom: 1px black solid;
        }
        #sidebar .active::after {
            content: " >";
        }

        #container {
            width: 1000px;
        }

        .title {
            font-weight: bold;
            font-size: 20px;
        }

        #order_info {
            display: flex;
            flex-direction: column;
            width: 700px;
            margin-bottom: 50px;
            align-items: flex-end;
        }
        #order_info table {
            width: 500px;
        }

        table {
            border: 1px #555 solid;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th {
            border: 1px #555 solid;
            border-bottom: none;
            background-color: #ccc;
            height: 40px;
        }
        td {
            border: 1px #555 solid;
            border-top: none;
            text-align: center;
            height: 50px;
        }

        .btn {
            margin-left: 10px;
        }
        
        #order_info_list {
            display: flex;
            flex-direction: column;
            width: 1000px;
        }

        .func_btns {
            float: right;
        }
    </style>
</head>
<body>
<!-- <jsp:include page="../adminNav.jsp"/> -->
    <div id="sidebar">
        <p id="nav_title">Administrator</p>
        <a href="orderManage.html">주문 관리</a>
        <a href="prodManage.html" class="active">상품 관리</a>
        <a href="inqManage.html">문의 관리</a>
    </div>
    <div id="container">
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
        <div id="order_info_list">
            <div>
                <span class="title">주문목록 / 배송조회 내역 총 0 건</span>
                <div class="func_btns">
                    <button class="btn">새 상품 등록</button>
                    <button class="btn">상품 정보 수정</button>
                    <button class="btn">상품 삭제</button>
                    <button class="btn">판매중지 처리</button>
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
                    <th>재고</th>
                    <th>상태</th>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>00000000</td>
                    <td>00000000</td>
                    <td>소설/시/에세이</td>
                    <td>책 제목 | 작가</td>
                    <td>14,000원</td>
                    <td>000건</td>
                    <td>00</td>
                    <td>판매중</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>00000000</td>
                    <td>00000000</td>
                    <td>소설/시/에세이</td>
                    <td>책 제목 | 작가</td>
                    <td>14,000원</td>
                    <td>000건</td>
                    <td>00</td>
                    <td>판매중</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>00000000</td>
                    <td>00000000</td>
                    <td>소설/시/에세이</td>
                    <td>책 제목 | 작가</td>
                    <td>14,000원</td>
                    <td>000건</td>
                    <td>00</td>
                    <td>판매중</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>00000000</td>
                    <td>00000000</td>
                    <td>소설/시/에세이</td>
                    <td>책 제목 | 작가</td>
                    <td>14,000원</td>
                    <td>000건</td>
                    <td>00</td>
                    <td>판매중</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>00000000</td>
                    <td>00000000</td>
                    <td>소설/시/에세이</td>
                    <td>책 제목 | 작가</td>
                    <td>14,000원</td>
                    <td>000건</td>
                    <td>00</td>
                    <td>판매중</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>00000000</td>
                    <td>00000000</td>
                    <td>소설/시/에세이</td>
                    <td>책 제목 | 작가</td>
                    <td>14,000원</td>
                    <td>000건</td>
                    <td>00</td>
                    <td>판매중</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>00000000</td>
                    <td>00000000</td>
                    <td>소설/시/에세이</td>
                    <td>책 제목 | 작가</td>
                    <td>14,000원</td>
                    <td>000건</td>
                    <td>00</td>
                    <td>판매중</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>00000000</td>
                    <td>00000000</td>
                    <td>소설/시/에세이</td>
                    <td>책 제목 | 작가</td>
                    <td>14,000원</td>
                    <td>000건</td>
                    <td>00</td>
                    <td>판매중</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>00000000</td>
                    <td>00000000</td>
                    <td>소설/시/에세이</td>
                    <td>책 제목 | 작가</td>
                    <td>14,000원</td>
                    <td>000건</td>
                    <td>00</td>
                    <td>판매중</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>00000000</td>
                    <td>00000000</td>
                    <td>소설/시/에세이</td>
                    <td>책 제목 | 작가</td>
                    <td>14,000원</td>
                    <td>000건</td>
                    <td>00</td>
                    <td>판매중</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>00000000</td>
                    <td>00000000</td>
                    <td>소설/시/에세이</td>
                    <td>책 제목 | 작가</td>
                    <td>14,000원</td>
                    <td>000건</td>
                    <td>00</td>
                    <td>판매중</td>
                </tr>
            </table>

        </div>
    </div>
</body>
</html>