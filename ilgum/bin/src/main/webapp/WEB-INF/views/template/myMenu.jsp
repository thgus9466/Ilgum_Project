<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/template/myMenu.css">
</head>
<body>
	<div class="myMenu">
		<h3>마이페이지</h3>
		
		<div class="menu1">
			<ul>
				<li><span id="member_name">홍길동</span> 회원님</li>
				<li>등급 : <span>일반 회원</span></li>
				<li>적립금 : <span id="member_point">0</span>원</li>
				<li>교환권/쿠폰 : <span>0</span>장</li>
			</ul>
		</div>
		
		<div class="menu2">
			<ul>
				<li><a href="#">내 정보 수정</a></li>
				<li><a href="#">내 관심분야</a></li>
				<li><a href="#">주문/배송 조회</a></li>
				<li><a href="#">장바구니</a></li>
				<li><a href="#">1:1 상담내역</a></li>
			</ul>
		</div>
		
		<h3>고객센터</h3>
		
		<div class="menu3">
			<ul>
				<li>쇼핑 도우미</li>
				<li><a href="#">- 적립금 사용안내</a></li>
				<li><a href="#"> - 주문/결제</a></li>
				<li><a href="#">- 교환 및 환불</a></li>
				<li><a href="#">- 주문/배송 조회</a></li>
			</ul>
			<br/>
			<ul>
				<li>1:1 고객상담</li>
				<li><a href="#">- 주문 확인 및 배송</a></li>
				<li><a href="#">- 환불 처리</a></li>
				<li><a href="#">- 주문 취소</a></li>
				<li><a href="#">- 매장 재고 문의</a></li>
			</ul>
		</div>
		
		<div class="menu4">
			<ul>
				<li>고객상담전화</li>
				<li><b>1544-9600</b></li>
				<li>월~금 09:00 ~ 18:00</li>
				<li>점심시간 12:00 ~ 13:00</li>
			</ul>
		</div>
	</div>
</body>
</html>