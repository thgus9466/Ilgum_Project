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

function registerForm(obj) {

	if (obj.member_id.value == "") {
		alert("아이디는 필수입력사항입니다.");
		obj.member_id.focus();
		return false;
	}

	if ($('#idResult').css("color") == 'rgb(255, 0, 0)') {
		alert("아이디를 확인하세요");
		return false;
	}

	if (obj.member_password.value == "") {
		alert("비밀번호는 필수입력사항입니다.");
		obj.member_password.focus();
		return false;
	}

	if (obj.member_passwordChk.value == "") {
		alert("비밀번호 확인은 필수입력사항입니다.");
		obj.member_passwordChk.focus();
		return false;
	}

	if ($('#pwResult1').css("color") == 'rgb(255, 0, 0)'
			|| $('#pwResult2').css("color") == 'rgb(255, 0, 0)') {
		alert("비밀번호를 확인하세요");
		return false;
	}

	if (obj.member_name.value == "") {
		alert("이름은 필수입력사항입니다.");
		obj.member_name.focus();
		return false;
	}

	if (obj.member_gender.value == "") {
		alert("성별은 필수입력사항입니다.");
		return false;
	}

	if (obj.member_birth.value == "") {
		alert("생년월일은 필수입력사항입니다.");
		obj.member_birth.focus();
		return false;
	}

	if (obj.member_email1.value == "" || obj.member_email2.value == "") {
		alert("이메일은 필수입력사항입니다.");
		obj.member_email1.focus();
		return false;
	}

	if (obj.member_zipcode.value == "") {
		alert("우편번호는 필수입력사항입니다.");
		obj.member_zipcode.focus();
		return false;
	}

	if (obj.member_address1.value == "") {
		alert("주소는 필수입력사항입니다.");
		obj.member_address1.focus();
		return false;
	}

	if (obj.member_address2.value == "") {
		alert("주소는 필수입력사항입니다.");
		obj.member_address2.focus();
		return false;
	}

	if (obj.phone1_1.value == "") {
		alert("휴대폰 번호는 필수입력사항입니다.");
		obj.phone1_1.focus();
		return false;
	}

	if (obj.phone1_2.value == "") {
		alert("휴대폰 번호는 필수입력사항입니다.");
		obj.phone1_2.focus();
		return false;
	}

	if (obj.phone1_3.value == "") {
		alert("휴대폰 번호는 필수입력사항입니다.");
		obj.phone1_3.focus();
		return false;
	}

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

function idChk(root) {
	var re = /^[0-9a-z]{6,20}$/; // 아이디가 적합한지 검사할 정규식
	var userid = $("#member_id").val();

	$.ajax({
		async : true,
		type : 'get',
		data : {
			userid : userid
		},
		url : root+ "/member/idCheck.do",
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			var checkNumber = userid.search(/[0-9]/g);
			var checkEnglish = userid.search(/[a-z]/ig);
			
			if (re.test(userid)) {				
				if (data > 0) {
					$('#idResult').css("color", "red");
					$('#idResult').text("아이디가 존재합니다.");
				}
				else if(checkNumber < 0){
					$('#idResult').css("color", "red");
					$('#idResult').text("숫자를 포함해야합니다.");
					$('#idResult').focus();
				}
				
				else if(checkEnglish < 0){
					$('#idResult').css("color", "red");
					$('#idResult').text("영문자를 포함해야합니다.");
					$('#idResult').focus();
				}				
				else {
					$('#idResult').css("color", "blue");
					$('#idResult').text("사용가능한 아이디입니다.");
				}
			}
			else if(userid.trim().length==0){
				$('#idResult').css("color", "red");
				$('#idResult').text("아이디를 입력하세요.");
			}			
			else if(checkNumber < 0){
				$('#idResult').css("color", "red");
				$('#idResult').text("숫자를 포함해야합니다.");
				$('#idResult').focus();
			}
			
			else if(checkEnglish < 0){
				$('#idResult').css("color", "red");
				$('#idResult').text("영문자를 포함해야합니다.");
				$('#idResult').focus();
			}			
			else {
				$('#idResult').css("color", "red");
				$('#idResult').text("아이디는 공백없는 6~20자의 영문/숫자조합 입니다.");
				$('#idResult').focus();
			}
		}
	});
}

function pwCheck1() {
	var re = /^[a-z0-9]{10,15}$/; // 패스워드가 적합한지 검사할 정규식

	if (re.test($('#pw').val())) {
		$('#pwResult1').css("color", "blue");
		$('#pwResult1').text("사용가능한 비밀번호 입니다.");

	} else {
		$('#pwResult1').css("color", "red");
		$('#pwResult1').text("비밀번호는 공백없는 10~15자의 영문/숫자조합 입니다.");
	}
}

function pwCheck2() {

	var re = /^[a-z0-9]{10,15}$/ // 패스워드가 적합한지 검사할 정규식

	if (re.test($('#pwChk').val())) {
		if ($('#pw').val() == $('#pwChk').val()) {
			$('#pwResult2').css("color", "blue");
			$('#pwResult2').text("비밀번호가 일치합니다.");

		} else {
			$('#pwResult2').css("color", "red");
			$('#pwResult2').text("비밀번호가 일치하지 않습니다.");
		}
	} else {
		$('#pwResult2').css("color", "red");
		$('#pwResult2').text("비밀번호는 공백없는 10~15자의 영문/숫자조합 입니다.");
	}
}

function namechk() {
	var name = $("#name").val();
	var checkNumber = name.search(/[0-9]/g);
	
	if (name.trim().length == 0) {
		$('#nameresult').css("color", "red");
		$('#nameresult').text("이름을 입력해주세요");
	}else if (checkNumber == 0 ){
		$('#nameresult').css("color", "red");
		$('#nameresult').text("정확한 이름을 입력해주세요");
	}else{
		$('#nameresult').css("color", "blue");
		$('#nameresult').text("");
	}
}

function execPostCode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
			var extraRoadAddr = ''; // 도로명 조합형 주소 변수

			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
				extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if (data.buildingName !== '' && data.apartment === 'Y') {
				extraRoadAddr += (extraRoadAddr !== '' ? ', '
						+ data.buildingName : data.buildingName);
			}
			// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if (extraRoadAddr !== '') {
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}
			// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
			if (fullRoadAddr !== '') {
				fullRoadAddr += extraRoadAddr;
			}
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('member_zipcode').value = data.zonecode; // 5자리
			document.getElementById('member_address1').value = fullRoadAddr;
		}
	}).open();
}