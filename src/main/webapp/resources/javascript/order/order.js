/**
 * 
 */

function nonMemberBuy(root, book_isbn, cart_quantity) {
	location.href=root+"/order/oneBookOrder.do?book_isbn="+book_isbn+"&cart_quantity="+cart_quantity;
}