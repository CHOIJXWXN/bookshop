<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
  	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Guide</title>
    <link rel="stylesheet" href="${path }/resources/css/reset.css" />
    <link rel="stylesheet" href="${path }/resources/css/mainNav.css" />
    <link rel="stylesheet" href="${path }/resources/css/guide.css" />
     <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  </head>
  <body>
    <div id="wrap">
      <!-- [1] 메인 네비게이션 -->
      <jsp:include page="../mainNav.jsp" />
      <!-- [2] 메인화면 -->
      <!-- 전체화면 -->
      <section>
        <div id="agreement_box">
            
            <div class="contents">
                <h3>회원가입 안내</h3>
                <p>
                    [회원가입] 메뉴를 통해 이용약관, 개인정보보호정책 동의 및 일정 양식의 가입항목을 기입함으로써 회원에 가입되며, 가입 즉시 서비스를 무료로 이용하실 수 있습니다.<br>
                    주문하실 때에 입력해야하는 각종 정보들을 일일이 입력하지 않으셔도 됩니다.
                </p>
                <h3>주문 안내</h3>
                <p>
                    상품주문은 다음단계로 이루어집니다.<br>
                    <br>
                    &nbsp;- Step1&nbsp;|&nbsp; 상품검색<br>
                    &nbsp;- Step2&nbsp;|&nbsp; 장바구니에 담기<br>
                    &nbsp;- Step3&nbsp;|&nbsp; 회원ID 로그인<br>
                    &nbsp;- Step4&nbsp;|&nbsp; 주문서 작성<br>
                    &nbsp;- Step5&nbsp;|&nbsp; 결제<br>
                    &nbsp;- Step6&nbsp;|&nbsp; 주문 성공 화면 (주문번호)<br>
                </p>
                <h3>배송 안내</h3>
                <p>
                    배송 방법 : 택배<br>
                    배송 지역 : 전국지역<br>
                    배송 비용 : 조건부 무료&nbsp;|&nbsp;주문 금액 KRW 20,000 미만일 때 배송비 KRW 3,000을 추가합니다.<br>
                    배송 기간 : 2일 ~ 7일<br>
                    배송 안내 :<br>
                    '룩북(LOOKBOOK)'은 우체국 택배사를 통해서 배송됩니다.<br>
                    결제금액 2만원 미만일 경우 배송비 3,000원이 발생합니다.<br>
                    토요일, 일요일은 상품을 발송하지 않으니 배송기간에 유의하여 주문하여 주시길 바랍니다.<br>
                    배송준비중 단계에서는 주문 취소, 결제 변경, 배송지 변경이 불가합니다.<br>
                    배송문의는 문의게시판(마이페이지 > 배송문의)을 이용해주시길 바랍니다.
                </p>
                <h3>교환/반품 안내</h3>
                <p>
                    교환 및 반품 절차는 다음과 같습니다.<br>
                    <br>
                    &nbsp;- Step1&nbsp;|&nbsp; 교환 및 반품은 상품 수령일 7일 이내에 문의게시판을 통해 신청합니다.<br>
                    &nbsp;- Step2&nbsp;|&nbsp; 교환 및 반품 신청이 확인되면 택배사명을 통해 반품을 접수해드립니다.<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    상품을 그대로 재포장한 후, 택배 회수 기사님 방문 시 전달해주세요.<br>
                    &nbsp;- Step3&nbsp;|&nbsp; 모든 상품은 반송된 상품이 도착한 후, 교환 및 환불 처리가 진행됩니다.<br>
                    <br>
                    &#42;소비자의 책임으로 상품이 훼손 또는 변형된 경우, 교환 및 반품이 거절될 수 있습니다.<br>
                    <br>
                    교환 및 반품 문의는 문의게시판(마이페이지>교환/반품 문의)를 이용해주시기 바랍니다.<br>
                    교환 및 반품은 사용흔적이 없는 새상품일 경우만 가능합니다.<br>
                    교환은 동일 상품으로 가능합니다.<br>
                    단순변심으로 인한 교환 및 반품은 상품 수령일로 부터 7일 이내에 접수를 하셔야하며, 왕복 배송비는 고객 부담입니다.<br>
                    불량품 배송이나 오배송의 경우 상품 수령일로 부터 30일 이내 접수시 무료 교환 및 반품이 가능하며 배송비는 본사에서 부담합니다.
                </p>
                <h3>기타 안내</h3>
                <p>
                    포인트 안내<br>
                    <br>
                    상품 구매 시 상품 금액의 5%가 포인트로 적립됩니다.
                    <br>
                    보유 포인트는 상품구매시 즉시 사용하실 수 있습니다.
                    <br><br>
                    이용조건<br>
                    <br>
                    포인트 사용시 최소구매가능포인트(구매가능한 포인트 요구선)는 KRW 0 입니다. 포인트 사용시 최대구매가능포인트(포인트 1회 사용 가능 최대금액)는 '한도제한없음' 입니다.
                    <br><br>
                    소멸조건<br>
                    <br>
                    주문취소/환불시에 상품구매로 적립된 포인트는 함께 취소됩니다. 회원 탈퇴시에는 포인트은 자동적으로 소멸됩니다. 최종 포인트 발생일로부터 3년 동안 추가포인트 누적이 없을 경우에도 포인트는 소멸됩니다.
                </p>
            </div>
        </div>

      </section>
    </div>
  </body>
</html>