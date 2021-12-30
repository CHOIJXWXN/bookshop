$(document).ready(function() {

	$('form').submit(function(event) {
		var book_title = $('input[name=book_title]').val();
		var book_writer = $('input[name=book_writer]').val();
		var book_price = $('input[name=book_price]').val();
		var book_pub = $('input[name=book_pub]').val();
		var book_id = $('input[name=book_id]').val();
		var book_cover_file = $('input[name=book_cover_file]').val();
		var book_genre = $('input[name=book_genre]').val();
		var book_date = $('input[name=book_date]').val();
		var book_contents = $('input[name=book_contents]').val();
		var book_intro = $('input[name=book_intro]').val();
		
		if (book_title == '' || book_writer == '' || book_price == ''
		 || book_pub == '' || book_id == '' || book_cover_file == ''
		 || book_genre == '' || book_date == '' || book_contents == '' || book_intro == '' ) {
			alert('빈칸이 있습니다');
			event.preventDefault();
			return;
		}
		if (book_price < 0) {
			alert('잘못된 가격입니다');
			event.preventDefault();
			return;
		}
		if (book_id < 0) {
			alert('잘못된 ISBN입니다');
			event.preventDefault();
			return;
		}
		
	});

});