<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:if test="${check >0}">
		<script type="text/javascript">
			alert("리뷰 작성이 완료되었습니다");
			location.href="${root}/book/bookDetail.do?book_isbn=${book_isbn}";
		</script>
	</c:if>
	
	<c:if test="${check==0}">
		<script type="text/javascript">
			alert("리뷰가 작성 되지 않았습니다");
			location.href="${root}/book/bookDetail.do?book_isbn=${book_isbn}";
		</script>
	</c:if>
</body>
</html>