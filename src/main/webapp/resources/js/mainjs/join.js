$(document).ready(function() {
    // id hide
     $('#id_pass').hide();
     $('#id_fail').hide();
    // pw hide
     $('#pw_pass').hide();
     $('#pw_fail').hide();
    // email hide
     $('#email_pass').hide();
     $('#email_fail').hide(); 

  
  // [1] 약관동의 체크 
 $(function(){
     // 모두 동의 체크시 각 항목 체크
     $("#check_btns_group").on("click","#chk_all", function(){
         // 모두 동의가 체크면 개별약관도 모두 체크
         $(this).parents("#check_btns_group").find("input").prop("checked", $(this).is(":checked"));
          
     });
     // 체크 박스 개별 선택
     $("#check_btns_group").on("click", ".normal", function(){
         
         // 개별 약관 중 하나라도 미체크시 모두 동의 체크 해제
         var is_checked = true;
 
         $("#check_btns_group .normal").each(function(){
             is_checked = is_checked && $(this).is(":checked");
         });
 
         $("#chk_all").prop("checked", is_checked);  
     });
     
     //약관동의 모두 체크했는지 검증하는 함수
     
    $('#next').click(function() {
         var ck = $("#chk_all").prop("checked");
         if(!ck) {
             alert("모든 약관 동의 후 회원가입 가능합니다.");
             return;
         } else {
             location.href = "../join";
         }
     });
 }); 
     
  
 // [2] 회원가입 관련 

     var id_check_flag = false;
     var pw_check_flag = false;
     var email_check_flag = false;
    // var phone_check_flag = false;

    // id중복체크 checkId
    $(function(){
      $('#checkId').click(function(){
         var user_id = $('#user_id').val();
         if(user_id == '') {
             alert('아이디를 입력하세요.');
             return;
         }
         $.ajax({
             type: 'GET',
             url: './checkId',
             data: {user_id: user_id},
 
             dataType: 'text',
             success: function(data) {
             // 사용 가능한 id (database에 동일 id가 없음)
             // service impl 에서 result 0 (null): data == 0, 
               if(data == 0) {
                 $('#id_pass').show();
                 $('#id_fail').hide();
                 id_check_flag = true;
               }
             // 사용중인 id (database에 동일 id 있음)
             // service impl result 1 (!null): data == 1
                else if(data == 1) {
                 $('#id_pass').hide();
                 $('#id_fail').show();
                 $('#user_id').attr('value', '');
             }
             // 데이터베이스 오류
                  else {
                   alert('데이터베이스 오류가 발생했습니다.');
                 }
          },
          error : function() { // 통신에 실패했을 경우
              alert('중복확인 실패');
          }
      // ajax
      });
     // checkId click function
     });
 });  
     
     
  // 비밀번호 일치 확인 (user_pw2를 가지는 태그 변경)   
 $(function(){
      $('#user_pw2').change(function(){
         var user_pw = $('#user_pw').val();
         var user_pw2 = $('#user_pw2').val();
 
         if(user_pw != user_pw2) {
             $('#pw_pass').hide();
             $('#pw_fail').show();
             pw_check_flag = false;
         }
         else if (user_pw == user_pw2) {
             $('#pw_pass').show();
             $('#pw_fail').hide();
             pw_check_flag = true;
         }
     // user_pw2 change function    
     });
   //function
 });
     
 
 // 이메일 중복 확인(checkEmail)
 $(function(){
     $('#checkEmail').click(function(){
         var user_email = $('#user_email').val();
         
         if(user_email == '') {
             alert('이메일을 입력하세요.');
             return;
         }
 
         $.ajax({
             type: 'GET',
             url: './checkEmail',
             data: {user_email : user_email},
 
             dataType: 'TEXT',
             success: function(data) {
              // 사용 가능한 email (database에 동일 email이 없음)
              // service impl 에서 result 0 (null): data == 0, 
              if(data == 0) {
                 $('#email_pass').show();
                 $('#email_fail').hide();
                 email_check_flag = true;
              }
              // 사용중인 email (database에 동일 email 있음)
              // service impl result 1 (!null): data == 1
              else if(data == 1) {
                 $('#email_pass').hide();
                 $('#email_fail').show();
                 $('#user_email').attr('value', '');
              }
              else {
                  alert('데이터베이스 오류가 발생했습니다.');
              }
             },
             error : function() { // 통신에 실패했을 경우
                 alert('중복확인 실패');
             }
         // ajax    
         });
     // checkEmail click function     
     });
     // function
    });

    // 휴대폰 번호 인증
 


     // [] 회원가입 유효성 확인
	// submit 이벤트 발생 (회원가입 유효성 검사)
    $(function(){
   	$('form').submit(function(event){
        var user_id = $('#user_id').val();
        var user_pw = $('#user_pw').val();
        var user_name = $('#user_name').val();
        var user_birth = $('#user_birth').val();
        var user_nickname = $('#user_nickname').val();
        var user_email = $('#user_email').val();
        var user_phone = $('#user_phone').val();
        var addr_1 = $('#addr_1').val();
        var addr_2 = $('#addr_2').val();
        var addr_3 = $('#addr_3').val();
        var user_init_genre = $('input[type=radio][name=user_init_genre]:checked').val();

        if(user_id == "" || user_pw == "" || user_name == "" || user_email =="" ||
        user_phone == "" || addr_1 == "" || addr_2 == "" || addr_3 == "" || user_init_genre == "")  {
            alert('필수 항목을 입력해주세요!');
            event.preventDefault();
            return;
        }
        if(!id_check_flag) {
            alert('아이디 중복체크를 해주세요');
            event.preventDefault();
            return;
        }
        if(!pw_check_flag) {
            alert('비밀번호를 확인해주세요');
            event.preventDefault();
            return;
        }
        if(!email_check_flag) {
            alert('이메일 중복체크를 해주세요');
            event.preventDefault();
            return;
        }
        
        /*
        if(!phone_check_flag) {
            alert('휴대폰 인증을 해주세요');
            event.preventDefault();
            return;
        }
        */

       // submit function  
       });
       //function
    });
     
 // 최상위 ready function
});
 