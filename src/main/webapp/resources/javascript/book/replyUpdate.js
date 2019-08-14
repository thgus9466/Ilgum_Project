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
		var text = replyDiv.getElementsByTagName("textarea")[0];
		var textContent = text.value;
		alert(textContent);
		text.removeAttribute("readonly");
		
		var button = replyDiv.getElementsByClassName("reviewButton")[0];
		button.remove();
		
		var newButton = document.createElement("BUTTON");
		newButton.innerHTML = "완료";   
		
		var newButton2 = document.createElement("BUTTON");
		newButton2.innerHTML = "취소";   
		newButton2.id="cancel";
		
		
		var newDiv = document.createElement("div");
		newDiv.appendChild(newButton);
		newDiv.appendChild(newButton2);
		
		replyDiv.appendChild(newDiv);
		
	}

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