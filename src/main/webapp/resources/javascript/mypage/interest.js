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
	});
	$('#interest').prop('checked', true);
	$('#job').prop("disabled", false);
	$('#member_job option:eq(0)').prop("selected", true);
}

$(function(){
	$("input[name=member_interest]:checkbox").change(function(){
		if(3 == $("input[name=member_interest]:checkbox:checked").length)
			$(":checkbox:not(:checked)").prop("disabled", "disabled");
		else
			$("input[name=member_interest]:checkbox").prop("disabled",false);
	});
});