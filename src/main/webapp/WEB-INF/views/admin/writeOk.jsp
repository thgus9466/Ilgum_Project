<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서추가완료</title>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	
		<c:if test="${check > 0}">
			<script>
				alert("도서추가가 완료되었습니다.");
				location.href="${root}/admin/AdminBook.do";
			</script>
		</c:if>
		
		<c:if test="${check==0}">
<%-- 			<c:if test="${dup>0}">
				<script>
					alert("도서코드가 중복되었습니다 다시 확인해주세요.");
				</script>
			</c:if>
 --%>			<script>
				alert("도서추가에 실패하였습니다.");
				location.href="${root}/admin/AdminBook.do";
			</script>
		</c:if>
		
</body>
</html>