<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>주문결제완료</title>
</head>
<body>
	<c:if test="${check>0}">
		<script type="text/javascript">
		var IMP = window.IMP; // 생략가능
		alert("결제를 실행합니다");
		alert("${orderDto.total_price}");
		IMP.init('imp43677168'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		IMP.request_pay({
			pg : 'kakao', // 결제방식
		    pay_method : 'card',	// 결제 수단
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : 'IlGum Books',	// order 테이블에 들어갈 주문명 혹은 주문 번호
		    amount : "${orderDto.total_price}",	// 결제 금액
		    buyer_email : "",	// 구매자 email
		    buyer_name : "${orderDto.receiver}" ,	// 구매자 이름
		    buyer_tel :  "${orderDto.member_phone}",	// 구매자 전화번호
		    buyer_addr : "${orderDto.member_address1}"+"${orderDto.member_address2}",	// 구매자 주소
		    buyer_postcode : "${orderDto.member_zipcode}",	// 구매자 우편번호
		}, function(rsp) {
			if ( rsp.success ) { // 성공시
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.amount;
				msg += '결제자 : ' + rsp.buyer_name;
				msg += '결제금액 : ' + rsp.amonut;
				msg += '핸드폰번호 : ' + rsp.buyer_tel;
				msg += '집주소 : ' + '우편번호:'+ rsp.buyer_postcode + '상세주소:' + rsp.buyer_addr;
				alert(msg);
				location.href="${root}/index.do";
			} else { // 실패시
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg; 
				alert(msg);
				location.href=history.back(-1)
			}
		});
		
		</script>
	</c:if>

	<c:if test="${check==0}">
		<script type="text/javascript">
			alert("구매에 실패하셨습니다.");
			location.href=history.back(-1)
		</script>
	</c:if>
</body>
</html>