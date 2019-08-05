<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>고객상담</title>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/mypage/interest.css">
</head>
<body>
	<div class="container">
	<jsp:include page="../template/myMenu.jsp"/>
		<div class="question">
			<div class="ttitle">관심분야</div>
			<div style="color: green;">
			회원님의 관심분야에 대한 최신 신간도서 · 베스트셀러 및 읽움의 편집자 추천도서를 제공해 드립니다.
			</div>
			
		<div class="consult">
			<div>
				<span>1차 관심분야 : </span>
				<span>소설</span>
			</div>
			
	    	<div class="table">
	    		
	    		<div>
	    			도서이름
	    		</div>
	    		
	    		<div>
	    			작가
	    		</div>
	    		
	    		<div>
	    			출판사
	    		</div>
	    		
	    		<div>
	    			가격
	    		</div>
	    		
	    		<div>
	    			내용
	    		</div>
	    
	    	</div>
   		</div>
   
		</div>
	</div>
</body>
</html>