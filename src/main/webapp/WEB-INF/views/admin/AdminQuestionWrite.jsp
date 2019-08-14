<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>


<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<meta charset="UTF-8">



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
				<form action="${root}/admin/AdminQuestionWriteOk.do" method="post">
					<div class="table table-responsive">
						<table class="table table-striped">
							<tr>
								<td>작성자</td>
								<td><input type="text"  class="form-control" name="a_member_id" value="관리자" readonly="readonly"></td>
							</tr>
							<tr>
								<td>글번호</td>
								<td><input type="text"  class="form-control" name="q_number" value="${questionDto.q_number}" readonly="readonly"></td>
							</tr>
							<tr>   
								<td>제목</td>
								<td><input type="text"  class="form-control" name="a_title" value="   ㄴ[답글]:${questionDto.q_title}"></td>
							</tr>
							<tr>
								<td>글내용</td>
								<td>
									<textarea rows="20" cols="50" name="a_content" class="form-control" >${questionDto.member_id}님이 작성해주신 내용입니다.

${questionDto.q_content}
/----------------------------------------------------------------------------------------------------/


</textarea>
								</td>
							</tr>
							<tr>  
								<td colspan="2"  class="text-center">

									<input type="hidden" name="count" value="${count}"/>
									<input type="hidden" name="boardSize" value="${boardSize}"/>
									<input type="hidden" name="pageNumber" value="${currentPage}"/>

									<input type="submit" value="답변완료" class="btn btn-success">
									<input type="reset" value="취소" class="btn btn-warning" >
									<input type="button"  class="btn btn-primary" onclick="location.href='${root}/admin/AdminQuestionList.do?pageNumber=${pageNumber}'" value="목록보기"/>
								</td>
							</tr>
						</table>
					</div>
				</form>   
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