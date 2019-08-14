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
	<c:if test="${check>0}">
		<script type="text/javascript">
			alert("회원가입이 되었습니다.가입한 아이디로 로그인 가능합니다.");
			location.href="${root}/member/memberLogin.do";
		</script>
	</c:if>
	
	<c:if test="${check==0}">
		<script type="text/javascript">
			alert("회원가입이 되지 않았습니다.");
			location.href="${root}/member/memberJoin.do";
		</script>
	</c:if>
</body>
</html>