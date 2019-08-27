<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/mypage/cart.css">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/mypage/cart.js"></script>
</head>
<body>
	<div class="container">
	<jsp:include page="../template/myMenu.jsp"/>
		<div class="basket">
			<div class="ttitle">장바구니</div>
			<div align="center" class="blist">
				<form name="form" method="get">
		      	<input type="button" value="선택삭제" id="btnDel" onclick="cartDel('${root}')"/>
		      
		      	<table class="tfirst" >
		      	<thead>
		         <tr>
		         	<td align="center"width="50">
		         		<input type="checkbox" name="checkAll" id="td_checkAll" onclick="checkThings()"/>
		         	</td>
		         	<td align="center"width="170">책
		         	</td>
		            <td align="center"width="250">도서명</td>
		            <td align="center"width="110">가격</td>
		            <td align="center"width="90">수량</td>
		            <td align="center"width="150">적립금</td>
		         </tr>
		        </thead>
				</table>
				
		        <c:if test="${count==0 || cartList.size()==0}">
					<div id="result" style="margin: 50px;">
						<b>장바구니가 비어있습니다.</b>
					</div>
				</c:if>
				
				<c:if test="${count > 0}">
				<div style="height:500px; overflow:auto; margin: 10px;">
				
				<table>
		         <c:forEach var="cartDto" items="${cartList}">
		         <tr id="tcontent">
		         	<td align="center"width="30"><input type="checkbox" name="checkRow" id="${cartDto.book_isbn}" value="${cartDto.cart_num}"
		         		onclick="checkSum('${cartDto.book_isbn}', '${cartDto.book_price*cartDto.cart_quantity}', '${cartDto.cart_quantity}', '${cartDto.book_price*0.05}')"></td>
		            <td align="center"width="190">
		         		<img alt="이미지 준비중" src="${cartDto.book_img_url}" height="90">
		         	</td>
		            <td align="center"width="270" style="margin-right: 20px;">${cartDto.book_name}</td>
		            <td align="center"width="130">
		            	<fmt:formatNumber value="${cartDto.book_price*cartDto.cart_quantity}"/>원</td>
		            <td align="center"width="100">${cartDto.cart_quantity}</td>
		            <td align="center"width="150">
		            	<fmt:formatNumber value="${cartDto.book_price*0.05}" maxFractionDigits="0"/>원</td>
		         </tr>
		         </c:forEach>
		      	</table>
		      	</div>
		      	</c:if>
		      	
		      	<table class="tsecond">
		         <thead>
		         <tr>
		            <td align="center"width="250">주문상품 금액 합계</td>
		            <td align="center"width="150">주문상품 수량</td>
		            <td align="center"width="190">배송비</td>
		            <td align="center"width="190">총 예상 적립금</td>
		         </tr>
		         </thead>
		         <tbody>
		         	<tr>
		            <td align="center"width="250" id="priceTotal">0원</td>
		            <td align="center"width="150" id="quantityTotal">0권</td>
		            <td align="center"width="190" style="color: blue;">무료배송</td>
		            <td align="center"width="190" id="pointTotal">0원</td>
		         </tr>
		         </tbody>
		      	</table>
		      	<input type="button" value="구매하기" id="btnBuy"/>
		      	</form>
   			</div>
   			
   			<div style="border: 1.5px solid black; font-size:0.9em; margin-top: 50px; padding:2px;">
   			<b>일반배송상품(택배수령) 안내사항</b><br/>
			재고 여부에 따라 품절/지연될 수 있으며, 이 경우 문자로 안내드립니다.<br/><br/>
			50부 이상 대량주문시 상황에 따라 공급이 어려울 수도 있습니다.<br/><br/>
			당일배송은 서울 및 수도권 인근지역에서 10:30 까지 주문시 가능합니다. [당일배송 지역 안내]<br/><br/>
			- 택배사 사정으로 주문 당일에 배송이 되지 않을 수도 있습니다.<br/><br/>
			- 직장, 기관 등의 당일 배송은 일과시간 이후의 배송으로 수령이 어려울 수 있습니다. 가급적 자택으로 수령지를 정하여 주십시오.<br/><br/>
			- 학교수령지는 당일 배송이 불가합니다.<br/>
			외서의 경우에는 동아시아판이 배송될 수도 있습니다.<br/><br/>		 
			결제 시 쿠폰 또는 적립금을 사용하시면 예상 적립금은 변동될 수 있습니다.<br/><br/>			 
			하루에 동일 주소로 여러 건을 주문하셔도 한 장바구니에 담지 않고, 따로 주문을 하시면 각각의 배송료가 부과되오니 주의하시기 바랍니다.<br/><br/>			 
			주문하신 상품을 해외로 배송하시는 경우에는 별도의 항공료가 부과됩니다. 그리고, 반드시 영문주소로 표기해 주셔야 합니다.
   			</div>
		</div>
	</div>
</body>
</html>