$(document).ready(function() {
    // id hide
     $('#id_pass').hide();
     $('#id_fail').hide();
     $('#id_check').hide();
    // pw hide
     $('#pw_pass').hide();
     $('#pw_fail').hide();
     $('#pw_check').hide();
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
            sessionStorage.setItem('joinFlag', 0);
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
       var id_idreg_flag = false;
         $('#user_id').keyup(function (){
            var idReg = /^[a-z0-9]{4,15}$/;
            var user_id = $('#user_id').val();
         if(!idReg.test(user_id)) {
            // alert("아이디는 4~14자리의 영어 소문자 와 숫자로만 입력가능 합니다.");
            $('#id_pass').parent('div').removeClass('row');
            $('#id_pass').parent('div').addClass('row_msg');
            $('#id_pass').hide();
            $('#id_fail').hide();
            $('#id_check').show();
            $('#user_id').focus();
             id_idreg_flag = false;
             id_check_flag = false;
        }
        else if(idReg.test(user_id)) {
            // alert("아이디는 4~14자리의 영어 소문자 와 숫자로만 입력가능 합니다.");
            $('#id_pass').parent('div').removeClass('row');
            $('#id_pass').parent('div').addClass('row_msg');
            $('#id_pass').hide();
            $('#id_fail').hide();
            $('#id_check').hide();
            $('#user_id').focus();
            id_idreg_flag = true;
            id_check_flag = false;
        }
    // user_id keyup function
    });
        $('#checkId').click(function(){
           var user_id = $('#user_id').val();

           if(user_id == '') {
               alert('아이디를 입력하세요.');
                $('#user_id').focus();
                $('#id_pass').hide();
                $('#id_check').hide();
               return;
           }
           else if (!id_idreg_flag) {
               alert('아이디 입력양식을 확인해주세요.');
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
                   $('#id_pass').parent('div').removeClass('row');
                   $('#id_pass').parent('div').addClass('row_msg');
                   $('#id_pass').show();
                   $('#id_fail').hide();
                   $('#id_check').hide();
                   id_check_flag = true;
                 }
               // 사용중인 id (database에 동일 id 있음)
               // service impl result 1 (!null): data == 1
                  else if(data == 1) {
                   $('#id_fail').parent('div').removeClass('row');
                   $('#id_fail').parent('div').addClass('row_msg');
                   $('#id_pass').hide();
                   $('#id_fail').show();
                   $('#id_check').hide();
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
    $('#pw_pass').hide();
   	$('#pw_fail').hide();
    $('#pw_check').hide();

    $('#user_pw').keyup(function() {
        var user_pw = $('#user_pw').val();
        var pwReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
        var blank = /[\s]/g;
        
        $('#user_pw').val($('#user_pw').val().replace(blank, ''));
        
        if(!pwReg.test(user_pw)){
            $('#pw_check').parent('div').removeClass('row');
            $('#pw_check').parent('div').addClass('row_msg');
            $('#pw_fail').hide();
            $('#pw_pass').hide();
            $('#pw_check').show();
        } else if (pwReg.test(user_pw)){
            $('#pw_check').parent('div').removeClass('row');
            $('#pw_check').parent('div').addClass('row_msg');
            $('#pw_fail').hide();
            $('#pw_pass').hide();
            $('#pw_check').hide();
        }
    // user_pw.keyup.function
    });

    $('#user_pw2').keyup(function(){
        var user_pw = $('#user_pw').val();
        var user_pw2 = $('#user_pw2').val();
        var blank = /[\s]/g;

        $('#user_pw2').val($('#user_pw2').val().replace(blank, ''));
 	    if(user_pw != user_pw2) {
 	        $('#pw_pass').parent('div').removeClass('row');
            $('#pw_pass').parent('div').addClass('row_msg');
            $('#pw_pass').hide();
            $('#pw_fail').show();
            $('#pw_check').hide();
            pw_check_flag = false;
        }
        else if (user_pw2 == '') {
            $('#pw_pass').parent('div').removeClass('row');
            $('#pw_pass').parent('div').addClass('row_msg');
            $('#pw_fail').hide();
            $('#pw_pass').hide();
            $('#pw_check').hide();
            pw_check_flag = false;
        }
       else if (user_pw == user_pw2) {
             $('#pw_pass').parent('div').removeClass('row');
             $('#pw_pass').parent('div').addClass('row_msg');
             $('#pw_pass').show();
             $('#pw_fail').hide();
             $('#pw_check').hide();
             pw_check_flag = true;
         }
     // user_pw2 keyup function    
     });
   //function
 });

 // 이름에 특수문자, 숫자 들어가지 않도록
 $(function() {
      // 특수문자 정규식 변수
      var replaceChar = /[~!@\#$%^&*\()\-=+_'\;<>0-9\/.\`:\"\\,\[\]?|{}\s]/gi;
      // 완성형 아닌 한글 정규식
      var replaceNotFullKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;
      
      $('#user_name').on('focusout', function() {
        var user_name = $('#user_name').val();
        if (user_name.length > 0) {
            if (user_name.match(replaceChar) || user_name.match(replaceNotFullKorean)) {
                user_name = user_name.replace(replaceChar, '').replace(replaceNotFullKorean, '');
            }
            $('#user_name').val(user_name);
        }
      }).on("keyup", function() {
            $('#user_name').val($('#user_name').val().replace(replaceChar, ''));
          //keyup.function  
         });
      //이름 관련 functon   
});

// 생년 월일 숫자 8글자만 입력가능
$(function() {
    $('#user_birth').keyup(function() { 
        var blank = /[\s]/g;
        $('#user_birth').val($('#user_birth').val().replace(blank, ''));  
    // user_birth.keyup.function
    });

//생년월일 관련 function
});

// 닉네임
$('#user_nickname').keyup(function(){
    var blank = /[\s]/g;
     $('#user_nickname').val($('#user_nickname').val().replace(blank, ''));
});

 // 이메일 중복 확인(checkEmail)
 $(function(){
    $('#user_email_id').keyup(function(){
        var blank = /[\s]/g;
         $('#user_email_id').val($('#user_email_id').val().replace(blank, ''));
    });
    $('#user_email_domain').keyup(function(){
        var blank = /[\s]/g;
        $('#user_email_domain').val($('#user_email_domain').val().replace(blank, ''));
       /*
        var user_email_domain =  $('#user_email_domain').val();
         var eamil_reg_flag = false;
        var email_reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

        if(!user_email_domain.match(email_reg)) {
             eamil_reg_flag = false;
         }else if(user_email_domain.match(email_reg)) {
              eamil_reg_flag = true;
        }*/
        
    });

     $('#user_email_domain_S').change(function(){
        if($('#user_email_domain_S').val() == '') {
        $('#user_email_domain').val('');
       	$('#user_email_domain').attr('readonly', false);
       
        } else {
            $('#user_email_domain').val($('#user_email_domain_S').val());
            $('#user_email_domain').attr('readonly', true);
        }
        
     // user_email_domain_S.change.fucntion
     });

     

     $('#checkEmail').click(function(){
         var user_email = $('#user_email_id').val() + '@' + $('#user_email_domain').val();
         var user_email_id = $('#user_email_id').val();
         var user_email_domain = $('#user_email_domain').val();
         
         if(user_email_id == '') {
             alert('이메일을 입력하세요.');
             $('#user_email_id').focus();
             email_check_flag = false;
             return;
         }
        if(user_email_domain == '') {
            alert('이메일을 입력하세요.');
            $('#user_email_domain').focus();
            email_check_flag = false;
            return;
        }
        else if (!eamil_reg_flag) {
            alert('이메일 주소를 다시 확인하세요');
            email_check_flag = false;
            return;
        }
 
         $.ajax({
             type: 'GET',
             url: './checkEmail',
             data: {user_email : user_email},
 
             dataType: 'text',
             success: function(data) {
              // 사용 가능한 email (database에 동일 email이 없음)
              // service impl 에서 result 0 (null): data == 0, 
              if(data == 0) {
              	 $('#email_pass').parent('div').removeClass('row');
                 $('#email_pass').parent('div').addClass('row_msg');
                 $('#email_pass').show();
                 $('#email_fail').hide();
                 email_check_flag = true;
              }
              // 사용중인 email (database에 동일 email 있음)
              // service impl result 1 (!null): data == 1
              else if(data == 1) {
                 $('#email_pass').parent('div').removeClass('row');
                 $('#email_pass').parent('div').addClass('row_msg');
                 $('#email_pass').hide();
                 $('#email_fail').show();
                 $('#user_email').attr('value', '');
                 email_check_flag = false;
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

    // 휴대폰 번호 숫자만 입력
    $('#user_phone').keyup(function() {
        $('#user_phone').val($('#user_phone').val().replace(/[^0-9]/g, ''));
    });


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
 