<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<head>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<meta charset="UTF-8">
<title>도서관리시스템</title>
<!-- Sidebar tag -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/admin/sidebar.css"> 
<script type="text/javascript" src="${root}/resources/javascript/admin/sidebar.js"></script>
</head>
<body>

	<div id="wrapper">
		<div class="overlay"></div>
	
		<!-- Sidebar -->
		<!-- 사이드바 참고 사이트 : https://bootsnipp.com/snippets/Qb83E-->
		<nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
		<ul class="nav sidebar-nav">
			<li class="sidebar-brand"><a href="#">사이트관리시스템</a></li>
			<li><a href="${root}/admin/AdminBook.do">도서관리</a></li>
			<li><a href="${root}/admin/AdminMemberList.do">회원관리</a></li>
			<li><a href="${root}/admin/AdminQuestionList.do">상담문의관리</a></li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">주문결제관리 <span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li class="dropdown-header">주문결제관리</li>
                    <li><a href="${root}/admin/AdminUserOrderList.do">회원 주문관리</a></li>
                    <li><a href="${root}/admin/AdminBuserOrderList.do">비회원 주문관리</a></li>
                  </ul>
                </li>
			<li><a href="${root}/index.do">메인페이지</a></li>
		</ul>
		</nav>
		<!-- /#sidebar-wrapper -->
		
		<!-- Page Content -->
		 <div id="page-content-wrapper">
		 <!-- 사이드바 햄버거 버튼 -->
			<button type="button" class="hamburger is-closed" data-toggle="offcanvas">
				<span class="hamb-top"></span>
				<span class="hamb-middle"></span>
				<span class="hamb-bottom"></span>
			</button>
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2">
					</div>
				</div>
			</div>
		</div>
		<!-- /#page-content-wrapper -->
	</div>
	<!-- /#wrapper -->
</body>
</html>