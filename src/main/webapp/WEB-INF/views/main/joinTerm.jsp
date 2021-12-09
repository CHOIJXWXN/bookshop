<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Book Shop</title>
    <link rel="stylesheet" href="${path }/resources/css/reset.css" />
    <link rel="stylesheet" href="${path }/resources/css/joinTerm.css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <%-- <script src="${path }/resources/js/jquery.js"></script> --%>
    <script src="${path }/resources/js/mainjs/join.js" charset="UTF-8"></script>
  </head>
<body>
    <div id="wrap">
    <!-- [1] 메인 네비게이션 -->
      <jsp:include page="../mainNav.jsp" />
      <!-- [2] 메인화면 -->
      <section>
        <!-- [2-1] 제목 -->
        <header class="join1_header">
            <h2>JOIN US!</h2>
            <div class="process">
                <img src="../../resources/images/join_step1.png" alt="">
            </div>
        </header>
        <!-- [2-2] 약관동의 -->
        <div id="check_btns_group">
          <ul id="term_box">
            <li>
              <input type="checkbox" class="normal" id="chk_1">
              <label for="chk_1">첫번째 약관 동의</label>
            </li>
            <li>
              <input type="checkbox" class="normal" id="chk_2">
              <label for="chk_2">두번째 약관 동의</label>
            </li>
        </ul>
        <!-- 약관동의 모두 체크 -->
        <div class="agree_chk">
          <input type="checkbox" id="chk_all">
          <label for="chk_all">이용약관 및 개인정보 수집 및 이용에 모두 동의합니다.</label>
        </div>
      </div>
        
        <!-- 다음버튼 -->
        <button id="next">NEXT</button>
      </section>
    </div>
  </body>
</html>