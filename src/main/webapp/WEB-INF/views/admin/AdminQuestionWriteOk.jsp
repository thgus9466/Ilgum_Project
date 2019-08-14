<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담글 추가완료</title>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	
		<c:if test="${check > 0}">
			<script>
				alert("답글등록이 완료되었습니다.");
				location.href="${root}/admin/AdminQuestionList.do";
			</script>
		</c:if>
		
		<c:if test="${check==0}">
			<script>
				alert("답글등록에 실패하였습니다.");
				location.href="${root}/admin/AdminQuestionList.do";
			</script>
		</c:if>
		
</body>
</html>