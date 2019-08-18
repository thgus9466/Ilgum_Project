/**
 * 
 */
var number = 0;
var root = null;
var check = false;

function updateToServer(root1,currentPage,bunho,id,book,login){
	number = bunho; //
	root = root1; //root
	
	if(login==""){
		alert("로그인해주세요");
	}else if(login != id){
		alert("권한이 없습니다.");
	}else{
		var replyDiv = document.getElementById(bunho);	
		replyDiv.style.display="none";
		replyDiv.id= number;
		
		var book_reply = document.createElement("div");
		book_reply.className="book_reply";
		book_reply.style.display="block";
		book_reply.id="update";
		replyDiv.parentNode.insertBefore(book_reply, replyDiv);
		
		
		//<div class="review" id="review" style="display:none;">
		var newDiv = document.createElement("div");
		newDiv.className="review";
		newDiv.style.display="block";
		book_reply.appendChild(newDiv);
		//<form action="${root}/member/writeOk.do" method="post">
		
		var form = document.createElement("form");
		form.action=root+"/member/upDate.do";
		form.method="post";
		newDiv.appendChild(form);
		
		//<input type="hidden" value="${bookDto.book_isbn}" name="book_num"/>
		
		var input = document.createElement("input");
		input.type="hidden";
		input.value= book;
		input.name="book_num";
		form.appendChild(input);
		
		var input10 = document.createElement("input");
		input10.type="hidden";
		input10.value= number;
		input10.name="order_bunho";
		form.appendChild(input10);
		
		//<div class="reviewTop">
		
		var reviewTop = document.createElement("div");
		reviewTop.className="reviewTop";
		form.appendChild(reviewTop);
		
		
		//<span style="font-size:15px; margin-left: 30px;">아이디 : </span>
		
		var span1 = document.createElement("span");
		span1.style.fontSize="15px";
		span1.style.marginLeft="30px";
		span1.innerHTML="아이디 : ";
		reviewTop.appendChild(span1);
		
		//<span><input type="text" value="${login}" readonly="readonly" name="member_id" style="text-align:center; width:150px; height:20px; font-size:15px;"/></span>
		
		var span2 = document.createElement("span");
		reviewTop.appendChild(span2);
		
		var input1 = document.createElement("input");
		input1.type="text";
		input1.value = login;
		input1.readonly = "readonly";
		input1.name = "member_id";
		input1.style.textAlign = "center";
		input1.style.width = "150px";
		input1.style.height = "20px";
		input1.style.fontSize = "15px";
		span2.appendChild(input1);
		
//		<span style="margin-left: 20px;">
//		<label><input type="radio" name="userbookstar_star" value="1"/>★</label>
//		<label><input type="radio" name="userbookstar_star" value="2"/>★★</label>
//		<label><input type="radio" name="userbookstar_star" value="3"/>★★★</label>
//		<label><input type="radio" name="userbookstar_star" value="4"/>★★★★</label>
//		<label><input type="radio" name="userbookstar_star" value="5"/>★★★★★</label>
//		</span>
		
		var span3 = document.createElement("span");
		span3.style.marginLeft="20px";
		reviewTop.appendChild(span3);
		
		var label1 = document.createElement("label");
		label1.innerHTML = "★";
		span3.appendChild(label1);
		
		var input2 = document.createElement("input");
		input2.type="radio";
		input2.name="userbookstar_star";
		input2.value="1";
		label1.appendChild(input2);
		
		var label2 = document.createElement("label");
		label2.innerHTML = "★★";
		span3.appendChild(label2);
		
		var input3 = document.createElement("input");
		input3.type="radio";
		input3.name="userbookstar_star";
		input3.value="2";
		label2.appendChild(input3);
		
		var label3 = document.createElement("label");
		label3.innerHTML = "★★★";
		span3.appendChild(label3);
		
		var input4 = document.createElement("input");
		input4.type="radio";
		input4.name="userbookstar_star";
		input4.value="3";
		label3.appendChild(input4);
		
		var label4 = document.createElement("label");
		label4.innerHTML = "★★★★";
		span3.appendChild(label4);
		
		var input5 = document.createElement("input");
		input5.type="radio";
		input5.name="userbookstar_star";
		input5.value="4";
		label4.appendChild(input5);
		
		var label5 = document.createElement("label");
		label5.innerHTML = "★★★★★";
		span3.appendChild(label5);
		
		var input6 = document.createElement("input");
		input6.type="radio";
		input6.name="userbookstar_star";
		input6.value="5";
		label5.appendChild(input6);
		
//		<div class="reviewBottom">
//		<textarea name="book_review" style="font-size:15px; margin-left: 30px; width:90%; height:95%;"></textarea>
//	</div>
	
		var reviewBottom = document.createElement("div");
		reviewBottom.className="reviewBottom";
		form.appendChild(reviewBottom);
		
		var textarea = document.createElement("textarea");
		textarea.name="book_review";
		textarea.style.fontSize="15px";
		textarea.style.marginLeft="30px";
		textarea.style.width="90%";
		textarea.style.height="95%";
		reviewBottom.appendChild(textarea);
		
//		<div class="reviewButton">
//		<span><input type="reset" value="취소" style=" float: right; margin-right:20px;"/></span>
//		<span><input type="submit" value="확인" style=" float: right; margin-right:30px;"/></span>
//	</div>	
//		
		var reviewButton = document.createElement("div");
		reviewButton.className="reviewButton";
		form.appendChild(reviewButton);
		
		var span4 = document.createElement("span");
		reviewButton.appendChild(span4);
		
		var input7 = document.createElement("input");
		input7.type="button";
		input7.onclick = function reset(){
			
			
			var replyDiv2 = document.getElementById(number);
			var bookReply2 = document.getElementById("update");	
			replyDiv2.parentNode.removeChild(bookReply2);
			
			//var replyDiv2 = document.getElementById(number);	
			replyDiv2.style.display="block";
			
			
			
		};
		input7.value="취소";
		input7.style.float="right";
		input7.style.marginRight="20px";
		span4.appendChild(input7);
		
		var span5 = document.createElement("span");
		reviewButton.appendChild(span5);
		
		var input8 = document.createElement("input");
		input8.type="submit";
		input8.value="완료";
		input8.style.float="right";
		input8.style.marginRight="30px";
		span5.appendChild(input8);
		
		
//		var text = replyDiv.getElementsByTagName("textarea")[0];
//		var textContent = text.value;
//		alert(textContent);
//		text.removeAttribute("readonly");
//		
//		var button = replyDiv.getElementsByClassName("reviewButton")[0];
//		button.remove();
//		
//		var newButton = document.createElement("BUTTON");
//		newButton.innerHTML = "완료"; 
//		newButton.type="submit"
//		
//		var newButton2 = document.createElement("BUTTON");
//		newButton2.innerHTML = "취소";   
//		newButton2.id="cancel";
//		newButton2.onClick="myFunction('root')";
//		
//		var newDiv = document.createElement("div");
//		newDiv.appendChild(newButton);
//		newDiv.appendChild(newButton2);
//		
//		replyDiv.appendChild(newDiv);
//		
	}

}

function reset(bunho){
	
	var replyDiv = document.getElementById(bunho);	
	replyDiv.style.display="block";
	
	var bookReply = document.getElementById("update");	
	replyDiv.style.display="none";
	
}

function cancel(num){
	var replyDiv = document.getElementById(number); //번호로 수정할 div가져오기
	var spanNode = replyDiv.getElementsByTagName("span");
	if(check==true){
		var llistAllDay = document.getElementById("listAllDiv");
		var newDiv2 = document.getElementById("newDiv");
		llistAllDay.removeChild(newDiv2);
		spanNode[2].style.visibility="visible";
		check=false;
	}
}

function upDate(num){
	var newTest = document.getElementById("text").value;
	if(newTest==""){
		alert("수정내용을 적지 않았습니다");
		return false;
		//newTest = "아무것도 적지 않았어요";
	}
	var url = root+"/reply/replyUpdate.do";
	var params = "bunho="+num+"&lineReply="+newTest;
	//alert(url + params);
	
	sendRequest("GET", url, fromServer, params);
}

function fromServer(){
	if(xhr.readyState==4 && xhr.status==200){
		//alert(xhr.responseText);
		var result = xhr.responseText.split(",");
		var bunho = result[0].trim();
		var lineReply = result[1].trim();
		//alert(lineReply);
		
	var listAllDiv = document.getElementById("listAllDiv"); //전체div
	var newDiv = document.getElementById("newDiv"); //수정창div
	listAllDiv.removeChild(newDiv); //수정창없애기
	
	var replyDiv2 = document.getElementById(bunho); //수정div찾기
	var divNode = replyDiv2.getElementsByTagName("span"); //수정div의 span 찾기
	
	divNode[2].style.visibility="visible"; //삭제,수정 버튼 보이게
	divNode[1].firstChild.nodeValue = lineReply; //변경내용출력
	check=false;
	}
	
}