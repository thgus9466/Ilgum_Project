/**
 * 
 */

function registerForm(obj) {

	var re = /^[a-z0-9]{6,20}$/ // 아이디가 적합한지 검사할 정규식
	var re2 = /^[a-z0-9]{10,15}$/ // 패스워드가 적합한지 검사할 정규식
		
	if (obj.member_id.value == "") {
		alert("아이디는 필수입력사항입니다.");
		obj.member_id.focus();
		return false;
	}
	
	if(!re.test(obj.member_id.value)){
		alert("아이디는 공백없는 6~20자의 영문/숫자조합 입니다.");
		obj.member_id.focus();
		return false;
	}

	if (obj.member_password.value == "") {
		alert("비밀번호는 필수입력사항입니다.");
		obj.member_password.focus();
		return false;
	}


	
	if(!re2.test(obj.member_password.value)){
		alert("비밀번호는 공백없는 10~15자의 영문/숫자조합 입니다.");
		obj.member_password.focus();
		return false;
	}

	if (obj.member_name.value == "") {
		alert("이름은 필수입력사항입니다.");
		obj.member_name.focus();
		return false;
	}
	
	if (obj.member_gender.value == "") {
		alert("성별은 필수입력사항입니다.");
		obj.member_gender.focus();
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
}

function pwCheck1(){
	var re = /^[a-z0-9]{10,15}$/ // 패스워드가 적합한지 검사할 정규식
		
	if(re.test($('#pw').val())){
		$('#pwResult1').css("color", "blue");
		$('#pwResult1').text("사용가능한 비밀번호 입니다.");
	}
	else{
		$('#pwResult1').css("color", "red");
		$('#pwResult1').text("비밀번호는 공백없는 10~15자의 영문/숫자조합 입니다.");
	}
}

function pwCheck2(){
	if($('#pw').val() == $('#pwChk').val()){
		$('#pwResult2').css("color", "blue");
		$('#pwResult2').text("비밀번호가 일치합니다.");
	}
	else{
		$('#pwResult2').css("color", "red");
		$('#pwResult2').text("비밀번호가 일치하지 않습니다.");		
	}
}
























