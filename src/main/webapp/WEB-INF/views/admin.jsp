<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>관리자페이지</title>
    <style>
        body {
            width: 100%;
            height: 100%;
            padding-top: 200px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        #container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 500px;
            height: 500px;
        }
        #title {
            text-align: center;
        }
        ul {
            display: flex;
            width: 450px;
            height: 300px;
            margin: 0;
            flex-direction: row;
            align-items: center;
            justify-content: space-evenly;
            list-style: none;
            padding-left: 0px;
        }

        li {
            border: 1px #ccc solid;
        }

        .mn_btn {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: space-evenly;
            width: 200px;
            height: 200px;
            text-decoration: none;
            color: black;
        }
    </style>
</head>
<body>
<!-- <jsp:include page="../adminNav.jsp"/> -->
<div id="container">
    <h1 id="title">관리자 페이지</h1>
    <div id="quick_mn">
        <ul>
            <li>
                <a class="mn_btn" href="orderManage.html">
                    <img src="" alt="icon" width="100" height="100">
                    주문 관리
                </a>
            </li>
            <li>
                <a class="mn_btn" href="#">
                    <img src="" alt="icon" width="100" height="100">
                    상품 관리
                </a>
            </li>
        </ul>
    </div>
</div>
</body>
</html>