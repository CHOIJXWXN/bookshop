<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
  	<meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>[관리자 페이지] 상품 관리</title>
    <link rel="stylesheet" href="${path}/resources/css/reset.css" />
    <link rel="stylesheet" href="${path}/resources/css/mainNav.css" />
    <link rel="stylesheet" href="${path}/resources/css/addProduct.css" />
  </head>
  <body>
    <div id="wrap">
    <!-- [1] 메인 네비게이션 -->
     <jsp:include page="../mainNav.jsp"/>
 	<!-- [2] 메인화면 -->
      <section id="delivery">
          <!-- 사이드 퀵메뉴 -->
        <div id="sidebar">
            <p id="nav_title">Administrator</p>
            <a href="orderManage.html">
                <span>주문관리&nbsp;&nbsp;</span>
            </a>
            <a href="prodManage.html">
                <span class="on">상품관리&nbsp;&nbsp;</span>
            </a>
            <a href="inqManage.html" class="active">
                <span>문의관리&nbsp;&nbsp;</span>
            </a>
        </div>
        <!-- 새상품 등록 폼 -->
        <div id="upload_book">
           <!-- 보유포인트 -->
           <h2>새 상품 등록하기</h2>
            <!-- div1 : 제목 작가 가격 -->
            <div class="ttl_writer_price">
                <div class="row">
                    <h3>책제목</h3>
                    <div class="input_box">
                        <input type="text" id="book_title" />
                    </div>
                </div>
                <div class="row">
                    <h3>작가</h3>
                    <div class="input_box">
                        <input type="text" id="book_writer" />
                    </div>
                </div>
                <div class="row">
                    <h3>가격</h3>
                    <div class="input_box">
                        <input type="text" id="book_price" />
                    </div>
                </div>
                <div class="row">
                    <h3>출판사</h3>
                    <div class="input_box">
                        <input type="text" id="book_pub" />
                    </div>
                </div>
            </div>
            <!-- div2 : 표지이미지 & 카테고리 -->
            <div class="book_cover">
                <div class="row2">
                    <h3>ISBN</h3>
                    <div class="input_box">
                        <input type="text" id="book_id" />
                    </div>
                </div>
                <div class="row2 row_img">
                    <h3>표지이미지</h3>
                    <!-- 업로드 버튼 -->
                    <input type="file" id="book_cover_file" palceholder="업로드">
                </div>
                <div class="row2">
                    <h3>카테고리</h3>
                    <select name="book_category" class="book_category">
                        <option value="1" selected="selected">소설</option>
                        <option value="2">시/에세이</option>
                        <option value="3">여행</option>
                    </select>  
                </div>
                <div class="row2">
                    <h3>출간일</h3>
                    <div class="input_box">
                        <input type="date" id="pub_date" />
                    </div>
                </div>
            </div>
            <!-- 책 목차 쓰는 영역 -->
            <div class="book_contents">
                <h3>책목차</h3>
                <input type="textarea" id="book_contents">
            </div>
            <!-- 책줄거리 쓰는 영역 -->
            <div class="book_story">
                <h3>책줄거리</h3>
                <input type="textarea" id="book_story">
            </div>
            
        </div>
        <button type="button" id="uploadBook">등록하기</button>
        </section>
    </div>
  </body>
</html>
