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
	<div class="container">
		<div class="deliver_wrapper">
			<div>
				<strong>주문/배송 조회</strong>
			</div>
			<div class="deliver_desc">
				<strong>입금대기 상태나 주문완료 상태 또는 재고 확인 중인 상태에서는 회원님이 직접 주문을 취소하실 수 있습니다.</strong>
				<strong>출고준비 상태에서는 취소가 불가능합니다.</strong>
			</div>

			<div class="search_period">
				<div class="search_btn">
					<a href=""><div style="border-left: solid 1px #D9D9D9;">최근 1주일</div></a>
					<a href=""><div>1개월</div></a>
					<a href=""><div>3개월</div></a>
					<a href=""><div>6개월</div></a>
				</div>

				<div class="search_calendar_begin">
					<img src="img/calendar.png" alt="">
				</div>
				
				<div>~</div>
				
				<div class="search_calendar_end">
					<img src="img/calendar.png" alt="">
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
						<th>배송추적</th>
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