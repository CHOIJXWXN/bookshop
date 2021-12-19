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
    <link rel="stylesheet" href="${path }/resources/css/login.css" />
    
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <!-- 따로 script 빼놓을시 적용 안되서 일단 주석처리함 (login.js 내용 지움)
    <script src="${path }/resources/js/mainjs/login.js" charset="UTF-8"></script> -->
    <script>
    $(document).ready(function(){
    	
    	$('#msg_id').hide();
	 	$('#msg_pw').hide();
	 	$('#msg1').hide();
	 	$('#msg2').hide();
	 	
    	$('#btn_login').click(function(){
    		var user_id = $('#user_id').val();
    		var user_pw = $('#user_pw').val();
		 	
    		if(user_id == '') {
    			// alert ('아이디를 입력하세요');
    			// $('#msg_id').text('아이디를 입력하세요.');
    			// $('#msg_pw').hide();
    			$('#msg_id').show();
    			$('#msg_pw').hide();
    			$('#msg1').hide();
    		 	$('#msg2').hide();
    			$('#user_id').focus();
    		 	
    			return;
    		}
    		else if(user_pw == '') {
    			// alert ('비밀번호를 입력하세요');
    			// $('#msg_pw').text('비밀번호를 입력하세요.');
    			// $('#msg_id').hide();
    			$('#msg_id').hide();
    			$('#msg_pw').show();
    			$('#msg1').hide();
    		 	$('#msg2').hide();
    			$('#user_pw').focus();
    			return;
    		}
    	
    		$.ajax({
    			type : 'POST',
    			url  : './loginAction',
    			data : {
    				user_id : user_id,
    				user_pw : user_pw
    			},
    			
    			dataType: 'text',
    			success : function(data) {
    				// 로그인 정보 일치 -> 로그인 성공, 메인페이지이동
    				if(data == 0) {
    					location.href = '../';
    				}
    				// 로그인 실패 -> 로그인 정보 불일치 알림 띄우기
    				else if (data == -1) {
    					//alert('아이디 또는 비밀번호가 잘못 입력되었습니다.');
					 	$('#msg_id').hide();
	 					$('#msg_pw').hide();
					 	$('#msg1').show();
					 	$('#msg2').show();
    				}
    					
    			}
    		// ajax	
    		});
    	// btn_login.click.function	
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
      <section id="login_view">
      <!-- form tag 삭제 
        <form name="fform" method="POST" action="/loginAction">-->
            <!-- 로그인 박스 -->
            <div class="container">
                <header>LOGIN</header>
                <div class="row">
                    <input type="text" name="user_id" id="user_id" placeholder="아이디">
                </div>
                <div class="row">
                    <input type="password" name="user_pw" id="user_pw" placeholder="비밀번호">
                </div>
                <div class="row_s">
                    <input type="checkbox" name="save_id" id="save_id">
                    <label for="save_id">아이디 저장</label>
                </div>
                <!-- msg 공간 추가 -->
                <p id="msg_id" style="color:red;">아이디를 입력하세요.</p>
                <p id="msg_pw" style="color:red;">비밀번호를 입력하세요.</p>
                <p id="msg1" style="color:red;">아이디 또는 비밀번호가 잘못 입력되었습니다.</p><br>
                <p id="msg2" style="color:red;">아이디와 비밀번호를 정확하게 입력해주세요.</p><br>
                <!-- type submit -> button 변경
                <input type="submit" value="LOGIN">-->
                <input type="button"  id="btn_login" value="LOGIN">
            </div>
       <!-- </form>  -->
       
        <div class="join_find">
            <p>아직 회원이 아니신가요?</p>
            <div class="btn_group">
                <a href="${path }/joinTerm" class="join">회원가입</a>
                <a href="${path }/find" class="find_id_pw">아이디 / 비밀번호 찾기</a>
            </div>
        </div>
        
        
      </section>
    </div>
    
    
  </body>
</html>