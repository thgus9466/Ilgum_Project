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
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/admin/bookinsert.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
			<h2 class="page-header">도서  수정</h2>

				

			<!--  BookInsert -->
			<div>
				<form name="bookInsert"  action="${root}/admin/AdminBookUpdateOk.do?pageNumber=${pageNumber}" method="post" onsubmit="return booktCheck(this)">
					<input type="hidden" name="book_isbn" value="${bookDto.book_isbn}"/>
					<input type="hidden" name="pageNumber" value="${pageNumber}"/>

					<div id="borderMain">
						<div id=border>
							<label id="label">도서번호</label><!-- 도서번호(book_isbn) -->
							<input id="book_textFront" class="book_isbn" name="book_isbn"type="text"class="form-control" value="${bookDto.book_isbn}" disabled="disabled"/>

							<label id="label">도서명</label>
							<input id="book_textback" class="book_name" name="book_name"type="text"class="form-control" value="${bookDto.book_name}" required/>
						</div>
						
						<div id=border>
							<label id="label">저자</label>
							<input id="book_textFront" class="book_writer" name="book_writer"type="text"class="form-control" value="${bookDto.book_writer}" required/>

							<label id="label">도서분류</label>
							<input id="book_textback"class="book_category"  name="book_category"type="text"class="form-control" value="${bookDto.book_category}" required/>
						</div>
						
						<div id=border>
							<label id="label">출판사</label>
							<input id="book_textFront" class="book_publisher" name="book_publisher"type="text"class="form-control" value="${bookDto.book_publisher}" required/>

							<label id="label">출판일</label>
								<fmt:parseDate value='${bookDto.book_publish_date}' var='book_publish_date' pattern='yyyy-MM-dd HH:mm:ss'/>
								<fmt:formatDate var='aa' value='${book_publish_date}' pattern='yyyy-MM-dd'/>
							<input id="book_textback" class="book_publish_date" name="book_publish_date" type="date"class="form-control" value="${aa}" required/>
						</div>

						<div id=border>
							<label id="label">도서원가</label>
							<input id="book_textFront" class="book_cost"name="book_cost"type="text"class="form-control" value="${bookDto.book_cost}" oninput="priceChk()" required/>

							<label id="label">도서가격</label>
							<input id="book_textback" class="book_price" name="book_price"type="text"class="form-control" value="${bookDto.book_price}" oninput="priceChk()" required/>
						</div>
						
						<div id=border>
							<label id="label">이미지1</label>
							<input id="book_textFront" name="book_img_url"type="text"class="form-control" value="${bookDto.book_img_url}" />

							<label id="label">이미지2</label>
							<input id="book_textback" name="book_imgxl_url"type="text"class="form-control" value="${bookDto.book_imgxl_url}" />
						</div>
						
						<div id=border1 style="margin:0px auto; width: 550px;">
							<label id="label1">목차</label><br/>
				        	<textarea id="message1" name="book_index" style="width: 550px;">${bookDto.book_index}</textarea>
						</div>
						
						<div id=border1 style="margin:0px auto; width: 550px;">
							<label id="label1">책소개</label>
				        	<textarea id="message2" name="book_intro" style="width: 550px;">${bookDto.book_intro}</textarea>
						</div>
						
						<div id=border style="margin: 0px auto; width: 182px;" >
							<button type="submit" class="btn btn-primary btn-success" id="searchBtn" style="width: 89px;">수정하기</button> 
							<a href="${root}/admin/AdminBook.do?pageNumber=${pageNumber}"class="btn btn-primary btn-success" style="width: 89px;"id="BtnBack">목록보기</a> 
						</div>
					</div>
				</form>
			</div>
			

		</div>
		
		<!-- Optional JavaScript -->
	    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
   <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>		
	</div>
</body>
</html>