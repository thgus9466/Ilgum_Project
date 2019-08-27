<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>


<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<meta charset="UTF-8">
<script type="text/javascript" src="${root}/resources/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/resources/jquery/jquery-ui.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/admin/admin.css"> 
<script type="text/javascript" src="${root}/resources/javascript/member/join.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script> 

<title>관리자시스템</title>
</head>
<body>
	<div class="header"></div>
	<div class="sidebar">
	<jsp:include page="AdminSidebar.jsp"></jsp:include>
	</div>
	<div class="main" style="width: 90%;">
				<div class="board_div">
				<h2 class="page-header">도서관리시스템</h2>
				<div class="search_div">
					<form class="form_style" id="boardSearchVO" name="boardSearchVO" method="get" action="${root}/admin/AdminBook.do" >
 						<input type="hidden" name="count" value="${count}"/>
						<input type="hidden" name="boardSize" value="${boardSize}"/>
						<input type="hidden" name="currentPage" value="${currentPage}"/>

						<!-- Book Search-->													
						<div class="row"> 
							<select id="searchType" name="searchType">
								<option value="book_name">도서명</option>	
								<option value="book_isbn">분류코드</option>
								<option value="book_writer">저자</option>
								<option value="book_publisher">출판사</option>
							</select>
							<div class="col-xs-4"> 
								<input type="text" class="form-control" id="keyword" name="keyword"/>  
							</div> 
							<input type="submit" class="btn btn-primary btn-success" name="btnSearch" id="btnSearch"  value="Search">
						</div> 
					</form>
				</div>
					

				
				<h4>total : ${count}권</h4>
				<div class="full-right" style="width: 90%;">
				<a href="${root}/admin/AdminBookInsert.do"class="btn btn-primary btn-success" style="width: 89px; margin-left: 100%;"id="BtnBack">도서추가</a> 
				</div>
				<c:if test="${count==0 || bookList.size()==0}">
					<tr>
						<td colspan="7">조회된 자료가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${count > 0}">
					<div class="table-responsive">
						<table class="table table-striped"> <!-- table-hover -->
							<thead>
								<tr	>
									<th class="col-xs-1">도서번호</th>
									<th class="col-xs-3" style="text-align: center">도서명</th>
									<th class="col-xs-2" style="text-align: center">저자</th>
									<th class="col-xs-1">도서분류</th>
									<th class="col-xs-2" style="text-align: center">출판사</th>
									<th class="col-xs-1">출판일</th>
									<th class="col-xs-1" style="text-align: right">도서원가</th>
									<th class="col-xs-5" style="text-align: right">도서가격</th>
								</tr>
							</thead>
	
							<tbody>
								<c:if test="${count > 0 }">
									<c:forEach items="${bookList}" var="bookDto">
										<tr>
											<td><c:out value="${bookDto.book_isbn}"/></td>
											<td style="text-align: center">
												<a href="${root}/admin/AdminBookRead.do?book_isbn=${bookDto.book_isbn}&pageNumber=${currentPage}">
												<c:out value="${bookDto.book_name}"/></a>
											</td>
											<td style="text-align: center"><c:out value="${bookDto.book_writer}"/></td>
											<td><c:out value="${bookDto.book_category}"/></td>
											<td style="text-align: center"><c:out value="${bookDto.book_publisher}"/></td>
											<td>
												<fmt:parseDate value='${bookDto.book_publish_date}' var='book_publish_date' pattern='yyyy-MM-dd HH:mm:ss'/>
												<fmt:formatDate value="${book_publish_date}" pattern="yyyy/MM/dd"/>
											</td>
											<td style="text-align: right"><c:out value="${bookDto.book_cost}원"/></td>
											<td style="text-align: right"><c:out value="${bookDto.book_price}원"/></td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</c:if>

				<div align="center" class="list_number">
						<c:if test="${count > 0 }">
							 <fmt:parseNumber 
							 		var="pageCount" 
							 		value="${count/boardSize+(count%boardSize==0 ? 0:1)}"
							 		integerOnly="true"/>

							 <c:set var="pageBlock" value="${10}"/>
							  <fmt:parseNumber var="rs"
							  	 value="${(currentPage-1)/pageBlock}"
							  	 integerOnly="true"/>

							 <c:set var="startPage" value="${rs*pageBlock+1}"/>
							 <c:set var="endPage" value="${startPage+pageBlock-1}"/>

							 <c:if test="${endPage > pageCount}">
							 	<c:set var="endPage" value="${pageCount}"/>
							 </c:if>

							 <c:if test="${startPage > pageBlock  }" >
							 	<a href="${root}/admin/AdminBook.do?pageNumber=${startPage-pageBlock}&keyword=${keyword}&searchType=${searchType}">
							 		[이전]</a>
							 </c:if>

							 <c:forEach var="i" begin="${startPage}"  end="${endPage}">
							 		<a href="${root}/admin/AdminBook.do?pageNumber=${i}&keyword=${keyword}&searchType=${searchType}">[${i}]</a>
							 </c:forEach>

							 <c:if test="${endPage < pageCount}">
							 	<a href="${root}/admin/AdminBook.do?pageNumber=${startPage+pageBlock}&keyword=${keyword}&searchType=${searchType}">
							 		[다음]</a>
							 </c:if>
						</c:if>

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