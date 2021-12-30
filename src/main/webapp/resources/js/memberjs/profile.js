 $(document).ready(function(){
 
        var pw_check_flag = true;

      
      // 비밀번호 불일치 검증 함수
      function checkPassword(){
      	var user_pw = $("#user_pw").val();
        var user_pw2 = $("#user_pw2").val();
        var pwReg = /^[A-za-z0-9~!@#$%^&*()_+|<>?:{}]{8,16}$/;
        
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
		
	});
      
});