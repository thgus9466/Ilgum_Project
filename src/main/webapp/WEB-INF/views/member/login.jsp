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
<script type="text/javascript" src="${root}/resources/javascript/member/login.js"></script>
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
			$("#left_inputs").css("display","none");
			$("#left_infos").css("display","block");
			
			$("#bimemberlogin").css("display","block");
		});
		
		$("#member").click(function(){
			$(this).css("color","#111111")
			.css("border-color","#111111")
			
			$("#bimember").css("color","#999")
			.css("border-color","#e5e5e5");
			
			$("#hana").css("display","block");
			$("#dul").css("display","block");
			$("#left_inputs").css("display","block");
			$("#left_infos").css("display","none");
			
			$("#bimemberlogin").css("display","none");
		});
		
		 // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var key = getCookie("key");
	    $("#userId").val(key); 
	     
	    if($("#userId").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
	            setCookie("key", $("#userId").val(), 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("key");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("#userId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            setCookie("key", $("#userId").val(), 7); // 7일 동안 쿠키 보관
	        }
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
					<div id = "left_inputs">
						<form action="${root}/member/memberLoginOk.do" method="post">
							<div class="left_inner">
								<div class="id"><input type="text" name="member_id"  id="userId"  placeholder="아이디"/></div>
								<div class="pwd"><input type="password" name="member_password"  placeholder="비밀번호"/></div>
								<div class="idsave">
									<span>
										<input type="checkbox" id= "idSaveCheck"/>
										<label>아이디저장</label>
									</span>
								</div>
								<div class="check"><button type="submit">로그인</button></div>
									<div class="find">
										<span><a href="${root}/member/passwordSearch.do">비밀번호 찾기</a></span>
										<span style="color:#cccccc;">｜</span>
										<span><a href="${root}/member/idSearch.do">아이디 찾기 </a></span>
									</div>
							</div>							
						</form>
						<div class="form_bottom">
							<span>간편 가입</span>
							<span><img src="${root}/resources/img/login/spr_sns.png"/></span>
						</div>
					</div>
					<div id="left_infos">
						<div class="hana_left" id="hana_left">
							<label>NOTICE<br/>
							<b>FOR NONMEMBER</b>
							</label>
						</div>
						<div class="dul_left" id="dul_left">
							<label>
							비회원은 주문조회만 가능하며<br/>
							주문배송완료시 지급받은 주문번호를 통해서<br/>
							배송 정보들을 확인 하시기 바랍니다.<br/>
							비밀번호는 처음에 설정한 번호 입니다. <br/>
							분실시 이메일을 통해서 조회 하시기 바랍니다.
							</label>
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
						<div class="set"><a href="${root}/member/memberJoin.do">회원가입</a></div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>