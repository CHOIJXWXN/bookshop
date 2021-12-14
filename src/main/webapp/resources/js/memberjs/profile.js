 $(document).ready(function(){
        var pw_check_flag = false;
        var em_check_flag = false;

      // user_pw2 id를 가지는 HTML태그에서 VALUE값을 가져옴
      $("#user_pw2").change(function(){
        var user_pw = $("#user_pw").val();
        var user_pw2 = $("#user_pw2").val();
        //비밀번호 불일치
        if(user_pw != user_pw2) {
          $(".pw_check").find(".fail").addClass("on");
          $(".pw_check").find(".pass").removeClass("on");
          pw_check_flag = false;
        } else {
        // 비밀번호 일치
          $(".pw_check").find(".fail").removeClass("on");
          $(".pw_check").find(".pass").addClass("on");
          pw_check_flag = true;
        }
      });
});