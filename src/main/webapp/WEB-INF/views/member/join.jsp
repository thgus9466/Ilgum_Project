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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" type = "text/css" href="${root}/resources/jquery/jquery-ui.css">
<link rel="stylesheet" type = "text/css" href="${root}/resources/css/member/join.css">
<script type="text/javascript">
	$(function() {
	    $("#birthdaypicker").datepicker({				  
	           showOn: "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
	           changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
	           changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
	           minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
	           nextText: '다음 달', // next 아이콘의 툴팁.
	           prevText: '이전 달', // prev 아이콘의 툴팁.
	           numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
	           stepMonths: 1, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
	           yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
	           showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. ( ...으로 표시되는부분이다.) 
	           currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
	           closeText: '닫기',  // 닫기 버튼 패널
	           dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
	           showAnim: "slide", //애니메이션을 적용한다.  
	           showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
	           dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
	           monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식.
	     });
	    
	    $(".infos_input").focus(function() {
			$(this).css('background','#f2f2f2')
		})
		
		$(".infos_input").focusout(function() {
			$(this).css('background','#d9d9d9')
		})
		
		$(".button input").mouseover(function() {
			$(this).css('background-color','#10488D')
			.css('color','white')
		});
		
		$(".button input").mouseout(function() {
			$(this).css('background-color','white')
			.css('color','#10488D')
		});
	   
	    /*$(function(){
	    	if($('#disagree').checked){
				alert("체크");
	    		$('#member_job').attr('disabled', true);
	    		$('input[name="member_interest"]').attr('disabled', true);
	    	}
	    })*/;
	});
</script>
</head>
<body>
	<div class="head">
		<p>읽움 회원가입</p>
		<p>읽움에 오신것을 환영합니다.</p>		
	</div>
	<form name="memberForm" action="${root}/member/memberJoinOk.do" method="get" onsubmit="return registerForm(this)">
	<div class="vital_info">
		<div class="header">
			<span>필수 정보 입력</span>
			<span>*는 필수입력사항입니다.</span>
		</div>
			<div class="infos">
				<div class = "infos_sub">
					<span style="color: red; width: 20%; margin: 0px;">*</span>
					<span>아이디</span>
				</div>
				<div  class="infos_detail">
					<input class = "infos_input" type="text" name="member_id" id="member_id" oninput="idChk('${root}')"/>
					<span style="font-size: 12px; display: block; height: 15px;" id="idResult">
					공백없는 6~20자의 영문/숫자조합</span>
				</div>									
			</div>
			
			<div class="infos">
				<div class = "infos_sub">
					<span style="color: red; width: 20%; margin: 0px;">*</span>
					<span>비밀번호</span>
				</div>
				<div  class="infos_detail">
					<input class = "infos_input" type="password" name="member_password" id="pw" oninput="pwCheck1()"/>
					<span style="font-size: 12px; display: block; height: 15px;" id="pwResult1">
					공백없는 10~15자의 영문/숫자조합</span>
				</div>
			</div>
			
			<div class="infos">
				<div class = "infos_sub">
					<span style="color: red; width: 20%; margin: 0px;">*</span>
					<span>비밀번호 확인</span>
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
					<input class = "infos_input" type="text" name="member_name" id="name" oninput="namechk()"/>
					<span style="font-size: 12px; display: block; height: 15px;" id="nameresult" ></span>
				</div>
			</div>
			
			<div class="infos">
				<div class = "infos_sub">
					<span style="color: red; width: 20%; margin: 0px;">*</span>
					<span>성별</span>
				</div>
				<div class="infos_detail">
					<input type="radio" name="member_gender" value="m">남성
					<input type="radio" name="member_gender" value="w">여성
				</div>
			</div>
			
			<div class="infos">
				<div class = "infos_sub">
					<span style="color: red">*</span>
					<span>생년월일</span>
				</div>
				<div class="infos_detail">
					<input id="birthdaypicker" value="" type="date" name="member_birth">
				</div>				
			</div>
			
			<div class="infos">
				<div class = "infos_sub">
					<span style="color: red">*</span>
					<span>이메일 주소</span>
				</div>
				<div class="infos_detail">
					<input style="float: left; width: 150px;" class = "infos_input" type="text" name="member_email1"/>
					<span style="float: left;">@</span>
					<select style="width:110px;font-size: 15px;" name="member_email2">
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
			<span>배송 정보 입력</span>
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
						<input style="width: 80px;height: 21px;" type="text" name="phone1_2"/>
					</div>
					<div style="float:left;">
						<input style="width: 80px; height: 21px;" type="text" name="phone1_3"/>
					</div>
				</div>
				
			</div>
			
			<div class="infos">
				<div class = "infos_sub">
					<span style="color: red; width: 20%; margin: 0px;"> </span>
					<span style="padding-left:17px;">자택번호(선택사항)</span>
				</div>
				<div>
					<select name="phone2-1">
						<option value="" selected disabled>선택</option>
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
						<input style="width: 80px; height: 21px;" type="text" name="phone2-2"/>
					</div>
					<div style="float:left;">
						<input style="width: 80px; height: 21px;" type="text" name="phone2-3"/>
					</div>
				</div>
			</div>
		</div>	
	
	<div class="choice_info">
		<div style="text-align: center" class="header">
			<span style="display:block; margin: 0px auto; height:35px; line-height: 35px">추가정보입력</span>
			<div style="width:430px; margin: 5px auto; float:initial" class="infos_detail">
				개인정보수집 및 이용에 대한 안내(선택)
				<input type="radio" name="infoplus" value="true" onclick="agree()">동의
				<input type="radio" name="infoplus" value="false" onclick="disagree()">미동의
			</div>
		</div>
		<div id="option" style="display: none;">
			<div class="infos">
				<div class = "infos_sub">
					<span style="color: red; width: 20%; margin: 0px;"></span>
					<span style="padding-left:17px">직업</span>
				</div>
				<div>
					<select style="width: 100px;" name="member_job" id="member_job">
						<option value="not" id="job">직업선택</option>
						<option value="none">무직</option>
						<option value="programmer">개발자</option>
						<option value="teacher">강사</option>
						<option value="student">학생</option>
						<option value="student">학생</option>
						<option value="student">학생</option>
						<option value="student">학생</option>
						<option value="student">학생</option>
						<option value="student">학생</option>
						<option value="student">학생</option>
						<option value="student">학생</option>
						<option value="student">학생</option>
					</select>
				</div>									
			</div>
			
			<div class="infos" style="height:150px;">
				<div class = "infos_sub" style="height:150px;">
					<span style="color: red; width: 20%; margin: 0px;"></span>
					<span style="padding-left: 17px; margin-bottom: 20px;">관심분야</span><br/>
					<span>(3개까지 선택가능)</span>
				</div>
				<div class="infos_detail_interest">
					<div class = "infos_interest">
					<input type="checkbox" name="member_interest" id="interest" value="not" style="display:none;"/>
					<input type="checkbox" name="member_interest" value="소설"/>
					<span>소설</span>
					</div>
					<div class = "infos_interest">
					<input type="checkbox" name="member_interest" value="문학"/>
					<span>문학</span>
					</div>
					<div class = "infos_interest">
					<input type="checkbox" name="member_interest" value="학습"/>
					<span>학습</span>
					</div>
					<div class = "infos_interest">
					<input type="checkbox" name="member_interest" value="아동"/>
					<span>아동</span>
					</div>				
				</div>
				
				<div class="infos_detail_interest">
					<div class = "infos_interest">
					<input type="checkbox" name="member_interest" value="취미/실용"/>
					<span>취미/실용</span>
					</div>
					<div class = "infos_interest">
					<input type="checkbox" name="member_interest" value="종교"/>
					<span>종교</span>
					</div>
					<div class = "infos_interest">
					<input type="checkbox" name="member_interest" value="잡지"/>
					<span>잡지</span>
					</div>
					<div class = "infos_interest">
					<input type="checkbox" name="member_interest" value="정치법률"/>
					<span>정치법률</span>
					</div>					
				</div>
				
				<div class="infos_detail_interest">
					<div class = "infos_interest">
					<input type="checkbox" name="member_interest" value="경제,경영"/>
					<span>경제,경영</span>
					</div>
					<div class = "infos_interest">
					<input type="checkbox" name="member_interest" value="인문"/>
					<span>인문</span>
					</div>
					<div class = "infos_interest">
					<input type="checkbox" name="member_interest" value="외국어"/>
					<span>외국어</span>
					</div>
					<div class = "infos_interest">
					<input type="checkbox" name="member_interest" value="공학"/>
					<span>공학</span>
					</div>
				</div>
				
				<div class="infos_detail_interest">
					<div class = "infos_interest">
					<input type="checkbox" name="member_interest" value="의학"/>
					<span>의학</span>
					</div>
					<div class = "infos_interest">
					<input type="checkbox" name="member_interest" value="컴퓨터"/>
					<span>컴퓨터</span>
					</div>
					<div class = "infos_interest">
					<input type="checkbox" name="member_interest" value="수험서"/>
					<span>수험서</span>
					</div>
				</div>
			</div>
			</div>		
		</div>
		
	<div class = "buttons" id="buttons">
		<div class = "button">
			<input type="submit" value="가입완료">
		</div>	
			
		<div class = "button">
			<input type="reset" value="가입취소">
		</div>
	</div>
	</form>
	
</body>
</html>