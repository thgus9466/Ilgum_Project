/**
 * 
 */

function checkThings() {
	if ($("#td_checkAll").is(':checked')) {
		$("input[name=checkRow]").prop("checked", true);

	} else {
		$("input[name=checkRow]").prop("checked", false);
	}
}

function checkSum(book_isbn, price, cart_quantity, point) {
	if ($("input:checkbox[id=" + book_isbn + "]").is(":checked")) {
		var priceTotal = parseInt($("#priceTotal").text()) + parseInt(price)
				+ "원";
		var quantityTotal = parseInt($("#quantityTotal").text())
				+ parseInt(cart_quantity) + "권";
		var pointTotal = parseInt($("#pointTotal").text()) + parseInt(point)
				+ "원";

		$("#priceTotal").text(priceTotal);
		$("#quantityTotal").text(quantityTotal);
		$("#delivery").text(delivery);
		$("#pointTotal").text(pointTotal);

	} else {
		var priceTotal = parseInt($("#priceTotal").text()) - parseInt(price)
				+ "원";
		var quantityTotal = parseInt($("#quantityTotal").text())
				- parseInt(cart_quantity) + "권";
		var delivery;
		var pointTotal = parseInt($("#pointTotal").text()) - parseInt(point)
				+ "원";

		$("#priceTotal").text(priceTotal);
		$("#quantityTotal").text(quantityTotal);
		$("#delivery").text(delivery);
		$("#pointTotal").text(pointTotal);
	}
}

function cartDel(root) {
	var delList = "";
	var delChk = document.getElementsByName("checkRow");

	for (var i = 0; i < delChk.length; i++)
		if (delChk[i].checked)
			delList = delList + delChk[i].value + ",";

	location.href = root + "/cartDel.do?delList=" + delList;
}