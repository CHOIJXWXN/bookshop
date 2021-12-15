$(document).ready(function() {
    	
    	var book_price = 0;
    	var shippingCost = 3000;
    	<c:forEach items="${list}" var="item">
    		var price = parseInt("${item['book_price']}");
    		var book_id = "${item['book_id']}";
    		var book_cnt = parseInt($('#book_cnt_' + book_id).val());
    		$('#book_price_' + book_id).text(price * book_cnt + '원');
    		book_price = book_price + price * book_cnt;
    	</c:forEach>
    	$('#book_price').text(book_price + '원');
    	if (book_price >= 20000) {
    		shippingCost = 0;
    		$('tbody tr:first-child').append('<td id="shippingCost" rowspan="${length}" style="border-left: 0.5px solid #707070;">무료배송</td>')
    	} else {
    		$('tbody tr:first-child').append('<td id="shippingCost" rowspan="${length}" style="border-left: 0.5px solid #707070;">3000원</td>')
    	}
    	
    });