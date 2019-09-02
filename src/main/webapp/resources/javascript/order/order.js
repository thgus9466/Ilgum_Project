/**
 * 
 */

function nonMemberBuy(root, book_isbn, cart_quantity) {
	location.href=root+"/order/oneBookOrder.do?book_isbn="+book_isbn+"&cart_quantity="+cart_quantity;
}


function payfun(total_price){
	alert(a);
    var IMP = window.IMP; // 생략가능
    IMP.init('imp43677168'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
    IMP.request_pay({
    	pg : 'kakao', // 결제방식
        pay_method : 'card',	// 결제 수단
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : 'IlGum Books',	// order 테이블에 들어갈 주문명 혹은 주문 번호
        amount : total_price,	// 결제 금액
        buyer_email : member_email,	// 구매자 email
        buyer_name :  receiver,	// 구매자 이름
        buyer_tel :  phone1_1+"-"+phone1_2+"-"+phone1_3,	// 구매자 전화번호
        buyer_addr :  member_address1+" "+ member_address2,	// 구매자 주소
        buyer_postcode :  member_zipcode,	// 구매자 우편번호
    }, function(rsp) {	
 	if ( rsp.success ) { // 성공시
 		var msg = '결제가 완료되었습니다.';
 		msg += '고유ID : ' + rsp.imp_uid;
 		msg += '상점 거래ID : ' + rsp.merchant_uid;
 		msg += '결제 금액 : ' + rsp.paid_amount;
 		msg += '카드 승인번호 : ' + rsp.apply_num;
 	} else { // 실패시
 		var msg = '결제에 실패하였습니다.';
 		msg += '에러내용 : ' + rsp.error_msg; 
 	}
 	alert(msg);
 });
}