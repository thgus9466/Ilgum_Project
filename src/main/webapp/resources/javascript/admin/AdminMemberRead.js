function readFun(root,member_id,pageNumber){
	
	var url = root+"/admin/AdminMemberRead.do?member_id=" + member_id;
	url += "&pageNumber=" + pageNumber;
	
	window.open(url,"상세보기페이지","width=800 , left=400, top=50, height=850 , scrollbars=yes");
} 


function closefun(){
    self.close();   //자기자신창을 닫습니다.
}