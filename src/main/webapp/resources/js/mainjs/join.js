$(function(){ 
    // [1] 약관동의 체크 
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
    
    // [2] 아이디 중복 확인
	

	// [3] 회원가입 유효성 확인
	$('#joinSuccess').click(function() {
		
	});
	
});


