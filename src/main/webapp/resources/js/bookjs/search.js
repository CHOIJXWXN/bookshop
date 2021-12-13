$(document).ready(function() {

	// 엔터 시 검색
	$('#book_keyword').keyup(function(event) {
		var keyword = $('#book_keyword').val();
		if (event.keyCode == 13) {
			$.ajax({
				type : "GET",
				url : "./book/search",
				data : {
					keyword : keyword
				},
				dataType : "json",
				success : function(data) {
					if (data == null) {
						alert('검색어를 입력하세요');
						return;
					} else {
						$('.book_prod_wrap li').remove();
						var searchList = data.searchList;
						for (var i = 0; i < searchList.length; i++) {
							var str = '';
							str += '<li><a href="${path}/book/detail?book_id=' + searchList[i].book_id + '">';
							str += '<img class="book_cover" src="../../resources/images/bookcover/' + searchList[i].book_id + '.jpg" alt="book_cover">';
							str += '<h4 class="book_ttl">' + searchList[i].book_title + '</h4>';
							str += '<span class="book_price">' + searchList[i].book_price + '원</span>';
							str += '</a></li>';
							$('.book_prod_wrap').append(str);
						}
					}
				}
			});
		}
	});
	
	// 서치 버튼 클릭 시 검색
	$('#search_btn').click(function() {
		var keyword = $('#book_keyword').val();
		$.ajax({
			type : "GET",
			url : "./book/search",
			data : {
				keyword : keyword
			},
			dataType : "json",
			success : function(data) {
				if (data == null) {
					alert('검색어를 입력하세요');
					return;
				} else {
					$('.book_prod_wrap li').remove();
					var searchList = data.searchList;
					for (var i = 0; i < searchList.length; i++) {
						var str = '';
						str += '<li><a href="${path}/book/detail?book_id=' + searchList[i].book_id + '">';
						str += '<img class="book_cover" src="../../resources/images/bookcover/' + searchList[i].book_id + '.jpg" alt="book_cover">';
						str += '<h4 class="book_ttl">' + searchList[i].book_title + '</h4>';
						str += '<span class="book_price">' + searchList[i].book_price + '원</span>';
						str += '</a></li>';
						$('.book_prod_wrap').append(str);
					}
				}
			}
		});
	})
	
});