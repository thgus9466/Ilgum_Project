/**
 * 
 */

function goBookDetail(root, book_isbn) {
	location.href=root+"/book/bookDetail.do?book_isbn="+book_isbn;
}

function bookPay(root, book_isbn, member_id) {
//	alert(member_id);
	var cart_quantity=$(".book_quantity input[name='amount']").val();
	if (member_id != "") {
		location.href=root+"/book/bookPay.do?book_isbn="+book_isbn+"&cart_quantity="+cart_quantity;
	} else {
		location.href=root+"/order/orderLogin.do?book_isbn="+book_isbn+"&cart_quantity="+cart_quantity;
	}
}

function header_search(root, book_name){
	location.href=root+"/book/search_list.do?book_name="+book_name;
}