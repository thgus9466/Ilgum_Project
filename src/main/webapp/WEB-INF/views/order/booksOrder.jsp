<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${root}/resources/css/member/join.css">
<link rel="stylesheet" href="${root}/resources/css/book/bookPay.css" />
<link rel="stylesheet" type="text/css" href="${root}/resources/css/buser/cart.css">
<script type="text/javascript" src="${root}/resources/javascript/member/join.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>결제</title>
</head>
<body>
	<div class="container">
		<div class="ttitle">결제 정보</div>
		<form action="${root}/order/buserOrderOk.do" method="get">
		
		<input type="hidden" name="book_isbn" value="${book_isbn}">
		<input type="hidden" name="cart_quantity" value="${cart_quantity}">
		<input type="hidden" name="total_price" value="${total_price}">
		
			<div align="center" class="blist" style="float: left;">

				<table class="tfirst">
					<thead>
						<tr>
							<td align="center" width="400">상품정보</td>
							<td align="center" width="150">상품금액</td>
							<td align="center" width="90">배송비</td>
						</tr>
					</thead>
				</table>

				<div style="height: 400px; overflow: auto; margin: 10px;">

					<table>
						<c:forEach var="orderList" items="${orderList}">
							<tr id="tcontent">
								<td align="center" width="400"><img alt="이미지 준비중"
									src="${orderList.book_img_url}" height="90"
									style="float: left;">
									<ul>
										<li>${orderList.book_name}</li>
										<br/>
										<li>수량 : ${orderList.cart_quantity}</li>
									</ul></td>
								<td align="center" width="130"><fmt:formatNumber
										value="${orderList.book_price*orderList.cart_quantity}" />원</td>
								<td align="center" width="100">무료배송</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="ttitle">배송지 정보</div>

				<div class="infos">
					<div class="infos_sub">
						<span style="color: red; width: 20%; margin: 0px;">*</span> <span>수령자</span>
					</div>
					<div class="infos_detail">
						<input class="infos_input" type="text" name="receiver" />
					</div>
				</div>

				<div class="infos">
					<div class="infos_sub">
						<span style="color: red; width: 20%; margin: 0px;">*</span> <span>휴대폰
							번호</span>
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
						<div style="float: left;">
							<input class="infos_input" style="width: 80px; height: 26px;"
								type="text" name="phone1_2" />
						</div>
						<div style="float: left;" class="info_input">
							<input class="infos_input" style="width: 80px; height: 26px;"
								type="text" name="phone1_3" />
						</div>
					</div>
				</div>

				<div style="height: 150px;" class="infos">
					<div class="infos_sub">
						<span style="color: red; width: 20%; margin: 0px;">*</span> <span>주소</span>
					</div>
					<div class="infos_detail">
						<input style="width: 100px; float: left;" class="infos_input"
							type="text" name="member_zipcode" id="member_zipcode" readOnly />
						<div style="float: left;">
							<input class="infos_button" type="button" value="우편번호 찾기"
								id="zipcodeBtn" onclick="execPostCode()">
						</div>
						<div>
							<input class="infos_input" type="text" name="member_address1"
								id="member_address1" readOnly />
						</div>
						<div>
							<input class="infos_input" type="text" name="member_address2"
								id="member_address2" /> <span
								style="font-size: 12px; display: block; height: 15px; display: none; color: red;"
								id="zipcode">우편번호 찾기로 주소를 입력해 주세요.</span>
						</div>
					</div>
				</div>
				
				<div class="infos">
					<div class="infos_sub">
						<span>배송요청사항</span>
					</div>
					<div class="infos_detail">
						<input class="infos_input" type="text" name="request" />
					</div>
				</div>
			</div>
			<div class="pay_wrapper">
				<div class="pay">
					<div>
						<ul>
							<li>총 상품금액</li>
							<li>총 할인금액</li>
							<li>배송비</li>
							<li>총 결제금액</li>
						</ul>
					</div>

					<div>
						<ul>
							<li><fmt:formatNumber value="${total_cost}" />원</li>
							<li><fmt:formatNumber value="${total_cost-total_price}" />원</li>
							<li>무료배송</li>
							<li><fmt:formatNumber value="${total_price}" />원</li>
						</ul>
					</div>

					<div>
						<button type="submit">결제하기</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>