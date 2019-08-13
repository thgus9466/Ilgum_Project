<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<title>Insert title here</title>
<script type="text/javascript" src="${root}/resources/jquery/jquery.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/member/idSearch.css"/>
<script type="text/javascript">
$(function(){
	var talk = "${talk}";
	if(talk != ""){
		alert("아이디가 없습니다.");
	}
});
</script>
</head>
<body>
<section>
		<div class="inner">
			<div class="top2"><h2>회원 정보 찾기</h2></div>
			<div class="login">
				<ul>
					<li><a href="#" id="member">비밀번호 찾기</a></li>
				</ul>
				<div class="left">
					<div>
						<form action="${root}/member/passwordSearchOk.do" method="post">
							<div class="left_inner">
								<div class="id"><input type="text" name="member_name" placeholder="이름"/></div>
								<div class="pwd"><input type="text" name="member_id"  placeholder="아이디"/></div>
								<div class="pwd"><input type="text" name="member_email"  placeholder="이메일"/></div>
								<div class="idsave">
									<span>
										<input type="submit" value="확인" class="next">
									</span>
								</div>
								
							</div>
						</form>
					
					</div>
				</div>

			</div>
		</div>
	</section>
</body>
</html>