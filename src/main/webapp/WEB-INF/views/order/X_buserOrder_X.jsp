<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${root}/resources/css/book/bookPay.css"/>
<script type="text/javascript" src="${root}/resources/javascript/member/join.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	
		<div style="background: #F2F2F2;">결제정보</div>

		<div class="pay_content">
			<div style="margin-top: 20px;">주문정보</div>

			<div class="payment_info">
				<table>
					<tr>
						<th>상품정보</th>
						<th>상품금액</th>
						<th>포인트</th>
						<th>배송비</th>
					</tr>
					<tr>
					<c:forEach var="orderList" items="${orderList}">
						<td>
						<img src="${orderList.book_img_url}" alt="">
							<div class="prod_info">
								<div class="prod_info1">
									<ul>
										<li>${orderList.book_name}</li>
										<li>수량 : ${orderDto.cart_quantity}</li>
									</ul>
								</div>
							</div>
						</td>
						<td><fmt:formatNumber value="${orderList.book_price}" maxFractionDigits="0"/>원</td>
						<td><fmt:formatNumber value="${orderList.book_price*0.05}" maxFractionDigits="0"/>원</td>
						<td>무료배송</td>
					</c:forEach>
					</tr>
				</table>
			</div>

			<div style="margin-top: 20px;">배송지 정보</div>

			<div class="address">
				<div class="addr_title">
					<ul>
						<li>받으실 분</li>
						<li>연락처1</li>
						<li>배송지</li>
						<li>배송 요청사항</li>
					</ul>
				</div>

				<div class="addr_content">
					<div>
						<input type="text" name="receiver">
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
						<input type="text" name="phone1_2"/>
						<input type="text" name="phone1_3"/>
					</div>
					<div>
						<input style="width: 100px; float: left;" class = "infos_input" type="text" name="member_zipcode" id="member_zipcode" readOnly/>
						<div>
							<input class = "infos_button" type="button" value="우편번호 찾기" id="zipcodeBtn" onclick="execPostCode()">
						</div>
						<div>
							<input class = "infos_input" type="text" name="member_address1" id="member_address1" readOnly/>
						</div>
						<div>
							<input class = "infos_input" type="text" name="member_address2" id="member_address2"/>
							<span style="font-size: 12px; display: block; height: 15px;display: none;color : red;" id="zipcode">우편번호 찾기로 주소를 입력해 주세요.</span>
						</div>
					</div>
					<div>
						<input type="text" name="request">
					</div>
				</div>
			</div>

			<div>결제수단</div>

			<div class="option_wrapper">
				<div class="pay_option">
					<input type="radio" name="option" value="card">신용카드
					<input type="radio" name="option" value="phone">휴대폰 결제
					<input type="radio" name="option" value="realtime">실시간 계좌이체
					<input type="radio" name="option" value="">무통장 입금
				</div>

				<div class="option_content">
					<div>
						<ul>
							<li>카드유형</li>
							<li>카드선택</li>
							<li>할부방식</li>
						</ul>
					</div>

					<div>
						<ul>
							<li><input type="radio" name="card">개인카드 <input
								type="radio" name="card">법인카드</li>
							<li>
								<select>
									<option value="">농협</option>
									<option value="">비씨카드</option>
									<option value="">신한카드</option>
									<option value="">현대카드</option>
								</select>
							</li>
							<li>
								<select>
									<option value="">일시불</option>
									<option value="">3개월</option>
								</select>
							</li>
						</ul>
					</div>
				</div>

				<div class="payment_phone">
					<div class="phone_title">
						<ul>
							<li>이름</li>
							<li>휴대폰</li>
						</ul>
					</div>

					<div class="phone_content">
						<ul>
							<li><input type="text" name="receiver"></li>
							<li>
							<select name="phone1_1">
								<option value="" selected disabled>선택</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="019">019</option>
							</select>
							<input type="text" name="phone1_2"/>
							<input type="text" name="phone1_3"/>
							</li>
						</ul>
					</div>
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
						<li>적립 포인트</li>
						<li>총 결제금액</li>
					</ul>
				</div>
				
				<div>
					<ul>
						<li><fmt:formatNumber value="${total_cost}"/>원</li>
						<li><fmt:formatNumber value="${total_cost-total_price}"/>원</li>
						<li>무료배송</li>
						<li><fmt:formatNumber value="${member_point}"/>원</li>
						<li><fmt:formatNumber value="${total_price}"/>원</li>
					</ul>
				</div>

				<div>
					<button type="submit" value="Submit">결제하기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>