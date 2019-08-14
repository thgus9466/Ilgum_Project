<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 읽기</title>
<style type="text/css">
table, td {
	border: 1px solid black;
	border-collapse: collapse;
}

.read {
	width: 680px;
	margin: 100px 10px 0px 250px;
}
</style>
</head>
<body>
	<div class="container" style="height: 1300px;">
	<jsp:include page="../template/myMenu.jsp"/>
		<div align="center" class="read">
			<table>
				<tr>
					<td align="center" height="20" width="125" >글번호</td>
					<td align="center" height="20" width="125" >${questionDto.q_number}</td>
				</tr>
				
				<tr>
					<td align="center" height="20" width="125" >작성자</td>
					<td align="center" height="20" width="125" >관리자</td>
					
					<td align="center" height="20" width="125" >작성일</td>
					<td align="center" height="20" width="125" >
						<fmt:formatDate value="${questionDto.a_date}" pattern="yyyy.MM.dd"/>				
					</td>
				</tr>
				
				<tr>
					<td align="center" height="200" width="125" >글내용</td>
					<td valign="top" height="200" colspan="3">${questionDto.a_content}</td>
				</tr>
				
				<tr>
					<td align="center" height="30" colspan="4">
						<input type="button" value="내글보기" onclick="location.href='${root}/mypage/read.do?q_number=${questionDto.q_number}&pageNumber=${currentPage}"/>
						<input type="button" value="글 목록" onclick="location.href='${root}/mypage/question.do?pageNumber=${pageNumber}'"/>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>