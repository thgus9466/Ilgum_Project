<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${root}/resources/css/mypage/deliver.css"/>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/index/section.css"/>
<title>Insert title here</title>
</head>
<body>

	<div class = "wrap">
		<jsp:include page="../template/myMenu.jsp"/>
		<div class="content" style="width: 70%">
		
			<div class="head">
				<p>${member_id}님의 쿠폰목록입니다.</p>
				<p><span style="font-size: 1px;">●</span> 유효기간이 만료된 쿠폰은 자동으로 삭제됩니다.</p>
			</div>
			<!-- 쿠폰테이블 -->
			
			<h4>사용가능한 쿠폰: ${couponCount}장</h4>
			<div class="full-right">
				<c:if test="${couponCount==0}">
					<table style="border: 1px solid #EAEAEA;">
						<tr>
							<td>사용가능한 쿠폰이 없습니다.</td>
						</tr>
					</table>
				</c:if>

				<c:if test="${couponCount>0}">
					<div class="table-Div">
						<table class="full-center"style="width: 100%; height: 100px; border: 1px solid black;" >
							<tr style="border: 1px solid black;">
								<th style="width:20%;text-align: center;border-collapse: collapse;">쿠폰번호</th>
								<th style="width:20%;text-align: center;border-collapse: collapse;">쿠폰이름</th>
								<th style="width:20%;text-align: center;border-collapse: collapse;">쿠폰내용</th>
								<th style="width:20%;text-align: center;border-collapse: collapse;">할인율</th>
								<th style="width:20%;text-align: center;border-collapse: collapse;">유효기간</th>
							</tr>
							<tbody style="border: 1px solid black;">
								<c:if test="${couponCount>0}">
									<c:forEach items="${couponList}" var="coupon">
										<tr >
											<td style="text-align: center; border: 1px solid black;border-collapse: collapse;">
												<c:out value="${coupon.member_couponNumber}"></c:out>
											</td>
											<td style="text-align: center; border: 1px solid black;border-collapse: collapse;">
												<c:out value="${coupon.admin_couponName}"></c:out>
											</td>
											<td style="text-align: center; border: 1px solid black;border-collapse: collapse;">
												<c:out value="${coupon.admin_content}"></c:out>
											</td>
											<td style="text-align: center; border: 1px solid black;border-collapse: collapse;">
												<c:out value="${coupon.admin_sale*100}"></c:out>%
											</td>
											<td style="text-align: center; border: 1px solid black;border-collapse: collapse;">
												<c:out value="${coupon.admin_couponUseday}"></c:out>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>				
				</c:if>
			</div>
		</div><!-- content -->
	</div>
</body>
</html>