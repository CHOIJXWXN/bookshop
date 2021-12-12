$(document).ready(function() {
	
	// 리뷰 라디오 체크 시 리뷰 불러오기
	$('#reviewTab').change(function() {
		if($('#reviewTab').is(':checked')) {
			$.ajax({
				type : "GET",
				url : "./review",
				data : {
					book_id : book_id
				},
				dataType : "json",
				success : function(data) {
					if (data == null) {
						alert('리뷰가 없습니다');
						return;
					} else {
						var list = data.get("list");		// 리뷰 리스트
						var paging = data.get("paging");	// 리뷰 페이징
						var cnt = data.get("cnt");			// 리뷰 총 개수
						var score = data.get("score")/10;		// 리뷰 평균 점수
						
						var str1 = '';
						str1 += '<span>등록된 리뷰 수 : ' + cnt + '개</span>';
						str1 += '<span>&nbsp;&nbsp;평점 평균 : ' + score + '점</span>';
						$('.review_status').append(str1);
						
						for (var i = 0; i < list.length; i++) {
							var str2 = '';
							str2 += '<div class="review_row">';
							str2 += '<div class="review_writer">';
							str2 += '<span>' + list.user_id + '</span>';
							str2 += '<span>' + list.review_date + '</span>';
							str2 += '</div>';
							str2 += '<div class="review_star">;
							str2 += '<i class="far fa-star"></i>';
							str2 += '<i class="far fa-star"></i>';
							str2 += '<i class="far fa-star"></i>';
							str2 += '<i class="far fa-star"></i>';
							str2 += '<i class="far fa-star"></i>';
							str2 += '</div>';
							str2 += '<div class="view_review">';
							str2 += '<p>' + list.review_contents + '</p>';
							str2 += '</div>';
							str2 += '</div>';
							
						}
					}
				},
				error : function(data) {
				
				}
			});
		}
	});
	
	// 리뷰 추가하기
	$('#ㅁㅁㅁ').onclick(function() {
		var review_contents = $('#ㅇㅇㅇ').val();
		var review_score = $('#').val();
		$.ajax({
			type : "GET",
			url : "./addReview",
			data : {
				user_id : user_id,
				book_id : book_id,
				review_contents : review_contents,
				review_score : review_score
			},
			dataType : "json",
			success : function(data) {
				var list = data.get("list");		// 리뷰 리스트
				var paging = data.get("paging");	// 리뷰 페이징
				var cnt = data.get("cnt");			// 리뷰 총 개수
				var score = data.get("score");		// 리뷰 평균 점수
				for (var i = 0; i < list.length; i++) {
					var str = '';
				}
			},
			error : function(data) {
				
			}
		});
	});
	
	// 수량에 따른 가격/포인트/배송비/총가격 변화
	var price = parseInt($('#price').text());
	$('#book_price').text(price + '원');
	$('#point').text('포인트 +' + price * 0.05 + '원(5%)');
	if (price >= 20000) {
		$('#shippingCost').text('무료배송');
	} else {
		$('#shippingCost').text('3000원 (20000원 이상 구매시 배송비 무료)');
	}
	var shippingCost = parseInt($('#shippingCost').text());
	$('#book_total_price').text(price + shippingCost + '원');
	
	$('#book_cnt').change(function() {
		var cnt = parseInt($('#book_cnt').val());
		$('#book_price').text(price * cnt + '원');
		$('#point').text('포인트 +' + price * cnt * 0.05 + '원(5%)');
		if (price * cnt >= 20000) {
			$('#shippingCost').text('무료배송');
		} else {
			$('#shippingCost').text('3000원 (20000원 이상 구매시 배송비 무료)');
		}
		var shippingCost = parseInt($('#shippingCost').text());
		$('#book_total_price').text(book_price + shippingCost + '원');
	});
	
});