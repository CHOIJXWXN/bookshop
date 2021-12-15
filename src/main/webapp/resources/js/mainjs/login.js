 $(document).ready(function(){
    	  
        $('form').submit(function(event){
            // id 가 user_id, user_pw 인 태그에 입력한 값을 받아옴
            var user_id = $('#user_id').val();
            var user_pw = $('#user_pw').val();

            // id, pw를 입력하지 않으면 입력하라고 알리고 커서를 옮김
            if(user_id == "") {
                alert('아이디를 입력하세요');
                $('#user_id').focus();
                return;
            }
            if(user_pw == "") {
                alert('비밀번호를 입력하세요');
                $('#user_pw').focus();
                return;
            }
         	 else{
           		 var msg = '아이디 또는 비밀번호가 일치하지 않습니다.';
    			 if(msg != null && msg != '') alert(msg);
             }
       
          
        //form.submit function    
        });
     // doucument.ready.function 
    });
    