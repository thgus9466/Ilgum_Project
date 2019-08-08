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
			<h2 class="page-header">도서  추가</h2>

				

			<!--  BookInsert -->
			<div>
				<form name="bookInsert"  action="${root}/admin/writeOk.do" method="get" onsubmit="return booktCheck(this)">
					<div id="borderMain">
						<div id=border>
							<label id="label">도서번호</label><!-- 도서번호(book_isbn) -->
							<input id="book_textFront" class="book_isbn" name="book_isbn"type="text"class="form-control" oninput="isbncheck('${root}')" placeholder="ISBN" required />

							<label id="label">도서명</label>
							<input id="book_textback" class="book_name" name="book_name"type="text"class="form-control" placeholder="도서명" required/>
						</div>
						
						<div id=border>
							<label id="label">저자</label>
							<input id="book_textFront" class="book_writer" name="book_writer"type="text"class="form-control" placeholder="저자" required/>

							<label id="label">도서분류</label>
							<input id="book_textback"class="book_category"  name="book_category"type="text"class="form-control" placeholder="도서분류" required/>
						</div>
						
						<div id=border>
							<label id="label">출판사</label>
							<input id="book_textFront" class="book_publisher" name="book_publisher"type="text"class="form-control" placeholder="출판사" required/>

							<label id="label">출판일</label>
							<input id="book_textback" class="book_publish_date" name="book_publish_date"type="date"class="form-control" placeholder="YYYY/MM/DD으로 반드시입력해주세요" required/>
						</div>

						<div id=border>
							<label id="label">도서원가</label>
							<input id="book_textFront" class="book_cost"name="book_cost"type="text"class="form-control" placeholder="원가" oninput="priceChk()" required/>

							<label id="label">도서가격</label>
							<input id="book_textback" class="book_price" name="book_price"type="text"class="form-control" placeholder="가가격" oninput="priceChk()" required/>
						</div>
						
						<div id=border>
							<label id="label">이미지1</label>
							<input id="book_textFront" name="book_img_url"type="text"class="form-control" placeholder="url" />

							<label id="label">이미지2</label>
							<input id="book_textback" name="book_imgxl_url"type="text"class="form-control" placeholder="url" />
						</div>
						
						<div id=border1 style="margin:0px auto; width: 550px;">
							<label id="label1">목차</label><br/>
				        	<textarea id="message1" name="book_index" style="width: 550px;"></textarea>
						</div>
						
						<div id=border1 style="margin:0px auto; width: 550px;">
							<label id="label1">책소개</label>
				        	<textarea id="message2" name="book_intro" style="width: 550px;"></textarea>
						</div>
						
						<div id=border style="margin: 0px auto; width: 182px;" >
							<button type="submit" class="btn btn-primary btn-success" id="searchBtn" style="width: 89px;">추가하기</button> 
							<a href="${root}/admin/AdminBook.do"class="btn btn-primary btn-success" style="width: 89px;"id="BtnBack">뒤로가기</a> 
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