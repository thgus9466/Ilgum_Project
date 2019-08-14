<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>


<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${root}/resources/css/admin/adminRead.css">
<link rel="stylesheet" type = "text/css" href="${root}/resources/jquery/jquery-ui.css">
<link rel="stylesheet" type = "text/css" href="${root}/resources/css/admin/adminMemberRead.css">
<script type="text/javascript" src="${root}/resources/javascript/admin/AdminMemberRead.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script> 
<title>도서 상세내용</title>
</head>
<body>
	<div class="header"></div>
	<div class="main">
		<div class="board_div">
			<h2 class="page-header">회원 상세내용</h2>
			<div class="search_div">
				<form class="form_style" id="boardSearchVO" name="boardSearchVO">
					<input type="hidden" name="count" value="${count}"/>
					<input type="hidden" name="boardSize" value="${boardSize}"/>
					<input type="hidden" name="currentPage" value="${currentPage}"/>
				</form>
			</div>


			<!--  BookInsert -->
				<div class="vital_info">
					<div class="header">
						<span>필수 정보</span>
					</div>
						<div class="infos">
							<div class = "infos_sub">
								<span style="color: red; width: 20%; margin: 0px;">*</span>
								<span>아이디</span>
							</div>
							<div  class="infos_detail">
								<input class = "infos_input" type="text" name="member_id" id="member_id" value="${memberDto.member_id}" disabled="disabled"/>
							</div>									
						</div>
						
						<div class="infos">
							<div class = "infos_sub">
								<span style="color: red; width: 20%; margin: 0px;">*</span>
								<span>비밀번호</span>
							</div>
							<div  class="infos_detail">
								<input class = "infos_input" type="password" value="${memberDto.member_password}" disabled="disabled"/>
							</div>
						</div>
						
						<div class="infos">
							<div class = "infos_sub">
								<span style="color: red; width: 20%; margin: 0px;">*</span>
								<span>이름</span>
							</div>
							<div class="infos_detail">
							<span>${memberDto.member_name}</span>
							</div>
						</div>
						
						<div class="infos">
							<div class = "infos_sub">
								<span style="color: red; width: 20%; margin: 0px;">*</span>
								<span>성별</span>
							</div>
							<div class="infos_detail">
								<span>${memberDto.member_gender}</span>
							</div>
						</div>
						
						<div class="infos">
							<div class = "infos_sub">
								<span style="color: red">*</span>
								<span>생년월일</span>
							</div>
							<div class="infos_detail">
								<fmt:parseDate value='${memberDto.member_birth}' var='member_birth' pattern='yyyy-MM-dd HH:mm:ss'/>
								<fmt:formatDate value="${member_birth}" pattern="yyyy년MM월dd일"/>
							</div>				
						</div>
						
						<div class="infos">
							<div class = "infos_sub">
								<span style="color: red">*</span>
								<span>이메일 주소</span>
							</div>
							<div class="infos_detail">
							<span>${memberDto.member_email}</span>
							</div>
						</div>				
					</div>
					
				<div class="vital_info_deliver">
					<div class="header">
						<span>배송 정보</span>
					</div>
						<div style="height: 150px;" class="infos">
							<div class = "infos_sub">
								<span style="color: red; width: 20%; margin: 0px;">*</span>
								<span>주소</span>
							</div>
							<div  class="infos_detail">
								<div>
									<span>${memberDto.member_zipcode}</span>
								</div>
								<div>
									<span>${memberDto.member_address1}</span>
								</div>							
								<div>
									<span>${memberDto.member_address2}</span>
								</div>
							</div>									
						</div>
						
						<div class="infos">
							<div class = "infos_sub">
								<span style="color: red; width: 20%; margin: 0px;">*</span>
								<span>휴대폰 번호</span>
							</div>
							<div>
								<span>${memberDto.member_phone1}</span>
							</div>
							
						</div>
						
						<div class="infos">
							<div class = "infos_sub">
								<span style="color: red; width: 20%; margin: 0px;"> </span>&nbsp;&nbsp;
								<span>자택번호</span>
							</div>
							<div>
								<c:if test="${memberDto.member_phone2 == 'nullnullnull'}">
									<span></span>
								</c:if>
								<c:if test="${memberDto.member_phone2 != 'nullnullnull'}">
									<span>${memberDto.member_phone2}</span>
								</c:if>
							</div>
						</div>
					</div>	
				
				<div class="choice_info">
					<div style="text-align: center" class="header">
						<span style="display:block; margin: 0px auto; height:35px; line-height: 35px">추가정보입력</span>
					</div>
					<div id="option"	>
						<div class="infos">
							<div class = "infos_sub">
								<span style="color: red; width: 20%; margin: 0px;"></span>
								<span style="padding-left:17px">직업</span>
							</div>
							<div>
							<span>${memberDto.member_job}</span>
							</div>									
						</div>
						
						<div class="infos" style="height:150px;">
							<div class = "infos_sub" style="height:150px;">
								<span style="color: red; width: 20%; margin: 0px;"></span>
								<span style="padding-left: 17px; margin-bottom: 20px;">관심분야</span><br/>
								<span>(3개까지 선택가능)</span>
							</div>
							<span>${memberDto.member_interest}</span>
						</div>
						</div>		
					</div>
					
				<div class = "buttons" id="buttons">
					<div class = "button1" style="margin: 0px auto; text-align: center;">
						<input type="button" class="btn btn-primary btn-success" value="확인" onclick="closefun()">
						<input type="button" class="btn btn-primary btn-success" value="닫기" onclick="closefun()">
					</div>
				</div>
			</div>
			
		<!-- Optional JavaScript -->
	    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
		</div>
		
		

</body>	
</html>