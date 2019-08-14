<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>읽움 회원가입</title>
<script type="text/javascript" src="${root}/resources/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/resources/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/member/join.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/mypage/update.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" type = "text/css" href="${root}/resources/jquery/jquery-ui.css">
<link rel="stylesheet" type = "text/css" href="${root}/resources/css/mypage/update.css">
<script type="text/javascript">
	$(function() {
		$(".button input").mouseover(function() {
			$(this).css('background-color','#10488D')
			.css('color','white')
		});
		
		$(".button input").mouseout(function() {
			$(this).css('background-color','white')
			.css('color','#10488D')
		});
		
		$(".button:last-child input").mouseover(function() {
			$(this).css('background-color','#10488D')
			.css('color','red')
		});
		$(".button:last-child input").mouseout(function() {
			$(this).css('background-color','white')
			.css('color','red')
		});
		
		$(".infos_input").focus(function() {
			$(this).css('background-color','#f2f2f2')
		});
		
		$(".infos_input").focusout(function() {
			$(this).css('background-color','#e6e6e6')
		});
		
		$("select[name=member_email2]").val("${domain}").prop("selected","selected");
		$("#member_zipcode").val("${memberDto.member_zipcode}");
		$("#member_address1").val("${memberDto.member_address1}");
		$("#member_address2").val("${memberDto.member_address2}");
		
		$("select[name=phone1_1]").val("${phone1_1}").prop("selected","selected");
		$("input[name=phone1_2]").val("${phone1_2}");
		$("input[name=phone1_3]").val("${phone1_3}");
		
		$("select[name=phone2_1]").val("${phone2_1}").prop("selected","selected");
		$("input[name=phone2_2]").val("${phone2_2}");
		$("input[name=phone2_3]").val("${phone2_3}");
	});
</script>
</head>
<body>
	<div class = wrap>
		<jsp:include page="../template/myMenu.jsp"/>
		<div class="content">	
			<div class="head">
				<p>읽움 회원 수정하기</p>
				<p><span style="font-size: 1px;">●</span> 현재 회원 수정 화면 입니다. 탈퇴를 원하시면 맨 밑 버튼이 있습니다.</p>		
			</div>
			<form name="memberForm" action="${root}/mypage/updateOk.do" method="post" onsubmit="return registerForm(this)">
			<div class="vital_info">
				<div class="header">
					<span>기본 정보 수정</span>
					<span>*는 수정불가입니다.</span>
				</div>
					<div class="infos">
						<div class = "infos_sub">
							<span style="color: red; width: 20%; margin: 0px;">*</span>
							<span>아이디</span>
						</div>
						<div  class="infos_detail">
							<input class = "infos_input_disabled" type="text" name="member_id" id="member_id" value="${memberDto.member_id}" disabled/>
						</div>									
					</div>
					
					<div class="infos">
						<div class = "infos_sub">
							<span style="color: red; width: 20%; margin: 0px;"></span>
							<span style="padding-left:17px;">비밀번호 수정</span>
						</div>
						<div  class="infos_detail">
							<input class = "infos_input" type="password" name="member_password" id="pw" oninput="pwCheck1()"/>
							<span style="font-size: 12px; display: block; height: 15px;" id="pwResult1">공백없는 10~15자의 영문/숫자조합</span>
						</div>
					</div>
					
					<div class="infos">
						<div class = "infos_sub">
							<span style="color: red; width: 20%; margin: 0px;"></span>
							<span style="padding-left:17px;">비밀번호 수정 확인</span>
						</div>
						<div  class="infos_detail"> 
							<input class = "infos_input" type="password" name="member_passwordChk" id="pwChk" oninput="pwCheck2()"/>
							<span style="font-size: 12px; display: block; height: 15px;" id="pwResult2" >
							비밀번호를 한번더 입력해 주세요.</span>
						</div>
					</div>
					
					<div class="infos">
						<div class = "infos_sub">
							<span style="color: red; width: 20%; margin: 0px;">*</span>
							<span>이름</span>
						</div>
						<div class="infos_detail">
							<input class = "infos_input_disabled" type="text" name="member_name" value="${memberDto.member_name}" disabled/>
						</div>
					</div>
					<div class="infos">
						<div class = "infos_sub">
							<span style="color: red">*</span>
							<span>생년월일</span>
						</div>
						<div class="infos_detail">
							<input class="infos_input_disabled" id="birthdaypicker" type="text" name="member_birth" value = "${birthday}" disabled>
						</div>				
					</div>
					
					<div class="infos">
						<div class = "infos_sub">
							<span style="padding-left:17px;">이메일 주소</span>
						</div>
						<div class="infos_detail">
							<input style="float: left;width: 150px;" class = "infos_input" type="text" name="member_email1" value = "${email}"/>
							<span style="float: left;">@</span>
							<select style="width:100px;" name="member_email2">
								<option>naver.com</option>
								<option>daum.net</option>
								<option>gmail.com</option>
								<option>nate.com</option>
								<option>yahoo.com</option>
							</select>
						</div>
						<div style="float: left;">
							<input class = "infos_button" type="button" value="이메일 인증">
						</div>	
					</div>				
				</div>
				
			<div class="vital_info_deliver">
				<div class="header">
					<span>배송 정보 수정</span>
					<span>*는 필수입력사항입니다.</span>
				</div>
					<div style="height: 150px;" class="infos">
						<div class = "infos_sub">
							<span style="color: red; width: 20%; margin: 0px;">*</span>
							<span>주소</span>
						</div>
						<div  class="infos_detail">
							<input style="width: 100px; float: left;" class = "infos_input" type="text" name="member_zipcode" id="member_zipcode" readOnly/>
							<div style="float:left;">
								<input class = "infos_button" type="button" value="우편번호 찾기" id="zipcodeBtn" onclick="execPostCode()">
							</div>
							<div>
								<input class = "infos_input" type="text" name="member_address1" id="member_address1" readOnly/>
							</div>
							<div>
								<input class = "infos_input" type="text" name="member_address2" id="member_address2"/>
							</div>
						
						</div>									
					</div>
					
					<div class="infos">
						<div class = "infos_sub">
							<span style="color: red; width: 20%; margin: 0px;">*</span>
							<span>휴대폰 번호</span>
						</div>
						<div>
							<select name="phone1_1">
								<option value="" selected disabled>선택</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="019">019</option>
							</select>
							<div style="float:left;">
								<input class = "infos_input" style="width: 80px;height: 26px;" type="text" name="phone1_2"/>
							</div>
							<div style="float:left;" class = "info_input">
								<input class = "infos_input" style="width: 80px; height: 26px;" type="text" name="phone1_3"/>
							</div>
						</div>
						
					</div>
					
					<div class="infos">
						<div class = "infos_sub">
							<span style="color: red; width: 20%; margin: 0px;"> </span>
							<span style="padding-left:17px;">자택번호(선택사항)</span>
						</div>
						<div style="float:left;">
							<select name="phone2_1">
								<option value>선택안함</option>
								<option value="02">02</option>
								<option value="031">031</option>
								<option value="032">032</option>
								<option value="033">033</option>
								<option value="041">041</option>
								<option value="042">042</option>
								<option value="043">043</option>
								<option value="051">051</option>
								<option value="052">052</option>
								<option value="053">053</option>
								<option value="054">054</option>
								<option value="055">055</option>
								<option value="061">061</option>
								<option value="062">062</option>
								<option value="063">063</option>
								<option value="064">064</option>
							</select>
							<div style="float:left;">
								<input class = "infos_input" style="width: 80px; height: 26px;" type="text" name="phone2_2"/>
							</div>
							<div style="float:left;">
								<input class = "infos_input" style="width: 80px; height: 26px;" type="text" name="phone2_3"/>
							</div>
							<span style="font-size: 12px; display: none; height: 15px; width: 290px;" id="phoneResult">올바른 전화 번호가 아닙니다.</span>							
						</div>						
					</div>
				</div>	
				
			<div class = "buttons" id="buttons">
				<div class = "button">
					<input type="submit" value="수정완료">
				</div>	
					
				<div class = "button">
					<input type="button" value="수정취소" onclick ="cancel('${root}')"/>
				</div>				
				<div class = "button">
					<input type="button" value="회원탈퇴" onclick ="withdrawal('${root}')"/>
				</div>
			</div>
			</form>
		</div>
	</div>	
</body>
</html>