<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Bootstrap CSS -->
	
<head>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">	
<link rel="stylesheet" type="text/css" href="${root}/resources/css/adminLogin.css"> 
<link rel="stylesheet" type="text/css" href="${root}/resources/css/adminsidebar.css"> 

<style type="text/css">
    .top {
        position:absolute;
        left:0; right:0;
        height: 92px;
    }
    .left {
        position:absolute;
        left:0; top:92px; bottom: 0;
        width: 178px;
         background: ;
    }
    .main {
        position: absolute;
        left:178px; top:92px; right:0; bottom:0;
    }

.top { background: ; }

.main { background: #EFEEE5; }
</style>
</head>
<body>
		<div class="top">
		<!--TOP-->
		</div>
		
		<div class="left">
		    <input type="checkbox" id="menu_state" checked>
			<nav>
				<label for="menu_state"><i class="fa"></i></label>
				<ul>
	              <li> <a href="#" data-toggle="collapse" data-target="#admin" class="collapsed active" > <i class="fa fa-th-large"></i> <span class="nav-label"> 관리자 </span> </a>
		              <ul style="text-align: center;" class="sub-menu collapse" id="admin">
		                <li><a href="#" >정보수정</a></li>
		                <li><a href="#" >관리자 등록</a></li>
		                <li><a href="#">관리자삭제</a></li>
		                <li><a href="#">로그아웃</a></li>
		                <li><a href="#">지점관리</a></li>
		              </ul>
	             </li>

	              <li> <a href="javascript:void(0)" data-toggle="collapse" data-target="#mail" class="collapsed active" > <i class="fa fa-folder-open"></i> <span class="nav-label"> 메일 </span> </a>
		              <ul style="text-align: center; text" class="sub-menu collapse" id="mail">
		                <li><a href="#" >메일보내기 </a></li>
		                <li><a href="#">메일보관함 </a></li>
		                <li><a href="#">삭제보관함 </a></li>
		              </ul>
	             </li>

	              <li> <a href="javascript:void(0)" data-toggle="collapse" data-target="#product" class="collapsed active" > <i class="fa fa-inbox"></i> <span class="nav-label">재고관리</span> </a>
		              <ul style="text-align: center; text" class="sub-menu collapse" id="product">
		                <li><a href="#" >서적발주 </a></li>
		                <li><a href="#">지점이동 </a></li>
		              </ul>
	             </li>

	              <li> <a href="javascript:void(0)" data-toggle="collapse" data-target="#member" class="collapsed active" > <i class="fa fa-user"></i> <span class="nav-label">회원관리</span> </a>
		              <ul style="text-align: center; text" class="sub-menu collapse" id="member">
		                <li><a href="#" >회원목록 </a></li>
		              </ul>
	             </li>
				</ul>
			</nav>
		</div>


		<div class="main">
			<div class="card-title" >
				<img src="resources/img/Logo.png" style="margin-left: 20%;">
				<h2 class="card-title text-center" style="color:#113366; margin: 2% auto;">관리자 등록</h2>
			</div>

			<div class="card align-middle" style="width: 20em; border-radius:20px; margin: 0 auto;">
				<div class="card-body">
					<form class="form-signin" method="POST" onSubmit="logincall();return false">			
						
						<label for="ID" class="control-label" style="color:#40404A; font-size: 0.8em;">관리자번호</label>
						<label for="ID" class="sr-only"> ID</label>
						<input type="text" id="Admin_Id" class="form-control" placeholder="AdminNumber" required autofocus><BR/>
		
						<label for="name" class="control-label" style="color:#40404A; font-size: 0.8em;">이름</label>
						<label for="Iname" class="sr-only"> 이름</label>
						<input type="text" id="Admin_name" class="form-control" placeholder="Name" required autofocus><BR/>


						<label for="Password" class="control-label" style="color:#40404A; font-size: 0.8em;">비밀번호</label>
						<label for="Password" class="sr-only"> Password</label>
						<input type="password" id="upw" class="form-control" placeholder="Password" required><br/>	

						<label for="PasswordCheck" class="control-label" style="color:#40404A; font-size: 0.8em;">비밀번호확인</label>
						<label for="PasswordCheck" class="sr-only"> PasswordCheck</label>
						<input type="password" id="upw" class="form-control" placeholder="PasswordCheck" required><br/>	
						<select id="office" name="office">
							<option value="0">송도점</option>						 
							<option value="1">부평점</option>						
							<option value="2">상동점</option>
							<option value="3">의정부점</option>
							<option value="4">구로점</option>						
						</select>


						<div style="margin-bottom:5%; margin-top:20%">
						
						</div>
						
						<div >
							<label style="margin-bottom:3%; margin-top:3%">
								<a href="#" style`=" color:#40404A; font-size: 0.8em; ">관리자번호 찾기</a>
							</label>
						</div>

						
						<button id="btn-click" class="btn block" type="submit" style="width: 130px; margin-right: 10px;" >확인</button>
						<button id="btn-click" class="btn block" type="reset" style="width: 130px;">취소</button><br/>	
					</form>
					      
				</div>
			</div>
			        
				      

			<div class="modal">
			</div>
	
	
	
	
		    <!-- Optional JavaScript -->
		    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
		    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
		</div>
</body>
</html>