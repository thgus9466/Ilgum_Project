function upFun(root,book_isbn,pageNumber){
	
	var url = root+"/admin/AdminBookUpdate.do?book_isbn=" + book_isbn;
	url += "&pageNumber=" + pageNumber;
	
	//alert(url);
	
	location.href=url;
}