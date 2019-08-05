<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>고객상담</title>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/myPage/question.css">
</head>
<body>
	<div class="container">
	<jsp:include page="../template/myMenu.jsp"/>
		<div class="question">
			<div class="ttitle">1:1 상담내역</div>
			<div style="color: green;">
			언제나 고객님만을 최우선으로 생각하는 저희 고객센터에서는 고객님의 불편사항이나 문의사항을 최대한 빠르고 정확하게 처리하기 위해 노력하고 있습니다.
			</div>
			
		<div align="center" class="consult">
	      <table>
	         <tr>
	            <td width="690px" align="right" bgcolor="76CE53">
	               <a href="${root}/myPage/write.do">글쓰기</a>
	            </td>
	         </tr>
	      </table>
	      
	      <table class="thead">
		  	<tbody>
		         <tr>
		            <td align="center"width="170">요청 일자</td>
		            <td align="center"width="300">제목</td>
		            <td align="center"width="150">상담분야</td>
		            <td align="center"width="70">처리상태</td>
		         </tr>
	         </tbody>
	     </table>
   		</div>
   
		</div>
	</div>
</body>
</html>