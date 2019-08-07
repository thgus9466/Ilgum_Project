/**
 * 
 */

function goBookDetail(root, book_isbn) {
	location.href=root+"/book/bookDetail.do?book_isbn="+book_isbn;
}

function bookPay(root, book_isbn) {
	location.href=root+"/book/bookPay.do?book_isbn="+book_isbn;
}