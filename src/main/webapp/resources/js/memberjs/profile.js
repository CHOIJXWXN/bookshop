 $(document).ready(function(){
 	
 	if (sessionStorage.getItem('profileFlag') != 0) {
    	alert('비밀번호 확인이 필요합니다');
    	location.href='./checkUser';
    } else {
    	sessionStorage.removeItem('profileFlag');
    }
 
        var pw_check_flag = true;

      
      // 비밀번호 불일치 검증 함수
      function checkPassword(){
      	var user_pw = $("#user_pw").val();
        var user_pw2 = $("#user_pw2").val();
        var pwReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
        var blank = /[\s]/g;
        
        $('#user_pw').val($('#user_pw').val().replace(blank, ''));
        $('#user_pw2').val($('#user_pw2').val().replace(blank, ''));
        
        if(!pwReg.test(user_pw)) {
          $(".pw").removeClass("row");
          $(".pw").addClass("row_msg");
          $(".pw").find(".form_check").addClass("on");
          pw_check_flag = false;
        } else if(pwReg.test(user_pw)){
          $(".pw").find(".form_check").removeClass("on");
          $(".pw").removeClass("row_msg");
          $(".pw").addClass("row");
          pw_check_flag = true;
        }
        
        //비밀번호 불일치
        if(user_pw != user_pw2) {
          $(".pw_check").removeClass("row");
          $(".pw_check").addClass("row_msg");
          $(".pw_check").find(".fail").addClass("on");
          pw_check_flag = false;
        } else {
        // 비밀번호 일치
          $(".pw_check").find(".fail").removeClass("on");
          $(".pw_check").removeClass("row_msg");
          $(".pw_check").addClass("row");        
          pw_check_flag = true;
        }
        
        
      
     }
      
      
      $("#user_pw").keyup(function(){   
        var pw_check_flag = false;  
      	checkPassword();
      	if($("#user_pw").val() == "") {
        	$(".pw").find(".form_check").removeClass("on");
        	$(".pw").removeClass("row_msg");
        	$(".pw").addClass("row");
        }  
      	
      });
      
      $("#user_pw2").keyup(function(){  
        var pw_check_flag = false;    
      	checkPassword(); 
      });
      
      
    // 이름에 특수문자, 숫자 들어가지 않는지 검증
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
         });
      
    // 닉네임 공백 제외
    $('#user_nickname').keyup(function(){
	    var blank = /[\s]/g;
	    $('#user_nickname').val($('#user_nickname').val().replace(blank, ''));
	});
	
	// 휴대폰 번호 숫자만 입력
	$('#user_phone').keyup(function() {
        $('#user_phone').val($('#user_phone').val().replace(/[^0-9]/g, ''));
    });
    
      
    // form 태그가 sumbit 이벤트를 발생시켰을 때
	$('form').submit(function(event){
		var user_name   = $('#user_name').val();
		var user_phone  = $('#user_phone').val();
		var addr_3       = $('#addr_3').val();
		var user_title = $('#user_title').val();
		
		if(user_name == "" || user_phone == "" || addr_3 == "" || user_title == "") {
			alert('모든 값을 입력하세요.');
			event.preventDefault();
			return;
		}
		
		if(!pw_check_flag) { 
			alert('비밀번호를 다시 확인해주세요.');
			event.preventDefault();
			return;
		}
		sessionStorage.setItem('profileFlag', 0);
		
	});
      
});