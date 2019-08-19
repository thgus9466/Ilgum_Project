<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${root}/resources/css/mypage/interest.css"/>
<script type="text/javascript" src="${root}/resources/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/mypage/interest.js"></script>
<title>내 관심분야 설정</title>
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
	});

</script>
</head>
<body>
	<div class = wrap>
		<jsp:include page="../template/myMenu.jsp"/>
		<form action="${root}/mypage/interestUpdateOk.do" method ="post" name="interform" onsubmit="return registerForm(this)">
			<div class = "content">
				<div class="head">
					<p>내 관심사</p>
					<p><span style="font-size: 1px;">●</span> 가입당시 개인정보 수집(선택사항)에 동의하지 않으셨으면 나의 관심사가 없습니다.</p>
					<p><span style="font-size: 1px;">●</span> 관심사를 새롭게 수정하고 싶으시면 동의을 표시하고 수정해 주세요.</p>
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
									<option id="job">선택안함</option>
									<option value="무직">무직</option>
									<option value="개발자">개발자</option>
									<option value="강사">강사</option>
									<option value="학생">학생</option>
									<option value="공무원">공무원</option>
									<option value="직장인">직장인</option>
									<option value="기타">기타</option>
								</select>
								<script type="text/javascript">
									interform.member_job.value = "${memberDto.member_job}";
								</script>	
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
								<input type="checkbox" name="member_interest" value="경제/경영"/>
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
							<c:forTokens var="interest" items="${memberDto.member_interest}" delims=",">
								<script type="text/javascript">
									for(var i=0;i<interform.member_interest.length;i++){
										if(interform.member_interest[i].value == "${interest}"){
											interform.member_interest[i].checked = true;
									    }
									}							
								</script>
							</c:forTokens>
						</div>
						<div class = "buttons" id="buttons">
							<div class = "button">
								<input type="submit" value="수정완료">
							</div>	
								
							<div class = "button">
								<input type="button" value="수정취소" onclick ="cancel('${root}')"/>
							</div>
						</div>
					</div>		
				</div>
			</div>
		</form>
	</div>
</body>
</html>