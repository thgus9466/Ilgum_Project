<%@ page language="java" contentType="text/html; charset=EUC-KR"
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
	<c:if test="${talk>0}">
		<script type="text/javascript">
			alert(${member_name}+"님의 아이디는"+${member_id}+"입니다.");
			location.href="${root}/index";
		</script>
	</c:if>
	
	<c:if test="${talk==0}">
		<script type="text/javascript">
			alert("아이디가 없습니다.");
			location.href="${root}/index";			
		</script>
	</c:if>
</body>
</html>