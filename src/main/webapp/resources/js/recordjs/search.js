$(document).ready(function() {
	
	// 검색 함수
	function search(keyword, pageNum) {
		$.ajax({
			type : "GET",
			url : "../record/search",
			data : {
				keyword : keyword,
				pageNum : pageNum
			},
			dataType : "json",
			success : function(data) {
				if (data == null) {
					alert('검색어를 입력하세요');
					return;
				} else {
					$('.book_box').empty();
					var searchList = data;
					for (var i = 0; i < searchList.length; i++) {
						var str = '';
						str += '<div class="book_wrap">';
						str += '<div class="img_wrap">';
						str += '<img class="book_cover" src="../../resources/images/bookcover/' + searchList[i].book_cover + '" alt="book_cover">';
						str += '<div class="b_layer"><a href="#">기록하기</a></div>';
						str += '</div>';
						str += '<h4 class="book_ttl">' + searchList[i].book_title + '</h4>';
						str += '<span class="book_writer">' + searchList[i].book_writer + '</span>'
						str += '</div>';
						$('.book_box').append(str);
					}
				}
			}
		});
	};
	
	// 엔터 시 검색
	$('#book_search').keyup(function(event) {		
		var keyword = $('#book_search').val();
		var pageNum = 1;
		if ($('#pageNum').val() != '') {
			pageNum = $('#pageNum').val();
		}
		if (event.keyCode == 13) {
			if (keyword == '') {
				alert('검색어를 입력하세요');
				return;
			}
			search(keyword, pageNum);
		}
	});
});