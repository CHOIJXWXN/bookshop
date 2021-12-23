$(document).ready(function() {
	
	// 검색 후 데이터 출력 함수
	function print(data) {
		if (data == null) {
			alert('검색어를 입력하세요');
			return;
		} else {
			$('.book_prod_wrap li').remove();
			var searchList = data.searchList;
			for (var i = 0; i < searchList.length; i++) {
				var str = '';
				str += '<li><a href="/book/detail?book_id=' + searchList[i].book_id + '">';
				str += '<div class="img_wrap">';
				str += '<img class="book_cover" src="../../resources/images/bookcover/' + searchList[i].book_id + '.jpg" alt="book_cover">';
				str += '</div>';
				str += '<h4 class="book_ttl">' + searchList[i].book_title + '</h4>';
				str += '<span class="book_price">' + searchList[i].book_price + '원</span>';
				str += '</a></li>';
				$('.book_prod_wrap').append(str);
		}
			
		$('.page_num').empty();
		var paging = data.searchPaging;
		var str2 = '';
		if (paging.before > 0) {
			str2 += '<li><a class="search" id="' + paging.before + '" href=""><img src="../../resources/images/page_prev.png" alt=""></a></li>';
		}
		for (var i = paging.minPage; i <= paging.maxPage; i++) {
			str2 += '<li>';
			if (paging.pageNumber == i) {
				str2 += '<a class="now search" id="' + i + '" href="">' + i + '</a>';
			} else {
				str2 += '<a class="search" id="' + i + '" href="">' + i + '</a>';
			}
			if (paging.pageNumber == i) {
				str2 += '<div class="page_icon now"></div>';
			}
			str2 += '</li>';
		}
		if (paging.next) {
			str2 += '<li><a class="search" id="' + paging.forward + '" href=""><img src="../../resources/images/page_next.png" alt=""></a></li>';
		}
		$('.page_num').append(str2);
		}
		
		$('.search').click(function(e) {
			e.preventDefault();
			var keyword = $('#book_keyword').val();	
			var book_genre = $('#book_genre').val();
			var pageNum = $(this).attr('id');
			pagingAjax(keyword, book_genre, pageNum);
		});
	};
	
	function pagingAjax(keyword, book_genre, pageNum) {
		$.ajax({
			type : "GET",
			url : "../book/search",
			data : {
				keyword : keyword,
				book_genre : book_genre,
				pageNum : pageNum
			},
			dataType : "json",
			success : function(data) {
				print(data);
			},
			error : function(data) {
			
			}
		});
	};

	// 엔터 시 검색
	$('#book_keyword').keyup(function(event) {
		var keyword = $('#book_keyword').val();	
		var book_genre = $('#book_genre').val();		
		if (book_genre == "0") {
			book_genre = "소설";
		} else if (book_genre == "1") {
			book_genre = "시/에세이";
		} else if (book_genre == "2") {
			book_genre = "여행";
		}
		if (event.keyCode == 13) {
			if (keyword == '') {
				alert('검색어를 입력하세요');
				return;
			}
			$.ajax({
				type : "GET",
				url : "../book/search",
				data : {
					keyword : keyword,
					book_genre : book_genre
				},
				dataType : "json",
				success : function(data) {
					print(data);
				}
			});
		}
	});
	
	// 서치 버튼 클릭 시 검색
	$('#search_btn').click(function() {
		var keyword = $('#book_keyword').val();	
		var book_genre = $('#book_genre').val();
		$.ajax({
			type : "GET",
			url : "../book/search",
			data : {
				keyword : keyword
			},
			dataType : "json",
			success : function(data) {
				print(data);
			}
		});
	});	
	
});