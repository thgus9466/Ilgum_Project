/**
 * 
 */

function nonMemberBuy(root, book_isbn, cart_quantity) {
	location.href=root+"/order/oneBookOrder.do?book_isbn="+book_isbn+"&cart_quantity="+cart_quantity;
}

function pointChk(member_point){
	$("input:text[name=point]").on("focus", function() {
	    var x = $(this).val();
	    x = removeCommas(x);
	    $(this).val(x);
	}).on("focusout", function() {
	    var x = $(this).val();
	    if(x && x.length > 0) {
	        if(!$.isNumeric(x)) {
	            x = x.replace(/[^0-9]/g,"");
	        }
	        x = addCommas(x);
	        $(this).val(x);
	    }
	}).on("keyup", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	    
	    if(parseInt($(this).val())>parseInt(member_point))
	    	$(this).val(member_point);
	});
}

//3자리 단위마다 콤마 생성
function addCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
 
//모든 콤마 제거
function removeCommas(x) {
    if(!x || x.length == 0) return "";
    else return x.split(",").join("");
}