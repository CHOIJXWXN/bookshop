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
    <link rel="stylesheet" href="${path }/resources/css/mainNav.css" />
    <link rel="stylesheet" href="${path }/resources/css/find.css" />
    
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <!-- 스크립트 경로 사용 X -> 주석 
    <script src="${path }/resources/js/mainjs/find.js" charset="UTF-8"></script> -->
    <script>
    $(document).ready(function(){
       
        $('#msg_id_name').hide();
        $('#msg_id_email').hide();
        
        // 아이디 찾기 (이메일 이용)
        $('#btn_findIdE').click(function(event){
            var user_name = $('#user_name_IdE').val();
            var user_email = $('#user_email_IdE').val();
            if(user_name == '') {
               // alert('이름을 입력해주세요.');
                $('#msg_id_name').show();
      			$('#msg_id_email').hide();
                event.preventDefault();
                $('#user_name_IdE').focus();
                return;
            }
            if(user_email == '') {
               // alert ('이메일을 입력해주세요.');
                $('#msg_id_name').hide();
      			$('#msg_id_email').show();
                event.preventDefault();
                $('#user_email_IdE').focus();
                return;
            }

            $.ajax({
                type: 'POST',
                url: './findIdEAction',
                data : {
                    user_name: user_name,
                    user_email: user_email
                },

                dataType: 'text',
                success: function(data) {
                    // 이름, 이메일이 존재 (아이디 찾기 가능)
                    // findeIdE page안에 각 값을 넣어줘야함 {user_name}, {user_email}, {user_id}
                    if(data == 0) {
                        $('#findIdE').submit();
                    }
                    // 이름, 이메일 존재 X (아이디 찾기 불가능)
                    else if(data == -1) {
                    	$('#msg_id_name').hide();
                        $('#msg_id_email').hide();
                        // 모달을 띄워야함.
                    	$('#not_exist_msg').show();
                    }
                }
            // ajax
            });
        // btn_findIdE.click.function
        });
        
        
    // document.ready.function    
    });
    </script>
  
  </head>
  <body>
   <div id="wrap">
      <!-- [1] 메인 네비게이션 -->
      <jsp:include page="../mainNav.jsp" />
      <!-- [2] 메인화면 -->
      <!-- 전체화면 -->
      <section id="find">
        <!-- findID, findPW 감싸는 WRAP -->
       <ul id="findwrap">
         <!-- (1) findID -->
        <li class="findId">
          <!-- 제목 -->
          <h2>FIND ID</h2>
          <div id="findId_tab_box">
            <label for="tab1"><img src="../../resources/images/findIdPw_icon.png" alt="">이메일로 찾기</label>
            <input type="radio" id="tab1" name="tab" checked/>            
            <label for="tab2"><img src="../../resources/images/findIdPw_icon.png" alt="">휴대폰 번호로 찾기</label>
            <input type="radio" id="tab2" name="tab" />         
            <!-- ------------------------------------ -->
            <!-- 위의 탭박스 선택에 따라 아래 탭 컨텐츠 달라짐 -->
            <!-- 이메일로 찾기 선택시 -->
            
            <section class="email">
            
              <form name="findIdE" id="findIdE" method="POST" action="./findIdE"> 
                <div class="row">
                  <label for="user_name">이름</label>
                  <input type="text" id="user_name_IdE" name="user_name" >
                </div>
                <div class="row">
                  <label for="user_email">이메일</label>
                  <input type="text" id="user_email_IdE" name="user_email" >
                </div>
                 <!-- 알림 문구 추가 -->
                <P id ="msg_id_name" style="color:red;">이름을 입력해주세요.</P>
                <p id="msg_id_email" style="color:red;">이메일을 입력해주세요.</p>
                <input type="button" id="btn_findIdE" value="SEARCH">
              </form>
            </section>
            <!-- 휴대폰 번호로 찾기 선택시 -->
            <section class="phone">
              <form method="POST" action="findID_phone">
                <div class="row">
                  <label for="user_name">이름</label>
                  <input type="text" id="user_name" name="user_name" >
                </div>
                <div class="row_tel">
                  <label>휴대폰번호</label>
                  <input type="text" id="phone" name="tel1" class="tel1">
                  <input type="text" id="phone" name="tel2" >
                  <input type="text" id="phone" name="tel3" >
                </div>
                <input type="submit" value="SEARCH">
              </form>
            </section>
          </div>
        </li>
        <!-- (2) findPW -->
        <li class="findPw">
          <!-- 제목 -->
          <h2>FIND PASSWORD</h2>
          <div id="findId_tab_box">
            <label for="pw_tab1">
              <img src="../../resources/images/findIdPw_icon.png" alt="">
              이메일로 찾기
            </label>
            <input type="radio" id="pw_tab1" name="pw_tab" checked/>            
            <label for="pw_tab2"><img src="../../resources/images/findIdPw_icon.png" alt="">휴대폰 번호로 찾기</label>
            <input type="radio" id="pw_tab2" name="pw_tab" /> 
            <!-- ------------------------------------ -->
            <!-- 위의 탭박스 선택에 따라 아래 탭 컨텐츠 달라짐 -->
            <!-- 이메일로 찾기 선택시 -->
            <section class="pw_email">
              <form id="findPW_email" method="POST" action="/findPW_email">
                <div class="row">
                  <label for="user_id">아이디</label>
                  <input type="text" id="user_id_fwe" name="user_id" >
                </div>
                <div class="row">
                  <label for="user_name">이름</label>
                  <input type="text" id="user_name_fwe" name="user_name" >
                </div>
                <div class="row">
                  <label for="email">이메일</label>
                  <input type="text" id="user_email_fwe" name="user_email" >
                </div>
                <input type="button" id="Btn_findPWE" value="SEARCH">
                <!-- 
                <input type="submit" value="SEARCH"> -->
             </form>
            </section>
            <!-- 휴대폰번호로 찾기 선택시 -->    
            <section class="pw_phone">
              <form method="POST" action="findPW_phone">
                <div class="row">
                  <label for="user_id">아이디</label>
                  <input type="text" id="user_id" name="user_id" >
                </div>
                <div class="row">
                  <label for="user_name">이름</label>
                  <input type="text" id="user_name" name="user_name" >
                </div>
                <div class="row_tel">
                  <label>휴대폰번호</label>
                  <input type="text" id="phone" name="tel1" class="tel1">
                  <input type="text" id="phone" name="tel2" >
                  <input type="text" id="phone" name="tel3" >
                </div>
                <input type="submit" value="SEARCH">
             </form>
            </section>
            <!-- --------------모달---------------- -->
		      <!-- 모달 띄울 때 display: block; -->
		      <div id="not_exist_msg" style="display: none;">
		        <h3>입력하신 정보로 가입된 회원 아이디는<br>존재하지 않습니다.</h3>
		        <a href="../find">확인</a>
		      </div>
          </div>
        </li>
       </ul>       
      </section>
    </div>
    
<script>
	$(document).ready(function(){
		var msg = '${msg}';
		if(msg != null && msg != '') alert(msg);
	});
</script>
  </body>
</html>