/**
 * 
 */

function agree() {
	$('#option').show();
	$('#buttons').css("margin-top", "10px");
	$('#interest').prop('checked', false);
	$('#job').prop("disabled", true);
}

function disagree() {
	$('#option').hide();
	$('#buttons').css("margin-top", "50px");
	$('input[name="member_interest"]').each(function() {
//		$(this).prop('checked', false);
		$(this).prop("disabled",false);
	});
//	$('#interest').prop('checked', true);
	$('#job').prop("disabled", false);
//	$('#member_job option:eq(0)').prop("selected", true);
}

function cancel(root){
	if(confirm("수정을 취소 하시겠습니까?")){
		location.href= root+"/mypage/main.do";
	}
}

$(function(){
	if(3 == $("input[name=member_interest]:checkbox:checked").length)
		$(":checkbox:not(:checked)").prop("disabled", "disabled");
	else
		$("input[name=member_interest]:checkbox").prop("disabled",false);
	
	$("input[name=member_interest]:checkbox").change(function(){
		if(3 == $("input[name=member_interest]:checkbox:checked").length)
			$(":checkbox:not(:checked)").prop("disabled", "disabled");
		else
			$("input[name=member_interest]:checkbox").prop("disabled",false);
	});
	
		
});

function registerForm(obj) {
	var str = "";
	
	if (!$(':input[name="infoplus"]:radio:checked').val()) {
		alert("추가정보입력을 선택하세요.");
		return false;
	}

	if (obj.infoplus.value == 'true') {
		if(obj.member_job.value == "not"){
			alert("직업을 선택하세요.");
			return false;
		}
		
		if (!$('input[name="member_interest"]').is(":checked")) {
			alert("관심분야를 선택하세요.");
			return false;
		}else{
			for(var i=0; i<obj.member_interest.length;i++ ){
				if (obj.member_interest[i].checked == true){
					str+=obj.member_interest[i].value+",";
				}
			}
//			alert(str);
			obj.interests.value = str;
//			alert(obj.interests.value);
			return true;
		}
	}	
}