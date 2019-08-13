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
	
</script>
</head>
<body>
<section>
		<div class="inner">
			<div class="top2"><h2>회원 정보 찾기</h2></div>
			<div class="login">
				<ul>
				</ul>
				<div class="left">
					<div>
						<form action="${root}/member/idSearchOk.do" method="post">
							<div class="left_inner">
								<div class="id"><span>${member_name} 님의 </span></div>
								<div class="pwd"><span>아이디는  <span>${member_id}</span> 입니다</span></div>
								<div class="idsave">
									<span>
										<input type="button" value="로그인" class="next">
										<input type="button" value="비밀번호 찾기" class="next" style="margin-left:15px;">
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