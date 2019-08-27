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
		<div class="content" style="width: auto">
		
			<div class="head">
				<p>추천도서</p>
				<p><span style="font-size: 1px;">●</span> 설정하신 관심사 목록으로 회원님에게 도서가 추천됩니다.</p>
			</div>
			<!-- First 추천 도서 -->
			
			<c:if test="${firstcount == 0}">
				<div style="background: #e6e6e6; text-align: center; height: 60px;line-height: 60px;">
					<h4>관심사 설정이 되어있지 않습니다. </h4>
				</div>
			</c:if>
			<c:if test="${firstcount > 0}">
				<div class="first">
				
					<!-- First 추천 도서 이미지 -->			
					<div>
						<c:forEach var="first" items="${firstBookList}">
						<div class="bestImg" style="margin-right: 85px">
							<a href="javascript:void(0);" onclick="goBookDetail('${root}', ${first.book_isbn})">
								<img src="${first.book_img_url}"/>
							</a>
						</div>
						</c:forEach>
					</div>
					
					 <!-- First 추천 도서 내용 -->
					<div>
						<c:forEach var="first" items="${firstBookList}">
							<div class="bestContent" style="margin-right: 70px;margin-left: 10px;">
								<div class="bookName">${first.book_name}</div>  <!-- 책제목 -->
								<div class="bookWriter">${first.book_writer}</div>  <!-- 작가 -->
								<div class="bookPrice">가격  : <fmt:formatNumber value="${first.book_price}" pattern="#,###,###"/>원</div>  <!-- 가격 -->
							</div>
						</c:forEach>	
					</div>
				</div>
			</c:if>


			<span></span>
			<!-- Second 추천 도서 -->
			<c:if test="${secondcount > 0}">
				<div class="first">
				
					<!-- Second 추천 도서 이미지 -->			
					<div>
						<c:forEach var="second" items="${SecondbookList}">
						<div class="bestImg">
							<a href="javascript:void(0);" onclick="goBookDetail('${root}', ${book.book_isbn})">
								<img src="${second.book_img_url}"/>
							</a>
						</div>
						</c:forEach>
					</div>
					
					 <!-- Second 추천 도서 내용 -->
					<div>
						<c:forEach var="second" items="${SecondbookList}">
							<div class="bestContent">
								<div class="bookName">${second.book_name}</div>  <!-- 책제목 -->
								<div class="bookWriter">${second.book_writer}</div>  <!-- 작가 -->
								<div class="bookPrice">가격  : <fmt:formatNumber value="${second.book_price}" pattern="#,###,###"/>원</div>  <!-- 가격 -->
							</div>
						</c:forEach>	
					</div>
				</div>
			</c:if>

			<c:if test="${secondcount == 0}">
				<div style="background: #e6e6e6; text-align: center; height: 60px;line-height: 60px;">
					<h4>관심사 설정이 되어있지 않습니다. </h4>
				</div>
			</c:if>
			<span></span>

			<!-- Third 추천 도서 -->
			<c:if test="${thirdcount > 0}">
				<div class="first">
				
					<!-- Second 추천 도서 이미지 -->			
					<div>
						<c:forEach var="third" items="${ThirdbookList}">
						<div class="bestImg">
							<a href="javascript:void(0);" onclick="goBookDetail('${root}', ${third.book_isbn})">
								<img src="${third.book_img_url}"/>
							</a>
						</div>
						</c:forEach>
					</div>
					
					 <!-- Second 추천 도서 내용 -->
					<div>
						<c:forEach var="second" items="${ThirdbookList}">
							<div class="bestContent">
								<div class="bookName">${third.book_name}</div>  <!-- 책제목 -->
								<div class="bookWriter">${third.book_writer}</div>  <!-- 작가 -->
								<div class="bookPrice">가격  : <fmt:formatNumber value="${third.book_price}" pattern="#,###,###"/>원</div>  <!-- 가격 -->
							</div>
						</c:forEach>	
					</div>
				</div>
			</c:if>

			<c:if test="${thirdcount == 0}">
				<div style="background: #e6e6e6; text-align: center; height: 60px;line-height: 60px;">
					<h4>관심사 설정이 되어있지 않습니다. </h4>
				</div>
			</c:if>
		</div><!-- content -->
	</div>
</body>
</html>