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
    <link rel="stylesheet" href="${path }/resources/css/findPwP.css" />
    
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    
    <script>
    $(document).ready(function(){
    	$('#first').show();
    	$('#resend').hide();
    	
        $('#resend_btn').click(function(){
            var user_id = '${users.user_id}';
            var user_email = '${users.user_email}';

            $.ajax({
                type: 'POST',
                url:'./findPwEAction',
                data: {
                    user_id: user_id,
                    user_email: user_email
                },

                dataType: 'text',
                success: function(data) {
                    if (data == 0) {
                        $('#findPwE').submit();
                        alert('비밀번호가 재전송 되었습니다.');
                        $('#first').hide();
                    	$('#resend').show();
                    }
                    else {
                        alert('데이터베이스 오류입니다. 다시 시도해주세요');
                        history.back;
                    }
                }
            // ajax    
            });
        // resend_btn.click.function
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
      <section id="findPwP">
        <div class="findPw_success">
            <h2>임시 비밀번호가 전송되었습니다.</h2>
            <!-- 재전송 알림을 위해 p태그 나눔 -->
            <p id="first">${users.user_id} 회원님, 임시 비밀번호를 <br>
             ${users.user_email } 메일로 보내드렸습니다. </p>
            <p id="resend">${users.user_id} 회원님, 임시 비밀번호를 <br>
             ${users.user_email } 메일로 재전송 하였습니다. </p>
            
            <ul class="btns_wrap">
                <li class="login_btn"><a href="../login">LOGIN</a></li>
                <!-- 버튼으로 변경
                <li class="resend_btn"><a href="#">재전송</a></li> -->
                <button type="button" id="resend_btn">재전송</button>
            </ul>
        </div>
      </section>     
    </div>
  </body>
</html>