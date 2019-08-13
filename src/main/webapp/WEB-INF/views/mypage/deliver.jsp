<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${root}/resources/css/mypage/deliver.css"/>
<title>Insert title here</title>
</head>
<body>
	<div class = wrap>
	<jsp:include page="../template/myMenu.jsp"/>
	<div class="content">
		<div class="head">
			<p>주문 배송 조회하기</p>
			<p><span style="font-size: 1px;">●</span> 입금대기 상태나 주문완료 상태 또는 재고 확인 중인 상태에서는 회원님이 직접 주문을 취소하실 수 있습니다.</p>
			<p><span style="font-size: 1px;">●</span> 출고준비 상태에서는 취소가 불가능합니다.</p>
		</div>
		
		<div class="search_period">
			<div class="search_btn">
				<div><a href="">최근 1주일</a></div>
				<div><a href="">1개월</a></div>
				<div><a href="">3개월</a></div>
				<div><a href="">6개월</a></div>
			</div>
			
			<div>
				<div class="search_calendar">
					<img src="img/calendar.png" alt="">
				</div>
				<div style="float : left">~</div>		
				<div class="search_calendar">
					<img src="img/calendar.png" alt="">
				</div>
			</div>
		</div>

		<div class="search_table">
			<table>
				<tr>
					<th>주문번호</th>
					<th>주문일자</th>
					<th>주문내역</th>
					<th>주문금액/수량</th>
					<th>주문상태</th>
					<th>배송상태</th>
				</tr>
				<tr>
					<td>2938472</td>
					<td>2019.07.30</td>
					<td>내가 선명해지는 한 단어의 힘</td>
					<td>14,400원/1</td>
					<td>입금대기</td>
				</tr>
			</table>
		</div>
	</div>
	</div>
</body>
</html>