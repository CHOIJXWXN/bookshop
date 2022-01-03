$(document).ready(function() {
	
	var pageNumber = 1;
	
	$('#prev').parent('li').hide();
	$('#next').parent('li').hide();
	
	function getReview(data) {
		if (data == null) {
			alert('리뷰를 불러올 수 없습니다');
			return;
		} else {
			var list = data.list;			// 리뷰 리스트
			var paging = data.paging;		// 리뷰 페이징
			var cnt = data.cnt;				// 리뷰 총 개수
			var score = data.score / 10;	// 리뷰 평균 점수
			
			if (paging.pageNumber == 1) {
			    $('#prev').parent('li').css({"display":"none"});
			}
			else {
				$('#prev').parent('li').css({"display":"block"});
			}
						
			if (paging.next) {
				$('#next').parent('li').css({"display":"block"});
			} else {
				$('#next').parent('li').css({"display":"none"});
			}
			
			pageNumber = paging.pageNumber;
			
			var str1 = '';
			str1 += '<span>등록된 리뷰 수 : ' + cnt + '개</span>';
			str1 += '<span>&nbsp;&nbsp;평점 평균 : ' + score + '점</span>';
			$('.review_status').empty();
			$('.review_status').append(str1);
			$('.review_list').empty();
			
			for (var i = 0; i < list.length; i++) {		
				// 회원 아이디의 3, 4번째 문자를 *로 치환 (abcdefg -> ab**efg)
				var user_id = list[i].user_id;
				var id1 = user_id.substr(0, 2);
				var id2 = '**';
				var id3 = user_id.substr(4, user_id.length - 4);
				var id = id1 + id2 + id3;
				
				var str2 = '';
				str2 += '<div class="review_row">';
				str2 += '<div class="review_writer">';
				str2 += '<span>' + id + '</span>';
				str2 += '<span>' + list[i].review_date + '</span>';
				str2 += '</div>';
				str2 += '<div class="review_star">';
				for (var j = 0; j < list[i].review_score; j++) {
					str2 += '<label class="fas fa-star" style="-webkit-text-fill-color: yellow; -webkit-text-stroke-width: 0.8px; margin-right:2px;"></label>';
				}
				str2 += '</div>';
				str2 += '<div class="view_review">';
				str2 += '<p>' + list[i].review_contents + '</p>';
				str2 += '</div>';
				str2 += '</div>';
				$('.review_list').append(str2);						
			}											
		}
	};
	
	function pagingAjax(page_Num) {	
		if($('#tab3').is(':checked')) {
			var book_id = $('input[type=hidden][name=book_id]').val();
			$.ajax({
				type : "POST",
				url : "./review",
				data : {
					book_id : book_id,
					pageNumber : page_Num
				},
				dataType : "json",
				success : function(data){
					getReview(data);
				},
				error : function(data) {
					alert('리뷰 보기에 실패했습니다');
				}
			});
		}	
	};
	
	// 리뷰 라디오 체크 시 리뷰 불러오기
	$('#tab3').change(function() {
		if ($(this).is(':checked')) {
			var book_id = $('input[type=hidden][name=book_id]').val();
			$.ajax({
				type : "POST",
				url : "./review",
				data : {
					book_id : book_id
				},
				dataType : "json",
				success : function(data){
					getReview(data);
				},
				error : function(data) {
					alert('리뷰 보기에 실패했습니다');
				}
			});
		}
	});
	
	// 리뷰 추가하기
	$('#upload_review').click(function() {
		var user_id = $('input[type=hidden][name=user_id]').val();
		var book_id = $('input[type=hidden][name=book_id]').val();
		var review_contents = $('#write_review_box').val();
		var review_score = $('input[type=radio][name=rating]:checked').val();
		if (review_contents == '') {
			alert('리뷰를 적으세요');
			return;
		}
		$.ajax({
			type : "POST",
			url : "./addReview",
			data : {
				user_id : user_id,
				book_id : book_id,
				review_contents : review_contents,
				review_score : review_score
			},
			dataType : "json",
			success : function(data) {
				if (data.flag == 0) {
					getReview(data);
				} else if (data.flag == 1) {
					alert('이미 작성된 리뷰가 있습니다');
				}
				$('#write_review_box').val('');
			},
			error : function(data) {
				alert('리뷰 추가에 실패했습니다');
			}
		});
	});
	
	// 수량에 따른 가격/포인트/배송비/총가격 변화
	var price = parseInt($('#price').text());
	var shippingCost = 3000;
	$('#book_price').text(price + '원');
	$('#point').text('포인트 +' + price * 0.05 + '원(5%)');
	if (price >= 20000) {
		$('#shippingCost').text('무료배송');
		shippingCost = 0;
	} else {
		$('#shippingCost').text('3000원 (20000원 이상 구매시 배송비 무료)');
	}
	$('#book_total_price').text(price + shippingCost + '원');
	
	$('.book_num').change(function() {
		var cnt = parseInt($('.book_num').val());
		var shippingCost = 3000;
		$('#book_price').text(price * cnt + '원');
		$('#point').text('포인트 +' + price * cnt * 0.05 + '원(5%)');
		if (price * cnt >= 20000) {
			$('#shippingCost').text('무료배송');
			shippingCost = 0;
		} else {
			$('#shippingCost').text('3000원 (20000원 이상 구매시 배송비 무료)');
		}
		$('#book_total_price').text(price * cnt + shippingCost + '원');
	});
	
	
	$('.cart_modal').hide();
	// cart 모달 닫기
	$('.fa-times-circle').click(function(){
          $('.cart_modal').hide();
    });
	// add to cart 버튼 클릭 시 비동기 추가
	$('#addCart').click(function() {
		var user_id = $('input[name=user_id]').val();
		var book_id = $('input[name=book_id]').val();
		var book_cnt = $('select[name=book_cnt]').val();
		if (user_id == '') {
			alert('로그인이 필요합니다');
			location.href = '../login';
			return;
		}
		$.ajax({
			type : "POST",
			url : "/order/addCart",
			data : {
				user_id : user_id,
				book_id : book_id,
				book_cnt : book_cnt
			},
			dataType : "text",
			success : function(data) {
				$('.cart_modal').show();
			},
			error : function(data) {
				alert('이미 담긴 책입니다');
			}
		});	
	});
	
	$('#next').click(function(e){
		e.preventDefault();		
		pagingAjax(pageNumber + 1);
	});
	
	$('#prev').click(function(e){
		e.preventDefault();		
		pagingAjax(pageNumber - 1);
	});
		
});