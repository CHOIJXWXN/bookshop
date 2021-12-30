<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
  	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Book Shop</title>
    <link rel="stylesheet" href="${path }/resources/css/reset.css" />
    <link rel="stylesheet" href="${path }/resources/css/mainNav.css" />
    <link rel="stylesheet" href="${path }/resources/css/checkUser.css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  </head>
  <body>
    <div id="wrap">
      <!-- [1] 메인 네비게이션 -->
      <jsp:include page="../mainNav.jsp" />
      <!-- [2] 메인화면 -->
      <!-- 전체화면 -->
      <section id="findPwP">
        <div class="findPw_success">
            <h2>회원정보 수정</h2>
            <p>
                회원정보를 수정하기 위해서 본인 확인 절차가 필요합니다.
            </p>
            <input type="password" name="user_pw" id="user_pw" placeholder="사용중인 비밀번호를 입력해주세요" />
            <ul class="btns_wrap">
                <li class="cancel_btn"><a href="${path }/mypage/">취소</a></li> 
                <button type="button" class="enter_btn" id="user_pw_check">확인</button>
            </ul>
        </div>
      </section>    
    </div>
    <script>
    	$(document).ready(function(){
    		
    		var msg = '${msg}';
    		if(msg != null && msg != '') {
    			alert(msg);
    		}
    		
    		$('#user_pw_check').click(function() {
    			
    			var user_pw = $('#user_pw').val();
    			
    			if(user_pw == '') {
    				alert('비밀번호를 입력해주세요.');
    				return;
    			}
    			
    			// 비동기통신 AJAX 진행
    			$.ajax({
    				// 전송부
    				type : 'GET',
    				url : './pwCheck',
    				data : {
    					user_pw : user_pw
    				},
    				// 송신부
    				dataType : 'text',
    				success : function(data) {
    					// 비밀번호가 일치할 때
    					if(data == 0 || data == 1) {
    						sessionStorage.setItem('profileFlag', 0);
    						location.href = "./profile";
    					}
    					// 비밀번호가 일치하지 않을 때
    					else if(data == -1) {
    						alert('비밀번호가 일치하지 않습니다.');
    						$('#user_pw').attr('value', '');
    					}
    					// 데이터베이스 오류
    					else {
    						alert('데이터베이스 오류가 발생했습니다.');
    					}
    					
    				},
    				error : function() {	//통신에 실패했을 때
    					alert('비밀번호 인증 실패');
    				}
    			});
    			
    		});
    		
    		
    	});
    </script>
  </body>
</html>