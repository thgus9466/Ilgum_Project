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
			alert("관심사 수정이 완료 되었습니다.");
			location.href="${root}/mypage/main.do";
		</script>
	</c:if>
	
	<c:if test="${check==0}">
		<script type="text/javascript">
			if(confirm("관심사 수정이 완료 되지 않았습니다. 계속 진행 하시겠습니까?")){
				location.href="${root}/member/interes.do";
			}else{
				location.href="${root}/mypgae/main.do";
			}			
		</script>
	</c:if>
</body>
</html>