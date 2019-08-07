/**
 * 
 */

function goBookDetail(root, book_isbn) {
	location.href=root+"/book/bookDetail.do?book_isbn="+book_isbn;
}

function bookPay(root, book_isbn) {
	location.href=root+"/book/bookPay.do?book_isbn="+book_isbn;
}

function header_search(root, book_name){
	location.href=root+"/book/search_list.do?book_name="+book_name;
}