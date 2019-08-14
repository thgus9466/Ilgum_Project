<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>


<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${root}/resources/css/admin/adminRead.css">
<script type="text/javascript" src="${root}/resources/javascript/admin/AdbminBookUpdate.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script> 
<title>도서 상세내용</title>
</head>
<body>
	<div class="header"></div>
	<div class="sidebar">
	<jsp:include page="AdminSidebar.jsp"></jsp:include>
	</div>
	<div class="main">
		<div class="board_div">
			<h2 class="page-header">도서 상세내용</h2>
			<div class="search_div">
				<form class="form_style" id="boardSearchVO" name="boardSearchVO">
					<input type="hidden" name="count" value="${count}"/>
					<input type="hidden" name="boardSize" value="${boardSize}"/>
					<input type="hidden" name="currentPage" value="${currentPage}"/>
				</form>
			</div>
				

			<!--  BookInsert -->
			<div>		
					<div id="borderMain">
						<div id=border>
							<label id="label">도서번호</label><!-- 도서번호(book_sibn) -->
							<label id="book_textFront">${bookDto.book_isbn}</label>

							<label id="label">도서명</label>
							<label id="book_textback">${bookDto.book_name}</label>
						</div>
						
						<div id=border >
							<label id="label">저자</label>
							<label id="book_textFront" style="height: 22px; overflow: hidden;">${bookDto.book_writer}</label>

							<label id="label">도서분류</label>
							<label id="book_textback">${bookDto.book_category}</label>
						</div>
						
						<div id=border>
							<label id="label">출판사</label>
							<label id="book_textFront">${bookDto.book_publisher}</label>

							<label id="label">출판일</label>
							<label id="book_textback">
								<fmt:parseDate value='${bookDto.book_publish_date}' var='book_publish_date' pattern='yyyy-MM-dd HH:mm:ss'/>
								<fmt:formatDate value="${book_publish_date}" pattern="yyyy/MM/dd"/>
							</label>
						</div>
						
						<div id=border>
							<label id="label">도서원가</label>
							<label id="book_textFront">${bookDto.book_cost}원</label>

							<label id="label">도서가격</label>
							<label id="book_textback">${bookDto.book_price}원</label>
						</div>
						
						<div id=border>
							<label id="label">이미지1</label>
							<img id="book_textFront" src="${bookDto.book_img_url}">
							
							<label id="label">이미지2</label>
							<img id="book_textback" src="${bookDto.book_imgxl_url}">
						</div>
						
						<div id=border1 style="margin:0px auto; width: 550px;">
							<label id="label1">목차</label><br/>
				        	<textarea id="message1" name="book_index" style="width: 550px;">${bookDto.book_index}</textarea>
						</div>
						
						<div id=border1 style="margin:0px auto; width: 550px;">
							<label id="label1">책소개</label>
				        	<textarea id="message2" name="book_intro" style="width: 550px;">${bookDto.book_intro}</textarea>
						</div>
						
						<div id=border style="margin: 0px auto; width: 190px;" >
							<input type="button" class="btn btn-primary btn-success" id="searchBtn" style="width: 60px;" value="목록" onclick="location.href='${root}/admin/AdminBook.do?pageNumber=${pageNumber}'"/>
							<input type="button" class="btn btn-primary btn-success" id="searchBtn" style="width: 60px;" value="수정" onclick="upFun('${root}','${bookDto.book_isbn}','${pageNumber}')"/>
							<input type="button" class="btn btn-primary btn-success" id="searchBtn" style="width: 60px;" value="삭제" onclick="location.href='${root}/admin/AdminBookDelete.do?pageNumber=${pageNumber}&book_isbnr=${bookDto.book_isbn}"/>
						</div>
					</div>
			</div>
			

		</div>
		
		<!-- Optional JavaScript -->
	    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
		
	</div>
</body>
</html>