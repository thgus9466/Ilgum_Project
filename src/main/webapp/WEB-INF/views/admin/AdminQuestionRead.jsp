<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<meta charset="UTF-8">
<script type="text/javascript" src="${root}/resources/javascript/admin/AdminQuestionReply.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script> 
<title>도서 상세내용</title>
</head>
<body style="background-color:#f5f5f5">
	<div class="header"></div>
	
	<div class="sidebar">
	<jsp:include page="AdminSidebar.jsp"></jsp:include>
	</div>
	
	<div class="main1" >
		<div class="row">
		
			<div class="col-md-2"></div>
			<div class="col-md-7">
			<h2 class="text-left">답변글 입력하기</h2><p></p>
				<div class="table table-responsive">
					<table class="table table-striped">
						<tr>
							<td>작성자</td>
							<td><input type="text"  class="form-control" value="${questionDto.member_id}" readonly="readonly"></td>
						</tr>
						<tr>
							<td>작성일</td>
							<td><input type="text"  class="form-control" value="${questionDto.q_date}"readonly="readonly"></td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input type="text"  class="form-control" value="${questionDto.q_title}"readonly="readonly"></td>
						</tr>
						<tr>
							<td>분류</td>
							<td><input type="text"  class="form-control" value="${questionDto.q_theme}" readonly="readonly"></td>
						</tr>
						 
						<tr>
							<td>글내용</td>
							<td><textarea rows="20" cols="50" name="content" class="form-control" readonly="readonly">${questionDto.q_content}</textarea></td>
						</tr>
						<tr>  
							<td colspan="2"  class="text-center">

								<input type="hidden" name="count" value="${count}"/>
								<input type="hidden" name="q_number" value="${questionDto.q_number}"/>
								<input type="hidden" name="boardSize" value="${boardSize}"/>
								<input type="hidden" name="currentPage" value="${currentPage}"/>

								<input type="button" value="답글쓰기" class="btn btn-success" onclick="reply('${questionDto.q_number}','${root}','${pageNumber}','${questionDto.member_id}')">
								<input type="button"  class="btn btn-primary" onclick="location.href='${root}/admin/AdminQuestionList.do?pageNumber=${pageNumber}'" value="목록보기"/>
							</td>
						</tr>
					</table>
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