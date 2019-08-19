<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>방명록 작성</title>
</head>
<body>
	<c:if test="${check>0}">
		<script type="text/javascript">
			alert("수정이 완료 되었습니다.");
			location.href="${root}/admin/AdminBuserOrderList.do";
		</script>
	</c:if>
	
	<c:if test="${check==0}">
		<script type="text/javascript">
			alert("다시 시도해주세요.");
			Return true;
		</script>
	</c:if>
</body>
</html>