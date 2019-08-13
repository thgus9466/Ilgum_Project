<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/mypage/main.css">
<script type="text/javascript" src = "${root}/resources/jquery/jquery.js"></script>
</head>
<body>
	<div class = wrap>
		<jsp:include page="../template/myMenu.jsp"/>
		<div class = "content">	
			<div class = "info">
				<div class = "info_detail">
					<span class="title">회원정보</span>
					<span style="float: right; margin-right: 5px;"><a href = "${root}/mypage/update.do">내 정보 수정</a></span>
				</div>
				
				<div class = "info_detail" style="text-align: center;height: 45px; line-height: 45px;">
					<span>
						<span class = "subject">이름</span>
						<input class = "info_input" type="text" value = "${memberDto.member_name}" disabled>
					</span>
					<span>
						<span class = "subject">이메일</span>
						<input class = "info_input" type="text" value = "${memberDto.member_email}" disabled>
					</span>
				</div>
				
				<div class ="info_dail" style="border-bottom: 0px;">
					<div style="margin : 30px 0px 30px 10px;">
						<span style="font-size: 16px;font-weight: bold;">최근 배송지</span>
					</div>
					<div>
						<span style="margin-left: 30px;border: 1px solid #cccccc;display: block;height: 40px;
	    line-height: 40px;width: fit-content;padding-left: 10px;">${memberDto.member_address1} ${memberDto.member_address2}</span>					
					</div>
				</div>
			</div>
		
			<div class = "info">
				<div class = "info_detail">
					<span class="title">최근 주문 내역</span>
					<span style="float: right; margin-right: 5px;"><a href = "${root}/mypage/deliver.do">주문 내역 보기</a></span>
				</div>
				
				<div class ="info_dail" style="border-bottom: 0px;">
					<div style="margin : 30px 0px 30px 10px;">
						<span style="font-size: 16px;font-weight: bold;">최근 배송지</span>
					</div>
					<div>
						<span style="margin-left: 30px;display: block;height: 40px;line-height: 40px;width: fit-content;padding-left: 10px;">서울특별시 장문로6길 76 103동 1303호(용산푸르지오파크타운)</span>					
					</div>
				</div>
			</div>
			
			<div class = "info">
				<div class = "info_detail">
					<span class="title">나의 관심사</span>
					<span style="float: right; margin-right: 5px;"><a href = "주문내역 더보기">주문 내역 보기</a></span>
				</div>
				
				<div class ="info_dail" style="border-bottom: 0px;">
					<div style="margin : 30px 0px 30px 10px;">
						<span style="font-size: 16px;font-weight: bold;">최근 배송지</span>
					</div>
					<div>
						<span style="margin-left: 30px;border: 1px solid #cccccc;display: block;height: 40px;
	    line-height: 40px;width: fit-content;padding-left: 10px;">서울특별시 장문로6길 76 103동 1303호(용산푸르지오파크타운)</span>					
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>