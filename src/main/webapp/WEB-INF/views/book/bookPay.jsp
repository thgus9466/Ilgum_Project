<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${root}/resources/css/book/bookPay.css"/>
<script type="text/javascript" src="${root}/resources/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/member/join.js"></script>
<script type="text/javascript">
    $(function() {
      $(".pay_option > input:eq(0)").click(function() {
        $(".payment_phone").css("display", "none");
        $(".option_content").css("display", "block");
      });

      $(".pay_option > input:eq(1)").click(function() {
        $(".option_content").css("display", "none");
        $(".payment_phone").css("display", "block");
      });
    });
  </script> 
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
					<c:forEach var="payList" items="${payList}">
						<td>
							<img src="${payList.book_img_url}" alt="">
							<div class="prod_info">
								<div class="prod_info1">
									<ul>
										<li>${payList.book_name}</li>
									</ul>
								</div>
							</div>
						</td>
						<td>${payList.book_price}</td>
						<td>${book_point}</td>
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
						<li>연락처2</li>
						<li>배송지</li>
						<li>배송 요청사항</li>
					</ul>
				</div>
				
				<c:if test="${memberDto.member_id!=null}">
				<div class="addr_content">
					<div>
						<input type="text" value="${memberDto.member_name}">
					</div>
					<div>
						<input type="text" value="010">
						<input type="text">
						<input type="text">
					</div>
					<div>
						<input type="text" value="010">
						<input type="text">
						<input type="text">
					</div>
					<div>
						<input type="text" value="${memberDto.member_address1}"><a href="javascript:void(0);" onclick="execPostCode()"><span>배송지 조회</span>
						</a>
					</div>
					<div>
						<input type="text">
					</div>
				</div>
				</c:if>
				
				<c:if test="${memberDto.member_id==null}">
				<div class="addr_content">
					<div>
						<input type="text" name="receiver">
					</div>
					<div>
						<input type="text" name="phone1_1" value="010">
						<input type="text" name="phone1_2">
						<input type="text" name="phone1_3">
					</div>
					<div>
						<input type="text" name="phone2_1" value="010">
						<input type="text" name="phone2_2">
						<input type="text" name="phone2_3">
					</div>
					<div>
						<input type="text" name="member_address1"><a href="javascript:void(0);" onclick="execPostCode()"><span>배송지 조회</span>
						</a>
					</div>
					<div>
						<input type="text" name="requests">
					</div>
				</div>
				</c:if>
				
			</div>

			<div>결제수단</div>

			<div class="option_wrapper">
				<div class="pay_option">
					<input type="radio" name="option" value="card"/>신용카드 
					<input type="radio" name="option" value="phone"/>휴대폰 결제
					<input type="radio" name="option" value="realtime"/>실시간 계좌이체
					<input type="radio" name="option" value=""/>무통장 입금
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
							<li>
								<input type="radio" name="card"/>개인카드
								<input type="radio" name="card"/>법인카드
							</li>
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
							<li>
								<input type="text">
							</li>
							<li>
								<input type="text" value="010">
								<input type="text">
								<input type="text">
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="pay_wrapper">
			<div class="pay">
				<div>총 상품금액</div>

				<div>총 할인금액</div>

				<div>배송비</div>

				<div>포인트 적립</div>

				<div>총 결제금액</div>

				<div>
					<a href=""><div>결 제 하 기</div></a>
				</div>
			</div>
		</div>
	</div>
	<form action="" method="post">
		
	</form>
</body>
</html>