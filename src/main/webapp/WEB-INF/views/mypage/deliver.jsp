<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${root}/resources/css/mypage/deliver.css"/>
<title>Insert title here</title>
</head>
<body>
	
	<div class = "wrap">
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
					
					<c:forEach var="userOrderDto" items="${userOrderDtoList}">
						<tr>
							<td>${userOrderDto.order_bunho}</td>
							<td>
	<%-- 						<fmt:parseDate var="order_date" value="${userOrderDto.order_date}" pattern="yyyy-MM-dd HH:mm:ss"/> --%>
	<%-- 						${order_date} --%>
							${userOrderDto.order_date}
							</td>
							<td>${userOrderDto.book_name}</td>
							<td>${userOrderDto.order_total_price}원/${userOrderDto.order_book_count}개</td>
							<td>입금대기</td>
						</tr>
					</c:forEach>
				</table>
				<c:if test="${count == 0 ||userOrderDtoList.size() == 0}">
					<div style="background: #e6e6e6; text-align: center; height: 60px;line-height: 60px;">
						<h4>주문한 내역이 없습니다</h4>
					</div>
				</c:if>			
				<div align="center">
					<c:if test="${count>0}">
						<c:set var="pageBlock" value="${1}"/>
						<fmt:parseNumber var="pageCount" value="${count/boardSize+(count%boardSize==0? 0:1)}" integerOnly="true"/>
						
						<%-- 
							int startPage = (int)((currentPage-1)/pageBlock)*pageBlock+1;
							int endPage = (int)startPage+pageBlock-1;
						 --%>
						 
						 <fmt:parseNumber var="result" value="${(currentPage-1)/pageBlock}" integerOnly="true"/>
						 <c:set var="startPage" value="${result*pageBlock+1}"/>
						 <c:set var="endPage" value="${startPage+pageBlock-1}"/>
						 
						 <c:if test="${endPage>pageCount}">
						 	<c:set var="endPage" value="${pageCount}"/>
						 </c:if>
						 
						 <c:if test="${startPage>pageBlock}">
						 	<a href="${root}/mypage/deliver.do?pageNumber=${startPage-pageBlock}">[이전]</a>
						 </c:if>
						 
						 <c:forEach var="i" begin="${startPage}" end="${endPage}">
						 	<a href="${root}/mypage/deliver.do?pageNumber=${i}">[${i}]</a>
						 </c:forEach>
						 
						 <c:if test="${endPage<pageCount}">
						 	<a href="${root}mypage/deliver.do?pageNumber=${startPage+pageBlock}">[다음]</a>
						 </c:if>
					</c:if>			
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>