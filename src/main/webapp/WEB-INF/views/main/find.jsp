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
        $('#msg_id_nameP').hide();
        $('#msg_id_phone').hide();
        $('#msg_pw_nameE').hide();
        $('#msg_pw_idE').hide();
        $('#msg_pw_emailE').hide();
        $('#msg_pw_nameP').hide();
        $('#msg_pw_idP').hide();
        $('#msg_pw_phoneP').hide();
        
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
        
        // 휴대폰 번호를 이용하여 아이디 찾기
        $('#btn_findIdP').click(function(event) {
            var user_name = $('#user_name_IdP').val();
            var user_phone = $('#user_phone_IdP').val();

            if (user_name == '') {
                $('#msg_id_name').hide();
                $('#msg_id_email').hide();
                $('#msg_id_nameP').show();
                $('#msg_id_phone').hide();
                event.preventDefault();
                $('user_name_IdP').focus();
                return;
            }
            if (user_phone == '') {
                $('#msg_id_name').hide();
                $('#msg_id_email').hide();
                $('#msg_id_nameP').hide();
                $('#msg_id_phone').show();
                event.preventDefault();
                $('#user_phone_IdP').focus();
                return;
            }

            $.ajax({
                type: 'POST',
                url: './findIdPAction',
                data: {
                	user_name: user_name,
                	user_phone: user_phone
                },

                dataType: 'text',
                success: function(data) {
                    // 이름, 폰번호 존재 -> id 찾기 가능
                    // result = 0
                    if(data == 0) {
                        $('#findIdP').submit();
                    }
                    // 이름, 폰번호 존재 x -> id찾기 불가능
                    // result = -1
                    else if(data == -1) {
                        $('#msg_id_name').hide();
                        $('#msg_id_email').hide();
                        $('#msg_id_nameP').hide();
                        $('#msg_id_phone').hide();
                        // 모달 띄움
                        $('#not_exist_msg').show();
                    }
                }
            // ajax    
            });


        // btn_findIdP.click.function    
        });
        
        // 비밀번호 찾기 이메일 전송
        $('#btn_findPWE').click(function(event) {
            var user_id = $('#user_id_fwe').val();
            var user_name = $('#user_name_fwe').val();
            var user_email = $('#user_email_fwe').val();

            if(user_id == "") {
            	$('#msg_pw_nameE').hide();
                $('#msg_pw_idE').show();
                $('#msg_pw_emailE').hide();
                event.preventDefault();
                $('#user_id_fwe').focus();
                return;
            }
            else if(user_name == "") {
            	$('#msg_pw_nameE').show();
                $('#msg_pw_idE').hide();
                $('#msg_pw_emailE').hide();
                event.preventDefault();
                $('#user_name_fwe').focus();
                return;
            }
            else if(user_email == ""){
            	$('#msg_pw_nameE').hide();
                $('#msg_pw_idE').hide();
                $('#msg_pw_emailE').show();
                event.preventDefault();
                $('#user_email_fwe').focus();
                return;
            }

            $.ajax({
                type: 'POST',
                url:  './findPwEAction' ,
                data: {
                    user_id: user_id,
                    user_name: user_name,
                    user_email: user_email
                },

                dataType: 'text',
                success: function(data) {
                    // 가입한 정보 존재 = 0 
                    // 새비밀번호 수정, 이메일 전송
                    if (data == 0) {
                    	$('#findPwE').submit();
                    }
                    // 가입한 id 정보 없음 = 1
                    else if (data == 1) {
                    	$('#msg_id_name').hide();
      					$('#msg_id_email').hide();
        				$('#msg_id_nameP').hide();
        				$('#msg_id_phone').hide();
                    	// 모달 띄움
                        $('#not_exist_msg').show();
                    }
                    
                    // 이메일이 일치하지 않음 = 2
                    else if (data == 2) {
                    	$('#msg_id_name').hide();
      					$('#msg_id_email').hide();
        				$('#msg_id_nameP').hide();
        				$('#msg_id_phone').hide();
                    	// 모달 띄움
                        $('#not_exist_msg').show();
                    }
                   	// 이름이 일치하지 않음 =3
                   	else if (data == 3) {
                   		$('#msg_id_name').hide();
      					$('#msg_id_email').hide();
        				$('#msg_id_nameP').hide();
        				$('#msg_id_phone').hide();
                    	// 모달 띄움
                        $('#not_exist_msg').show();
                   	}
                    
                    // 데이터베이스 오류 = -1
                    else if(data == -1) {
                        alert('데이터베이스 오류가 발상했습니다.')
                        history.back;
                    }
                }
            // ajax    
            });
        // btn_findPWE.click.function 
        });
        
        
        
        // 아이디 찾기/비밀번호 아이콘 표시 제이쿼리
        // 1) 아이디 찾기 아이콘 표시 제이쿼리
        $('.id_phone_icon').css({"display":"none"});
        $('.pw_phone_icon').css({"display":"none"});
        $("#findId_tab_box > input").click(function(){	
        	var chk1 = $('#tab1').is(":checked");
        	var chk2 = $('#tab2').is(":checked");
        	var chk3 = $('#pw_tab1').is(":checked");
        	var chk4 = $('#pw_tab2').is(":checked");
        	//1) 아이디찾기 - 이메일로 찾기 선택시
            if(chk1) $('.id_email_icon').css({"display":"inline-block"});
            else if(!chk1) $('.id_email_icon').css({"display":"none"});
            //2) 아이디찾기 - 휴대폰번호로 찾기 선택시 
            if(chk2) $('.id_phone_icon').css({"display":"inline-block"});
            else if(!chk2) $('.id_phone_icon').css({"display":"none"});
          	//3) 비밀번호찾기 - 이메일로 찾기 선택시 
            if(chk3) $('.pw_email_icon').css({"display":"inline-block"});
            else if(!chk3) $('.pw_email_icon').css({"display":"none"});
          	//4) 비밀번호찾기 - 휴대폰번호로 찾기 선택시 
            if(chk4) $('.pw_phone_icon').css({"display":"inline-block"});
            else if(!chk4) $('.pw_phone_icon').css({"display":"none"});
            
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
            <label for="tab1"><img class="id_email_icon" src="../../resources/images/findIdPw_icon.png" alt="">이메일로 찾기</label>
            <input type="radio" id="tab1" name="tab" checked/>            
            <label for="tab2"><img class="id_phone_icon" src="../../resources/images/findIdPw_icon.png" alt="">휴대폰 번호로 찾기</label>
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
                <P id ="msg_id_name">이름을 입력해주세요.</P>
                <p id="msg_id_email">이메일을 입력해주세요.</p>
                <input type="button" id="btn_findIdE" value="SEARCH">
              </form>
            </section>
            <!-- 휴대폰 번호로 찾기 선택시 -->
            <!-- ajax로 넘길 url : findIdPAction -->
            <section class="phone">
              <form name="findIdP" id="findIdP" method="POST" action="./findIdP">
                <div class="row">
                  <label for="user_name">이름</label>
                  <input type="text" id="user_name_IdP" name="user_name" >
                </div>
                <div class="row">
                  <label>휴대폰번호</label>
                   <input type="text" id="user_phone_IdP" name="user_phone" placeholder="- 없이 입력해주세요.">
                </div>
                <!-- 알림 문구 추가 -->
                 <P id ="msg_id_nameP">이름을 입력해주세요.</P>
                 <p id="msg_id_phone">휴대폰 번호를 입력해주세요.</p>
                <input type="button" id="btn_findIdP" value="SEARCH">
              </form>
            </section>
          </div>
        </li>
        <!-- (2) findPW -->
        <li class="findPw">
          <!-- 제목 -->
          <h2>FIND PASSWORD</h2>
          <div id="findId_tab_box">
            <!-- <label for="pw_tab1">
              <img class="pw_email_icon" src="../../resources/images/findIdPw_icon.png" alt="">
              이메일로 찾기
            </label> -->
            <input type="radio" id="pw_tab1" name="pw_tab" checked/>            
           <!--  <label for="pw_tab2"><img class="pw_phone_icon" src="../../resources/images/findIdPw_icon.png" alt="">휴대폰 번호로 찾기</label> -->
            <input type="radio" id="pw_tab2" name="pw_tab" disabled/> 
            <!-- ------------------------------------ -->
            <!-- 위의 탭박스 선택에 따라 아래 탭 컨텐츠 달라짐 -->
            <!-- 이메일로 찾기 선택시 -->
            <section class="pw_email">
            <form name="findPwE"  id="findPwE" method="POST" action="./findPwE">
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
                <!-- 알림 문구 추가 -->
                 <P id="msg_pw_nameE">이름을 입력해주세요.</P>
                 <p id="msg_pw_idE">아이디를 입력해주세요.</p>
                 <p id="msg_pw_emailE">이메일을 입력해주세요.</p>
                <input type="button" id="btn_findPWE" value="SEARCH">
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
                <div class="row">
                  <label>휴대폰번호</label>
                  <input type="text" id="user_phone_2" name="user_phone_2" placeholder="- 없이 입력해주세요.">
                </div>
                <!-- 알림 문구 추가 -->
                 <P id="msg_pw_nameP">이름을 입력해주세요.</P>
                 <p id="msg_pw_idP">아이디를 입력해주세요.</p>
                 <p id="msg_pw_phoneP">휴대폰번호를 입력해주세요.</p>
                <input type="button" id="btn_findPwP" value="SEARCH">
             </form>
            </section>
            
          </div>
        </li>
       </ul>       
      </section>
      <!-- --------------모달---------------- -->
		<!-- 모달 띄울 때 display: block; -->
		<div id="not_exist_msg" style="display:none;">
		<!-- 아이디찾기, 비밀번호 찾기 조회 실패시 전부 사용하기위해 내용 수정 
		    <h3>입력하신 정보로 가입된 회원 아이디는<br>존재하지 않습니다.</h3>--> 
		    <h3>입력하신 정보로 정확한 <br>회원정보가 조회되지 않습니다.</h3>
		    <a href="../find">확인</a>
		</div>
    </div>
    
<script>
	$(document).ready(function(){
		var msg = '${msg}';
		if(msg != null && msg != '') alert(msg);
	});
</script>
  </body>
</html>