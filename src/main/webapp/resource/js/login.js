// login ajax
	// 유저 아이디/비밀번호 확인
	// 맞으면 return 0	view에서 data == 0이면  
	// location.href 써서 메인 페이지로
	// 틀리면 return -1	view에서 data == -1이면 정보 불일치 띄우기

$(document).ready(function () {
	
	var id_check_flag = false;
	var pw_check_flag = false;
	
	// loginAction id를 가지는 HTML 태그가 클릭되었을때
	$('#loginAction).click(function() {
		var user_id = $('#user_id).val();
		var user_pw = $('#user_pw).val();
		
		if(user_id == '') {
			alert('아이디를 입력하세요.');
			return;
		}
		if(user_pw == '') {
			alert('비밀번호를 입력하세요.);
			return;
		}
		
		// 비동기 통신 
		$.ajax({
			// 전송부
			type : 'GET'
			url : './loginAction'
			data : {user_id:user_id, user_pw:user_pw}
			dataType : 'text'
			success : function(data) {
				if(data == 0) {
					
				}
				if(data == -1) {
				
				}
			}
		
		});
		
	});

	// 아이디 찾기 버튼 누를시
	// $(' 




// 마지막
});