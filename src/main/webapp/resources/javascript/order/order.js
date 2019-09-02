/**
 * 
 */

function nonMemberBuy(root, book_isbn, cart_quantity) {
	location.href = root + "/order/oneBookOrder.do?book_isbn=" + book_isbn
			+ "&cart_quantity=" + cart_quantity;
}

$(function() {
	$("#discount").text(addCommas($("#discount").text()));
	$("#total_price").text(addCommas($("#total_price").text()));

	$("input:text[name=point]").on(
			"focusout",
			function() {
				var after = $("#after").val();
				var discount = parseInt(after)
						+ parseInt($("input:text[name=point]").val());
				$("#discount").text(addCommas(discount) + "원");
				$("#total_price").text(
						addCommas($("#before").val()
								- parseInt(removeCommas($("#discount").text()))
								+ "원"));
				$("#tprice").val($("#before").val()
						- parseInt(removeCommas($("#discount").text())));
				$("#used_price").val(removeCommas($("input:text[name=point]").val()));
			});
});

function pointChk(member_point) {
	$("input:text[name=point]").on("focus", function() {
		var x = $(this).val();
		x = removeCommas(x);
		$(this).val(x);
	}).on("focusout", function() {
		var x = $(this).val();

		if (x && x.length > 0) {
			if (!$.isNumeric(x)) {
				x = x.replace(/[^0-9]/g, "");
			}
			x = addCommas(x);
			$(this).val(x);
		}

	}).on("keyup", function() {
		$(this).val($(this).val().replace(/[^0-9]/g, ""));

		if (parseInt($(this).val()) > parseInt(member_point))
			$(this).val(member_point);
	});

}

// 3자리 단위마다 콤마 생성
function addCommas(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// 모든 콤마 제거
function removeCommas(x) {
	if (!x || x.length == 0)
		return "";
	else
		return x.split(",").join("");
}

function selectCoupon(root) {
	var coupon = document.getElementById("coupon");
	var admin_couponNumber = coupon.options[coupon.selectedIndex].value;
	var before = document.getElementById("before").value;
	var origin = document.getElementById("origin").value;

	$.ajax({
		type : 'get',
		data : {
			admin_couponNumber : admin_couponNumber
		},
		url : root + "/order/couponRate.do?admin_couponNumber="
				+ admin_couponNumber,
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			$("#discount")
					.text(
							addCommas(parseInt(before * data)
									+ parseInt(origin))
									+ "원");
			$("#after").val(parseInt(before * data) + parseInt(origin));
			$("input:text[name=point]").val(0);
			$("#total_price").text(
					addCommas(before
							- parseInt(removeCommas($("#discount").text()))
							+ "원"));
			$("#tprice").val($("#before").val()
					- parseInt(removeCommas($("#discount").text())));
		}
	});
}

function paySubmit(root, book_isbn, cart_quantity) {
	var total_price = removeCommas($("#total_price").text().slice(0, -1));
	alert(total_price);
	location.href = root + "/order/buserOrderOk.do?book_isbn=" + book_isbn
			+ "&cart_quantity=" + cart_quantity + "&total_price=" + total_price;
}
