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
						<span style="margin-left: 30px;display: block;height: 40px;
	    line-height: 40px;width: fit-content;padding-left: 10px;">${memberDto.member_address1} ${memberDto.member_address2}</span>					
					</div>
				</div>
			</div>
		
			<div class = "info">
				<div class = "info_detail">
					<span class="title">주문/배송 조회</span>
					<span style="float: right; margin-right: 5px;"><a href = "${root}/mypage/deliver.do">주문 내역 보기</a></span>
				</div>
				
				<div class ="info_dail" style="border-bottom: 0px;">
					<div style="margin : 30px 0px 30px 10px;">
						<span style="font-size: 16px;font-weight: bold;">최근 1주일 간 주문 내역</span>
					</div>
					<div style="text-align: center; width: fit-content; margin: 0px auto;">
						<table>
						<tr>
							<th>주문번호</th>
							<th>주문일자</th>
							<th>주문내역</th>
							<th>주문금액/수량</th>
						</tr>				
						
						<c:forEach var="userOrderDto" items="${userOrderDtoList}">
							<tr>
								<td>${userOrderDto.order_bunho}</td>
								<td>
		<%-- 						<fmt:parseDate var="order_date" value="${userOrderDto.order_date}" pattern="yyyy-MM-dd HH:mm:ss"/> --%>
		<%-- 						${order_date} --%>
								${userOrderDto.order_date}
								</td>
								<td>${userOrderDto.book_name}</td>
								<td>${userOrderDto.order_total_price}원/${userOrderDto.order_book_count}개</td>
							</tr>
						</c:forEach>
						
						
					</table>
					<c:if test="${count == 0 ||userOrderDtoList.size() == 0}">
						<div style="background: #e6e6e6; text-align: center; height: 60px;line-height: 60px;">
							<h4>최근 1주일간 주문한 내역이 없습니다</h4>
						</div>
					</c:if>					
					</div>
				</div>
			</div>
			
			<div class = "info">
				<div class = "info_detail">
					<span class="title">나의 관심사</span>
					<span style="float: right; margin-right: 5px;"><a href = "${root}/mypage/interest.do">관심사 보기</a></span>
				</div>
				
				<div class ="info_dail" style="border-bottom: 0px;">
					<div style="margin : 30px 0px 30px 10px;">
						<span style="font-size: 16px;font-weight: bold;">직업 : </span>
						<span style="margin-left: 30px;display: inline-block; height: 40px; line-height: 40px;width: fit-content;padding-left: 10px;">${memberDto.member_job}</span>
					</div>
					<div style="margin : 30px 0px 30px 10px;">
						<span style="font-size: 16px;font-weight: bold;">관심사 : </span>
						<c:forEach var="interest" items="${interest}" >
						<span style="margin-left: 30px;display: inline-block; height: 40px; line-height: 40px; width: fit-content; padding-left: 10px;">${interest}</span>
	    				</c:forEach>					
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>