<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>


<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${root}/resources/css/admin/admin.css"><!-- 공통css -->
<script src="http://code.jquery.com/jquery-1.10.2.js"></script> 

<title>관리자시스템</title>
</head>
<body style="background-color:#EAEAEA;">
	<div class="header"></div>
	<div class="sidebar">
	<jsp:include page="AdminSidebar.jsp"></jsp:include>
	</div>
	<div class="main" style="width: 90%; background-color:#EAEAEA;">
		<div class="board_div">
			<h2 class="page-header">상담관리시스템</h2>
			<div class="search_div">
				<form class="form_style" method="get" action="${root}/admin/AdminQuestionList.do" >
						<input type="hidden" name="count" value="${count}"/>
					<input type="hidden" name="boardSize" value="${boardSize}"/>
					<input type="hidden" name="currentPage" value="${currentPage}"/>

					<!-- Member  Select Search구현-->													
					<div class="row"> 
						<select id="searchType" name="searchType">
							<option value="q_number">QnA번호</option>	
							<option value="member_id">아이디</option>
							<option value="q_theme">분야</option>
							<option value="q_date">날짜</option>
						</select>
						<div class="col-xs-4"> 
							<input type="text" class="form-control" id="keyword" name="keyword"/>  
						</div> 
						<input type="submit" class="btn btn-primary btn-success" name="btnSearch" id="btnSearch"  value="검색">
					</div> 
				</form>
			</div>



			<h4>total : ${count}게시글</h4><!-- 조회된  인원-->
			<c:if test="${count==0 || MeberList.size()==0}">
				<tr>
					<td colspan="7">조회된 자료가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${count > 0}">
				<div class="table-responsive">
					<table class="table table-striped"> <!-- table-hover -->
						<thead>
							<tr	>
								<th class="col-xs-1" style="text-align: center">QnA번호</th>
								<th class="col-xs-1" style="text-align: center">아이디</th>
								<th class="col-xs-1" style="text-align: center">제목</th>
								<th class="col-xs-3" style="text-align: center">분야</th>
								<th class="col-xs-2" style="text-align: center">날짜</th>
								<th class="col-xs-1" style="text-align: center">처리</th>
							</tr>
						</thead>

						<tbody>
							<c:if test="${count > 0 }">
								<c:forEach items="${QuestionList}" var="QuestionDto">
									<tr>
										<td style="text-align: center">
											<c:out value="${QuestionDto.q_number}"/>
										</td>
										<td style="text-align: center">

											<c:out value="${QuestionDto.member_id}"/>
										</td>
										<td style="text-align: center; cursor: pointer; " >
											<a style="text"href="${root}/admin/AdminQuestionRead.do?q_number=${QuestionDto.q_number}&pageNumber=${currentPage}&member_id=${QuestionDto.member_id}">
												<c:out value="${QuestionDto.q_title}"/>
											</a>
										</td>
										<td style="text-align: center">
											<c:out value="${QuestionDto.q_theme}"/>
										</td>
										<td style="text-align: center;  cursor: pointer;">
											<fmt:formatDate value="${QuestionDto.q_date}" pattern="yyyy년 MM월 dd일"/>									
										</td>
										<td style="text-align: center;">
											<c:out value="${QuestionDto.q_state}"/>
										</td>
									</tr>
									<c:if test="${QuestionDto.a_member_id =='관리자'}">
										<tr>
											<td style="text-align: center">
												<c:out value="${QuestionDto.q_number}"/>
											</td>
											<td style="text-align: center">
												<c:out value="${QuestionDto.a_member_id}"/>
											</td>
											<td style="text-align: center; cursor: pointer;">
												<a href="${root}/admin/AdminQuestionReadReply.do?q_number=${QuestionDto.q_number}&pageNumber=${currentPage}&member_id=${QuestionDto.a_member_id}">
												<c:out value="${QuestionDto.a_title}"/></a>
											</td>
											<td style="text-align: center">
												<c:out value="${QuestionDto.q_theme}"/>
											</td>
											<td style="text-align: center">
												<fmt:formatDate value="${QuestionDto.a_date}" pattern="yyyy년 MM월 dd일"/>
											</td>
											<td style="text-align: center">

											</td>
										</tr>
									</c:if>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
			</c:if>

			<div align="center">
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
					 	<a href="${root}/admin/AdminQuestionList.do?pageNumber=${startPage-pageBlock}&keyword=${keyword}&searchType=${searchType}">
					 		[이전]</a>
					 </c:if>
					 
					 <c:forEach var="i" begin="${startPage}"  end="${endPage}">
					 		<a href="${root}/admin/AdminQuestionList.do?pageNumber=${i}&keyword=${keyword}&searchType=${searchType}">[${i}]</a>
					 </c:forEach>
					 
					 <c:if test="${endPage < pageCount}">
					 	<a href="${root}/admin/AdminQuestionList.do?pageNumber=${startPage+pageBlock}&keyword=${keyword}&searchType=${searchType}">
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