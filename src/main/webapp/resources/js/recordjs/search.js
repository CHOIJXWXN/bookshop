$(document).ready(function() {

	$('.m_prev').hide();
	$('.m_next').hide();
	
	// 검색 함수
	function search(keyword, pageNum) {
		$.ajax({
			type : "POST",
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
					$('.book_rewrap').empty();
					for (var i = 0; i < data.list.length; i++) {
						var str = '';
						str += '<div class="book_wrap">';
						str += '<div class="img_wrap">';
						str += '<img class="book_cover" src="../../resources/images/bookcover/' + data.list[i].book_cover + '" alt="book_cover">';
						str += '<div class="b_layer"><a href="../record/write?book_id=' + data.list[i].book_id + '">기록하기</a></div>';
						str += '</div>';
						str += '<h4 class="book_ttl">' + data.list[i].book_title + '</h4>';
						str += '<span class="book_writer">' + data.list[i].book_writer + '</span>'
						str += '</div>';
						$('.book_rewrap').append(str);
					}
					if (data.paging.pageNumber == 1) {
					    $('.m_prev').show();
						$('.m_prev div').hide();
					} else {
					    $('.m_prev').show();
						$('.m_prev div').show();
					}				
					$('.m_prev').attr('id', data.paging.pageNumber - 1);
					$('.m_next').attr('id', data.paging.pageNumber + 1);
					if (data.paging.next) {
					    $('.m_next').show();
						$('.m_next div').show();
					} else {
					    $('.m_next').show();
						$('.m_next div').hide();
					}
				}
			}
		});
	};
	
	// 엔터 시 검색
	$('#book_search').keyup(function(event) {		
		var keyword = $('#book_search').val();
		var pageNum = 1;
		if (event.keyCode == 13) {
			if (keyword == '') {
				alert('검색어를 입력하세요');
				return;
			}
			search(keyword, pageNum);
		}
	});
	
	$('.m_prev').click(function() {
		var keyword = $('#book_search').val();
		var pageNum = $('.m_prev').attr('id');
		if ($('.m_prev div').css('display') == 'none') {
			$('.m_prev').css('cursor', 'auto');
			return;
		}
		search(keyword, pageNum);
	});
	
	$('.m_next').click(function() {
		var keyword = $('#book_search').val();
		var pageNum = $('.m_next').attr('id');
		if ($('.m_next div').css('display') == 'none') {
			$('.m_next').css('cursor', 'auto');
			return;
		}
		search(keyword, pageNum);
	});
	
});