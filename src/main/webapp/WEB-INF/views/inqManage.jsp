<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>상품 관리</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            margin: 200px auto;
        }

        #sidebar {
            display: flex;
            width: 20%;
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

        table {
            border: 1px #555 solid;
            border-collapse: collapse;
            margin-top: 20px;
            width: 100%;
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
        
        .notdone {
            color: red;
        }

        .done {
            color: #ccc;
        }
    </style>
</head>
<body>
<!-- <jsp:include page="../adminNav.jsp"/> -->
    <div id="sidebar">
        <p id="nav_title">Administrator</p>
        <a href="orderManage.html">주문 관리</a>
        <a href="prodManage.html">상품 관리</a>
        <a href="inqManage.html" class="active">문의 관리</a>
    </div>
    <div id="container">
        <h3>QnA</h3>
        <table>
            <tr>
                <th>No</th>
                <th>제목</th>
                <th>작성자</th>
                <th>날짜</th>
                <th></th>
            </tr>
            <tr>
                <td>00000000</td>
                <td>[문의종류] 제목</td>
                <td>abcd</td>
                <td>2021-12-09</td>
                <td class="notdone">미답변</td>
            </tr>
            <tr>
                <td>00000000</td>
                <td>[문의종류] 제목</td>
                <td>abcd</td>
                <td>2021-12-09</td>
                <td class="done">답변완료</td>
            </tr>
            <tr>
                <td>00000000</td>
                <td>[문의종류] 제목</td>
                <td>abcd</td>
                <td>2021-12-09</td>
                <td class="notdone">미답변</td>
            </tr>
            <tr>
                <td>00000000</td>
                <td>[문의종류] 제목</td>
                <td>abcd</td>
                <td>2021-12-09</td>
                <td class="done">답변완료</td>
            </tr>
            <tr>
                <td>00000000</td>
                <td>[문의종류] 제목</td>
                <td>abcd</td>
                <td>2021-12-09</td>
                <td class="notdone">미답변</td>
            </tr>
            <tr>
                <td>00000000</td>
                <td>[문의종류] 제목</td>
                <td>abcd</td>
                <td>2021-12-09</td>
                <td class="done">답변완료</td>
            </tr>
            <tr>
                <td>00000000</td>
                <td>[문의종류] 제목</td>
                <td>abcd</td>
                <td>2021-12-09</td>
                <td class="notdone">미답변</td>
            </tr>
            <tr>
                <td>00000000</td>
                <td>[문의종류] 제목</td>
                <td>abcd</td>
                <td>2021-12-09</td>
                <td class="done">답변완료</td>
            </tr>
            <tr>
                <td>00000000</td>
                <td>[문의종류] 제목</td>
                <td>abcd</td>
                <td>2021-12-09</td>
                <td class="notdone">미답변</td>
            </tr>
            <tr>
                <td>00000000</td>
                <td>[문의종류] 제목</td>
                <td>abcd</td>
                <td>2021-12-09</td>
                <td class="done">답변완료</td>
            </tr>
        </table>
    </div>
</body>
</html>