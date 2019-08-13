<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${root}/resources/javascript/book/bookDetail.js"></script>
<link rel="stylesheet" href="${root}/resources/css/book/bookDetail.css"/>
<title>Insert title here</title>
</head>
<body>
	<div class="dt_wrapper">
		<div class="dt_header"></div>

		<div class="dt_content">
			<div class="book_index">
				<ul>
					<li style="font-weight: 50;">홈</li>
					<li>> 자기계발</li>
				</ul>
			</div>

			<div class="book_info1">
				<div class="book_img">
					<img src="${bookDto.book_imgxl_url}" alt="">
				</div>

				<div class="dt_desc">
					<div class="book_title">
						<ul>
							<li>${bookDto.book_name}</li>
							<li>${bookDto.book_writer}</li>
							<li>김고명 옮김</li>
							<li>${bookDto.book_publisher}</li>
							<li>${bookDto.book_publish_date}</li>
						</ul>
					</div>

					<div class="book_price">
						<div class="price_title">
							<ul>
								<li>정가</li>
								<li>판매가</li>
								<li>포인트 적립</li>
								<li>배송비</li>
							</ul>
						</div>

						<div class="price_info">
							<ul>
								<li>${bookDto.book_cost}</li>
								<li><strong>${bookDto.book_price}</strong></li>
								<li>720포인트 [5% 적립]</li>
							</ul>
						</div>
					</div>

					<div class="book_quantity">
						<span>구매수량</span>
						<span><input type="text" value="1"size="1"></span>
						<span>+</span>
						<span>-</span>
					</div>

					<div class="book_buy_btn">
						<a href="javascript:void(0);" onclick="bookPay('${root}', ${bookDto.book_isbn}, ${getSessionId})" style="margin-right: 5px; background: #179D24; color: white;">구매하기</a>
						<a href="" style="margin-right: 5px; background: #76CE53; color: white;">장바구니 담기</a>
						<a href="" style="background: #F2F2F2; border: solid 1px #D9D9D9;">내 서재 담기</a>
					</div>
				</div>
			</div>

			<div class="info_bar1">
				<a href="">상품정보</a>
				<a href="">회원리뷰</a>
				<a href="">교환/반품/품절</a>
				<div></div>
			</div>

			<div class="prod_info">
				<h3>책 소개</h3>
				${bookDto.book_intro}
			</div>

			<div class="prod_contents">
				<h3>목차</h3>
				${bookDto.book_index}
			</div>

			<div class="info_bar2">
				<a href="">상품정보</a>
				<a href="">회원리뷰</a>
				<a href="">교환/반품/품절</a>
				<div></div>
			</div>

			<div class="book_reply">
				<h3>도서 리뷰</h3>
			</div>
		</div>

	</div>
</body>
</html>