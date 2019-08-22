/**
 * 
 */

function nonMemberBuy(root, book_isbn, book_quantity) {
	location.href=root+"/order/oneBookOrder.do?book_isbn="+book_isbn+"&book_quantity="+book_quantity;
}