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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/order/order.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/member/login.css"/>
<script type="text/javascript">
	$(function(){
		$("#bimember").click(function(){
			$(this).css("color","#111111")
			.css("border-color","#111111");
			
			$("#member").css("color","#999")
			.css("border-color","#e5e5e5");
			
			$("#hana").css("display","none");
			$("#dul").css("display","none");
			
			$("#bimemberlogin").css("display","block");
		});
		
		$("#member").click(function(){
			$(this).css("color","#111111")
			.css("border-color","#111111")
			
			$("#bimember").css("color","#999")
			.css("border-color","#e5e5e5");
			
			$("#hana").css("display","block");
			$("#dul").css("display","block");
			
			$("#bimemberlogin").css("display","none");
		});
		
	});
</script>
</head>
<body>
<section>
		<div class="inner">
			<div class="top2"><h2>LOGIN</h2></div>
			<div class="login">
				<ul>
					<li><a href="#" id="member">회원</a></li>
					<li><a href="#" id="bimember">비회원</a></li>
				</ul>
				<div class="left">
					<div>
						<form name="nonlogin" action="${root}/member/memberPay.do" method="post">
							<div class="left_inner">
								<div class="id"><input type="text" name="member_id" placeholder="아이디"/></div>
								<div class="pwd"><input type="password" name="member_password"  placeholder="비밀번호"/></div>
								<div class="idsave">
									<span>
										<input type="checkbox"/>
										<label>아이디저장</label>
									</span>
								</div>
								<div class="check"><button type="submit">로그인</button></div>
									<div class="find">
										<span><a href="#">비밀번호 찾기</a></span>
										<span style="color:#cccccc;">｜</span>
										<span><a href="#">아이디 찾기 </a></span>
									</div>
							</div>
						</form>
						<div class="form_bottom">
							<span>간편 가입</span>
							<span><img src="${root}/resources/img/login/spr_sns.png"/></span>
						</div>
					</div>
				</div>
				<div class="right">
					<div>
						<div class="hana" id="hana">
							<label>CREATE<br/>
							<b>NEW ACCOUNT</b>
							</label>
						</div>
						<div class="dul" id="dul">
							<label>
							신규가입 회원에게 제공되는 할인쿠폰,상품구매 후<br/>
							지급되는 포인트, 다양하고 특별한 구매혜택을<br/>
							읽움의 가족이 되어 직접 경험하시기 바랍니다.
							</label>
						</div>
						<form action="">
						<div id="bimemberlogin" class="bimemberlogin" style="display:none; z-index:20; border:0px solid black;">
							<div class="id"><input type="text" name="id" placeholder="주문번호"/></div>
								<div class="pwd"><input type="password" name="pwd"  placeholder="비밀번호"/></div>
								<div class="check"><button type="button">확인</button></div>
						</div>
						</form>
						<div class="set">
							<a href="${root}/member/memberJoin.do">회원가입</a>
							<a href="javascript:void(0);" onclick="nonMemberBuy('${root}', '${book_isbn}', '${book_quantity}')">비회원 구매</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>