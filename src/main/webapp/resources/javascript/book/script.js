function guestCheck(obj){  //간단한 유효성 검사
	
	/*if(obj.name.value==""){
		alert("이름을 입력하세요");
		obj.name.focus();
		return false;
	}
	
	if(obj.password.value==""){
		alert("비밀번호를 입력하세요");
		obj.password.focus();
		return false;
	}
	
	if(obj.message.value==""){
		alert("메세지를 입력하세요");
		obj.message.focus();
		return false;
	}*/
}
//방명록 수정
function updateCheck(root,currentPage,num,id,book){
	var url = root + "/member/update.do?order_bunho="+num+"&pageNumber="+currentPage+"&member_id="+id+"&book_isbn="+book;
	//alert(url);
	
	location.href=url;
	
	
}
//방명록 삭제
function deleteCheck(root1,currentPage,num,id,book,login){
	root = root1
	var url = root +"/member/delete.do?order_bunho="+num+"&pageNumber="+currentPage+"&member_id="+id+"&book_isbn="+book;
	alert(url);
	
	if(login==""){
		alert("로그인해주세요");
	}else if(login != id){
		alert("권한이 없습니다.");
	}else{
		var value=confirm("정말로 삭제 하시겠습니까?");
		
		if(value==true){
			//alert("ok");
			location.href=url;
		}
	}
}