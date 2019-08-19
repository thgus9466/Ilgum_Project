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
		$(this).prop('checked', false);
		$(this).prop("disabled",false);
	});
	$('#interest').prop('checked', true);
	$('#job').prop("disabled", false);
	$('#member_job option:eq(0)').prop("selected", true);
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
		}
	}
}