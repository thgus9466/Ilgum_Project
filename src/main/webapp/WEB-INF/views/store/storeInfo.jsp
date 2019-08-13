<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="${root}/resources/jquery/jquery.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e45264b7bc6f399f4c3219ce3130972"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/store/storeInfo.css">

<script type="text/javascript">
	$(function(){
		$("#g").click(function(){
			if($(this).text() != '서울점'){
			$(this).text("서울점");
			
			$("#s").text("읽움 광주점");
			
			$("#lat").val("35.182495");
			
			$("#lng").val("126.906997");
			
			$.getScript("${root}/resources/javascript/map.js");
			}else{
				$(this).text("광주점");
				
				$("#s").text("읽움 서울점");
				
				$("#lat").val("33.450701");
				
				$("#lng").val("126.570667");
				
				$.getScript("${root}/resources/javascript/map.js");
			};
		});
		
		$("#b").click(function(){
			if($(this).text() != '서울점'){
			$(this).text("서울점");
			
			$("#s").text("읽움 부천점");
			
			$("#lat").val("37.484305");
			
			$("#lng").val("126.782725");
			
			$.getScript("${root}/resources/javascript/map.js");
			}else{
				$(this).text("부천점");
				
				$("#s").text("읽움 서울점");
				
				$("#lat").val("33.450701");
				
				$("#lng").val("126.570667");
				
				$.getScript("${root}/resources/javascript/map.js");
			};
		});
		
		$("#i").click(function(){
			if($(this).text() != '서울점'){
			$(this).text("서울점");
			
			$("#s").text("읽움 인천점");
			
			$("#lat").val("37.476202");
			
			$("#lng").val("126.616812");
			
			$.getScript("${root}/resources/javascript/map.js");
		}else{
			$(this).text("인천점");
			
			$("#s").text("읽움 서울점");
			
			$("#lat").val("33.450701");
			
			$("#lng").val("126.570667");
			
			$.getScript("${root}/resources/javascript/map.js");
		};
		});
		
		$("#u").click(function(){
			if($(this).text() != '서울점'){
			$(this).text("서울점");
			
			$("#s").text("읽움 의정부점");
			
			$("#lat").val("37.738780");
			
			$("#lng").val("127.045888");
			
			$.getScript("${root}/resources/javascript/map.js");
		}else{
			$(this).text("의정부점");
			
			$("#s").text("읽움 서울점");
			
			$("#lat").val("33.450701");
			
			$("#lng").val("126.570667");
			
			$.getScript("${root}/resources/javascript/map.js");
		};
		});
	});
</script>

</head>
<body> <!-- 913bf000ec4c52365ffe6d0ac8fba9f8 -->
	<div class="view">
			<div>
				<div  class="topname">｜ 지점안내</div>
			</div>
			
			<div>
				<div class="store">
					<ul>
						<li id="s">읽움 서울점</li>
						<li id="g">광주점</li>
						<li id="b">부천점</li>
						<li id="i">인천점</li>
						<li id="u">의정부점</li>
					</ul>
				</div>
				
				<div class="storeInfo">
					<div>
						찾아오시는 길
					</div>
					<div class="map" id="roadmap">
					<input type="hidden" id="lat" value="33.450701">
					<input type="hidden" id="lng" value="126.570667">
			
			<script>
			var container = document.getElementById('roadmap');
			var lat = document.getElementById('lat').value;
			var lng = document.getElementById('lng').value;
			var options = {
				center: new kakao.maps.LatLng(lat, lng),
				level: 3
			};

			var map = new kakao.maps.Map(container, options);
			</script>
			 
					</div>
				</div>
			</div>
	</div>
</body>
</html>