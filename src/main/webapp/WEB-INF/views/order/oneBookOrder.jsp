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
<title>Insert title here</title>
</head>
<body>
<form action="${root}/order/nonMemberPay.do" method="post">
	<input type="hidden" name="order_book_count" value="${book_quantity}"/>
	<input type="hidden" name="order_total_price" value="${total_price}"/>
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
					<c:forEach var="bookList" items="${bookList}">
					<input type="hidden" name="order_book_isbn" value="${bookList.book_isbn}"/>
					<tr>
						<td>
						<img src="${bookList.book_img_url}" alt="" style="width: 100px; height: 100px; float: left">
							<div class="prod_info">
								<div class="prod_info1">
									<ul>
										<li>${bookList.book_name}</li>
										<li>수량 : ${book_quantity}</li>
									</ul>
								</div>
							</div>
						</td>
						<td>${bookList.book_price}</td>
						<td>-</td>
						<td>무료배송</td>
					</tr>
					</c:forEach>
				</table>
			</div>

			<div style="margin-top: 20px;">배송지 정보</div>

			<div class="address">
				<div class="addr_title">
					<ul>
						<li>받으실 분</li>
						<li>연락처</li>
						<li>배송지</li>
						<li>상세주소</li>
						<li>배송 요청사항</li>
					</ul>
				</div>

				<div class="addr_content">
					<div>
						<input type="text" name="order_name">
					</div>
					<div>
						<input type="text" name="order_book_user_number" value="010">
						<input type="text" name="phone2">
						<input type="text" name="phone3">
					</div>
					<div>
						<input type="text" name="order_zipcode">
						<a href="">
							<span>배송지 조회</span>
						</a><br/>
					</div>
					<div>
						<input type="text" name="order_book_user_address1"/>
					</div>
					<div>
						<input type="text" name="order_book_user_address2"/>
					</div>
					<div>
						<input type="text" name="requests">
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
							<li><input type="text"></li>
							<li><input type="text" value="010"> <input
								type="text"> <input type="text"></li>
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
						<li><fmt:formatNumber value="${total_cost}" type="number"/></li>
						<li><fmt:formatNumber value="${total_cost*0.1}" type="number"/></li>
						<li>무료배송</li>
						<li>-</li>
						<li><fmt:formatNumber value="${total_price}" type="number"/></li>
					</ul>
				</div>

				<div>
					<button type="submit" value="Submit">결제하기</button>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>