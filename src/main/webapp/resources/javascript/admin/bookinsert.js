function booktCheck(obj) {



	//cost_check
	if ($('.book_cost').css("color") == 'rgb(255, 0, 0)'
			|| $('.book_price').css("color") == 'rgb(255, 0, 0)') {
		alert("가격을 확인해주세요");
		return false;
	}

	
	if ($('.book_isbn').css("color") == 'rgb(255, 0, 0)') {
	alert("ISBN을 확인해주세요");
	return false;
	}
}

function isbncheck(root) {
	var re = /^[0-9]{1,13}$/ // 아이디가 적합한지 검사할 정규식
	var book_isbn = $(".book_isbn").val();

	$.ajax({
		async : true,
		type : 'get',
		data : {
			book_isbn : book_isbn
		},
		url : root+"/admin/isbnCheck.do",
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			if (re.test(book_isbn)) {
				if (data > 0) {
					$('.book_isbn').css("color", "red");
				} else {
					$('.book_isbn').css("color", "blue");
				}

			} else {
				$('#idResult').css("color", "red");
				$('#idResult').text("아이디는 공백없는 6~20자의 숫자조합 입니다.");
				$('#idResult').focus();
			}
		},
//		error : function(error) {
//			alert("error : " + error);
//		}
	});
}

function priceChk() {
	var re = /^[0-9]{3,10}$/ // 패스워드가 적합한지 검사할 정규식

	if (re.test($('input[name=book_cost]').val())) {
		$('input[name=book_cost]').css("color", "blue");

	} else {
		$('input[name=book_cost]').css("color", "red");
	}

	if (re.test($('input[name=book_price]').val())) {
		$('input[name=book_price]').css("color", "blue");

	} else {
		$('input[name=book_price]').css("color", "red");
	}


}


