<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>


<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${root}/resources/css/admin/adminRead.css">
<link rel="stylesheet" type = "text/css" href="${root}/resources/css/admin/adminMemberRead.css">
<script type="text/javascript" src="${root}/resources/javascript/admin/AdminMemberRead.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script> 
<script type="text/javascript">
	$(function() {
		$("#member_zipcode").val("${userOrderDto.order_zipcode}");
		$("#order_book_user_address1").val("${userOrderDto.order_book_user_address1}");
		$("#order_book_user_address2").val("${userOrderDto.order_book_user_address2}");
	});
</script>
<title>관리자시스템</title>
</head>
<body>
	<div class="header"></div>
	<div class="main">
		<div class="board_div">
			<form name="userOrderUpdate"  action="${root}/admin/AdminUserOrderUpdateOk.do?pageNumber=${pageNumber}" method="post" onsubmit="return UserOrder(this)">
				<h2 class="page-header">회원주문정보보기</h2>
				
				<div class="search_div">
					<input type="hidden" name="count" value="${count}"/>
					<input type="hidden" name="boardSize" value="${boardSize}"/>
					<input type="hidden" name="currentPage" value="${currentPage}"/>
				</div>
				
				<div class="vital_info">
					<div class="header">
						<span>주문자 정보</span>
					</div>
					<div class="infos">
						<div class = "infos_sub">
							<span style="color: red; width: 20%; margin: 0px;">*</span>
							<span>아이디</span>
						</div>
						<div  class="infos_detail">
							<input class="infos_input" type="text" name="member_id" value="${userOrderDto.member_id}" readOnly>
						</div>									
					</div>
					
					<div class="infos">
						<div class = "infos_sub">
							<span style="color: red; width: 20%; margin: 0px;">*</span>
							<span>주문번호</span>
						</div>
						<div  class="infos_detail">
							<input class="infos_input" type="text" name="order_bunho" value="${userOrderDto.order_bunho}" readOnly>
						</div>
					</div>
					
					<div class="infos">
						<div class = "infos_sub">
							<span style="color: red; width: 20%; margin: 0px;">*</span>
							<span>이름</span>
						</div>
						<div class="infos_detail">
							<input class="infos_input" type="text" name="member_name" value="${memberDto.member_name}" readOnly><!-- MemberDto -->
						</div>
					</div>			
				</div>
					
				<div class="vital_info_deliver">
					<div class="header">
						<span>배송 정보</span>
					</div>
					<div style="height: 110px;" class="infos">
						<div class = "infos_sub">
							<span style="color: red; width: 20%; margin: 0px;">*</span>
							<span>주소</span>
						</div>
						<div  class="infos_detail">
							<input style="width: 100px; float: left;" class = "infos_input" type="text" name="order_zipcode" id="member_zipcode" readOnly/>
							<div style="float:left;">
								<input class = "infos_button" type="button" value="우편번호 찾기" id="zipcodeBtn" name= "order_zipcode" value="${UserOrderDto.order_zipcode}" onclick="execPostCode()">
							</div>
							<div>
								<input style="width:400px;" class = "infos_input" type="text" name="order_book_user_address1" id="order_book_user_address1" value="${UserOrderDto.order_book_user_address1}" readOnly/>
							</div>
							<div>
								<input type="text" name="order_book_user_address2" id="order_book_user_address2" value="${UserOrderDto.order_book_user_address2}"/>
							</div>
						</div>									
					</div>
					
					<div class="infos">
						<div class = "infos_sub">
							<span style="color: red; width: 20%; margin: 0px;">*</span>
							<span>휴대폰 번호</span>
						</div>
						<div>
							<input name="order_book_user_phone" value="${userOrderDto.order_book_user_phone}">
						</div>
					</div>
				</div>
				
				<div class="choice_info" style="height: 300px;">
					<div style="text-align: center" class="header">
						<span style="display:block; margin: 0px auto; height:35px; line-height: 35px">도서주문정보</span>
					</div>
					<div id="option">
						<div class="infos">
							<div class = "infos_sub">
								<span style="color: red; width: 20%; margin: 0px;"></span>
								<span style="padding-left:17px">도서명</span>
							</div>
							<div>
								<span>${bookDto.book_name}</span>
							</div>							
						</div>
						
						<div class="infos" style="height:50px;">
							<div class = "infos_sub" style="height:50px;">
								<span style="color: red; width: 20%; margin: 0px;"></span>
								<span style="padding-left: 17px; margin-bottom: 20px;">수량</span><br/>
							</div>
							<div>
								<input type="number" min="0" max="100" name="order_book_count"value="${userOrderDto.order_book_count}">권
							</div>
						</div>
						<div class="infos" style="height:50px;">
							<div class = "infos_sub" style="height:50px;">
								<span style="color: red; width: 20%; margin: 0px;"></span>
								<span style="padding-left: 17px; margin-bottom: 20px;">도서번호</span><br/>
							</div>
							<div>
						<input class="infos_input" type="text" name="book_isbn" value="${userOrderDto.book_isbn}" readOnly>
							</div>
						</div>
					</div>
						
					<div class = "buttons" id="buttons">
						<div class = "button1" style="margin: 0px auto; text-align: center;">
							<input type="submit" class="btn btn-primary btn-success" value="수정">
							<input type="button" class="btn btn-primary btn-success" value="삭제" onclick="DelFun('${root}','${userOrderDto.order_bunho}')">
							<input type="button" class="btn btn-primary btn-success" value="목록보기" onclick="location.href='${root}/admin/AdminUserOrderList.do?pageNumber=${pageNumber}'">
						</div>
					</div>
				</div>
			</form>
		</div>
			
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
	</div>
		
		

</body>	
</html>