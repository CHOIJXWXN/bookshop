    $(document).ready(function(){
    	
        $('#msg_id').hide();
         $('#msg_pw').hide();
         $('#msg1').hide();
         $('#msg2').hide();
         
        $('#btn_login').click(function(){
            var user_id = $('#user_id').val();
            var user_pw = $('#user_pw').val();
             
            if(user_id == '') {
                $('#msg_id').show();
                $('#msg_pw').hide();
                $('#msg1').hide();
                 $('#msg2').hide();
                $('#user_id').focus();
                 
                return;
            }
            else if(user_pw == '') {
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
                    if(data == 0 || data == 1) {
                    	var pre_page = $('input[name=pre_page]').val();
                    	if (pre_page != '') {
                    		if (pre_page == '/findIdP' || pre_page == '/findIdE' || pre_page == '/findPwEAction') {
                    			location.href = '../';
                    			sessionStorage.removeItem('pre_page');
                    		} else {
	                    		location.href = pre_page;
	                    		sessionStorage.removeItem('pre_page');
	                    	}
                    	} else {
                    		location.href = '../';
                    	}
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

        // 쿠키
        $(function(){
        // 저장된 쿠키값을 가져와 id 칸에 넣어줌 
        var cookie_user_id = getCookie('cookie_user_id');
        $('#user_id').val(cookie_user_id);
        
        // 입력칸에 저장된 id가 불러오면, 체크 란에 check 해둠
        // 기본값으로 아이디 저장 체크 해두고 싶을때 주석 해제
         
        if($('#user_id').val != '') {
            $('#save_id').attr('checked', true);
        }
        
        // 체크박스에 변화
        $('#save_id').change(function() {
            // id 저장하기 체크했을 시
            if($('#save_id').is(':checked')) {
                var user_id = $('#user_id').val();
                setCookie('cookie_user_id', user_id, 7);
            }
            else {
            	deleteCookie('cookie_user_id');
            }
        // save_id.change.funciton
        });
        $('#user_id').keyup(function() {
            if($('#save_id').is(':checked')) {
                var user_id = $('#user_id').val();
                setCookie('cookie_user_id', user_id, 7);
            }
            else {
            	deleteCookie('cookie_user_id');
            }
        // user_id.keyup.function    
        });
        // 쿠키 function
        });

        // 쿠키 저장
        function setCookie(cookieName, value, exdays){
            var exdate = new Date();
            exdate.setDate(exdate.getDate() + exdays);
            var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
            document.cookie = cookieName + "=" + cookieValue;
        }

        // 쿠키 불러오기
        function getCookie(cookieName) {
            cookieName = cookieName + '=';
            var cookieData = document.cookie;
            var start = cookieData.indexOf(cookieName);
            var cookieValue = '';
            if(start != -1){
                start += cookieName.length;
                var end = cookieData.indexOf(';', start);
                if(end == -1)end = cookieData.length;
                cookieValue = cookieData.substring(start, end);
            }
            return unescape(cookieValue);
        }

        // 쿠키 삭제
        function deleteCookie(cookieName){
            var expireDate = new Date();
            expireDate.setDate(expireDate.getDate() - 1);
            document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
        }

       // document.ready.function
    });