/**
 * 
 */
var xhr = null;
var arr = new Array();

function createXHR(){
	if(window.XMLHttpRequest){
		return new XMLHttpRequest();
	}else if(window.ActiveXObject){
		return new ActiveXObject("Microsoft.XMLHTTP");
	}
}

function sendRequest(method, url, callback, params){
					//"get", "getResponse.txt", fromServer, null
	
	var httpMethod = method.toUpperCase();
	if(httpMethod !="GET"  && httpMethod !="POST"){
		httpMethod = "GET";
	}
	
	var httpParams = (params==null || params=="")? null : params;
	var httpUrl = url;
	
	if(httpMethod =="GET" && httpParams != null){
		httpUrl+="?"+httpParams;
	}
	
	arr.push("전송방식:" + httpMethod);
	arr.push("서버파일:" + httpUrl);
	arr.push(httpParams);
	//alert(arr.join("\n"));
	
	xhr = createXHR();
	xhr.open(httpMethod,httpUrl,true);
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send(httpMethod=="POST"? httpParams:null);//post면 params가지고가고 get이면 가져가지마
	
	xhr.onreadystatechange = callback;
}