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
						var list = data.list;			// 리뷰 리스트
						var paging = data.paging;		// 리뷰 페이징
						var cnt = data.cnt;				// 리뷰 총 개수
						var score = data.score / 10;	// 리뷰 평균 점수
						
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
							str2 += '<div class="review_star">';
							for (var j = 0; j < list.review_score; j++) {
								str2 += '<label class="star" style="-webkit-text-fill-color: yellow;">★</label>';
							}
							for (var k = 0; k < 5 - list.review_score; k++) {
								str2 += '<label class="star">★</label>';
							}
							str2 += '</div>';
							str2 += '<div class="view_review">';
							str2 += '<p>' + list.review_contents + '</p>';
							str2 += '</div>';
							str2 += '</div>';						
						}
						$('.review_list').append(str2);
					}
				},
				error : function(data) {
				
				}
			});
		}
	});
	
	// 리뷰 추가하기
	$('#ㅁㅁㅁ').click(function() {
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
				var list = data.list;		// 리뷰 리스트
				var paging = data.paging;	// 리뷰 페이징
				var cnt = data.cnt;			// 리뷰 총 개수
				var score = data.score;		// 리뷰 평균 점수
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
	
	// add to cart 버튼 클릭 시 ajax
	$('#addCart').click(function() {
		var user_id = $('input[name=user_id]').val();
		var book_id = $('input[name=book_id]').val();
		var book_cnt = $('select[name=book_cnt]').val();
		$.ajax({
			type : "GET",
			url : "/order/addCart",
			data : {
				user_id : user_id,
				book_id : book_id,
				book_cnt : book_cnt
			},
			dataType : "text",
			success : function(data) {
				alert('장바구니에 추가되었습니다');
			},
			error : function(data) {
				alert('이미 담긴 책입니다');
			}
		});
	});
	
});