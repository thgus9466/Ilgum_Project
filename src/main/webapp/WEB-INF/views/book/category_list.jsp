<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>도서 검색</title>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/book/search_list.css">
</head>
<body>
	<div class="container">
		<c:if test="${count==0 || bookList.size()==0}">
			<div id="result">
				'<span style="color: red;">${book_name}</span>' 관련 책이 존재하지 않습니다.
			</div>
		</c:if>

		<c:if test="${count >0}">
			<div id="result">
				V <span id="book_name"><b>${text}</b></span>에 대한 결과 총 
				<span style="color:green" id="book_quantity">${count}</span>권의 도서가 검색되었습니다.
			</div>
		
			<c:forEach var="bookDto" items="${bookList}">
			<div id="content1">
				<div id="sub1-1"><input type="checkbox" id="check"/></div>
				
				<div id="sub1-2">
					<a href="javascript:void(0);" onclick="goBookDetail('${root}', '${bookDto.book_isbn}')"><img src="${bookDto.book_img_url}" id="book1"></a>
				</div>
				
				<div id="sub2">
					<div>
						<span id="best">베스트셀러</span>&nbsp;
						<a href="#"><span id="book_name"><b>${bookDto.book_name}</b></span></a>
					</div>
					<ul id="info">
						<li style="padding-left: 0px;">${bookDto.book_writer}</li>
						<li>${bookDto.book_publisher}</li>
						<li style="border-right: 0px;">${bookDto.book_publish_date}</li>
					</ul><br/>
					<div id="desc">${bookDto.book_intro}</div>
	
					<div>
						<span id="oprice">${bookDto.book_cost}원</span>
						<span id="nprice">${bookDto.book_price}원</span>
						<span id="sale">10% 할인</span>
					</div>
				</div>
				
				<div id="sub3">
					<ul>
						<li><span style="font-size:0.7em;">수량</span><input type="number" min="0" value="1" id="num"></li>
						<li><input type="button" value="장바구니" id="btn"></li>
						<li><input type="button" value="바로구매" id="buy"></li>
					</ul>
				</div>
			</div>
			</c:forEach>
		</c:if>
		
		<div align = "center" style="margin: 30px 0px;;">
	      <c:if test="${count > 0}">
	         <c:set var="pageBlock" value="${10}"/>
	         <fmt:parseNumber var="pageCount" value="${count/boardSize + (count%boardSize==0? 0:1)}" integerOnly="true"/>
	         
	         <%--
	            int startPage = (int) ( (currentPage - 1) / pageBlock ) * pageBlock + 1;
	            int endPage = (int) startPage + pageBlock - 1;
	          --%>
	          
	         <fmt:parseNumber var="result" value="${(currentPage - 1) / pageBlock}" integerOnly="true"/>
	         <c:set var="startPage" value="${result * pageBlock + 1}"/>
	         <c:set var="endPage" value ="${startPage + pageBlock - 1}"/>
	
	         <c:if test="${endPage > pageCount}">
	            <c:set var="endPage" value="${pageCount}"/>
	         </c:if>
	         <c:if test="${startPage > pageBlock}">
	            <a href="${root}/book/category1.do?pageNumber=${startPage-pageBlock}&book_category=${book_name}">[이전]</a>
	         </c:if>
	         
	         <c:forEach var="i" begin="${startPage}" end="${endPage}">
	            <a href = "${root}/book/category1.do?pageNumber=${i}&book_category=${book_name}">[${i}]</a>
	         </c:forEach>
	         
	         <c:if test="${endPage < pageCount}">
	            <a href="${root}/book/category1.do?pageNumber=${startPage+pageBlock}&book_category=${book_name}">[다음]</a>
	         </c:if>
	      </c:if>
   		</div>
	</div>
</body>
</html>