
$(document).ready(function(){
	// 아이디찾기 -이메일 이용
    $('#Btn_findIdE').click(function(event) {
        var user_name  = $('#user_name_IdE').val();
        var user_email = $('#user_email_IdE').val();

        if(user_name == "") {
            alert('이름을 입력하세요');
            event.preventDefault();
            $('#user_name_IdE').focus();
            return;
        }
        else if(user_email == ""){
            alert('이메일을 입력하세요.');
            event.preventDefault();
            $('#user_email_IdE').focus();
            return;
        }

        $.ajax({
            type: 'POST',
            url: './findIdE',
            data: {
                user_name: user_name,
                user_email: user_email
                },
            
            dataType:'text',
            success: function(data) {
                if(data == 0) {
                    location.href="../findIdE";
                }
                else if(data == -1) {
                    $('#not_exist_msg').style.display = "block";
                }
            }            

        });
        $('#findIdE').submit();
    // Btn_findIdE.click.function
    });
    
    // 비밀번호 찾기
    $('#Btn_findPWE').click(function(event) {
        var user_id_fwe = $('#user_id_fwe').val();
        var user_name_fwe = $('#user_name_fwe').val();
        var user_email_fwe = $('#user_email_fwe').val();

        if(user_id_fwe == "") {
            alert('아이디를 입력하세요');
            event.preventDefault();
            $('#user_id_fwe').focus();
            return;
        }
        else if(user_name_fwe == "") {
            alert('이름을 입력하세요');
            event.preventDefault();
            $('#user_name_fwe').focus();
            return;
        }
        else if(user_email_fwe == ""){
            alert('이메일을 입력하세요.');
            event.preventDefault();
            $('#user_email_fwe').focus();
            return;
        }

        $('#findPW_email').submit();
    // Btn_findPWE.click.function
    });

// doucument.ready.function
});