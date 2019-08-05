<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${root}/resources/css/mypage_point.css"/>
<title>Insert title here</title>
</head>
<body>	
	<div class="container">
	<jsp:include page="../template/myMenu.jsp"/>
		<div class="pts_title">
			<div>
				<h3>읽움 포인트</h3>
			</div>
			<h5>적립금은 회원님이 카드나 현금으로 결제한 금액에 대해서만 적용하는 할인 서비스이며, 적립금이나 할인쿠폰
				등으로 결제한 금액에 대해서는 적립되지 않습니다. 또한 상품을 구매하실 때에만 사용할 수 있습니다. 읽움 적립금의
				유효기간은 적립일로부터 1년이며, 먼저 적립된 적립금부터 순차적으로 사용됩니다.</h5>

			<div class="pts_balance">
				<h4>현재 나의 읽움 포인트는? $[memberDto.member_point]</h4>
			</div>

			<div class="pts_search">
				<table>
					<tr>
						<th>주문일자</th>
						<th>구입도서</th>
						<th>주문번호</th>
						<th>읽움 포인트</th>
					</tr>
					<c:forEach var="i" begin="1" end="5">
						<tr>
						<td>2019.07.29</td>
						<td>내가 선명해지는 한 단어의 힘</td>
						<td>10935487203</td>
						<td>720</td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>