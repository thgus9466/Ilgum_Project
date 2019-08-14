function reply(q_number,root,pageNumber, member_id){
	var url = root+"/admin/AdminQuestionWrite.do?"+"q_number="+q_number+
	"&pageNumber="+pageNumber+"&member_id="+member_id;

	location.href=url;
}

function upFun(root,q_number,pageNumber){
	var url = root+"/admin/AdminQuestionWriteReply.do?"+"q_number="+q_number+
	"&pageNumber="+pageNumber;

	location.href=url;
}