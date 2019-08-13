<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/book/bestseller.css">
<script type="text/javascript">
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
    	  
//     	  var jsonData = $.ajax({
//     		  url: "/chart/book_list.do",
//     		  dataType: "json",
//     		  async: false
//     	  }).responseText;
    	  
//     	  alert(jsonData);
    	  
    	  
    	  var data = google.visualization.arrayToDataTable(${str});
		
    	 // alert("${str}");
    	  var options = {
    	          title: ' ',
    	          curveType: 'function',
    	          legend: { position: 'bottom' }
    	        };

    	        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

    	        chart.draw(data, options);
      }
    </script>
    
</head>
<body>
	<div>
		<div class="view">
			<div>
				<div  class="topname">｜ 베스트셀러</div>
				<div id="curve_chart"class="graph"> </div>
				
				<c:if test="${count>0}">
				<div class="first_level">
				<c:forEach var="bookDto" items="${bookFirstList}">
					<div class="first_level_1">
						<div class="imgB1" style="background-image:url('${bookDto.book_imgxl_url}') "><div class="Bbunho">1</div></div>
						<div class="contentB1">
							<span>${bookDto.book_name}</span> <!-- 책제목 -->
							<span>저자:${bookDto.book_writer} ｜출판사:${bookDto.book_publisher}｜${bookDto.book_publish_date}</span> <!-- 출판사/지은이/출간일 -->
							<span>판매가: ${bookDto.book_cost} → <label>${bookDto.book_price}</label></span>	<!-- 가격 -->
							<c:set var="amount" value="${bookDto.book_cost*0.05}"></c:set>
							<fmt:formatNumber value="${amount}" type="number" maxFractionDigits="0" var="number"></fmt:formatNumber>
							<span>적립금: ${number}원(5%)</span> <!-- 적립금 -->
						</div>
						<div class="buttonB1"><input type="button" class="btnB1" value="장바구니에 담기"></div>
					</div>
					</c:forEach>
				</div>
				</c:if>
		
				<c:if test="${count2>0}">
				<c:forEach var="bookDto2" items="${bookLastList}">
				<div class="last_level">
					<div class="imgB2">
						<div><input type="checkbox" name=" " style="width:20px;height:20px;"></div> <!-- 체크박스 -->
						<div>
							<div style="background-image:url('${bookDto2.book_imgxl_url}')">
							<c:set var="amount2" value="${count2}"></c:set>
								<div class="Bbunho">${amount2}</div>
							</div>
						</div> <!-- 이미지 -->
					</div>
					<div class="contentB2">
						<span>${bookDto2.book_name}</span> <!-- 책 제목 -->
						<span>${bookDto2.book_writer}｜${bookDto2.book_publisher}｜${bookDto2.book_publish_date}</span> <!-- 작가/출판사 -->
						<span>
							${bookDto2.book_intro}
						</span> <!-- 책내용 -->
					</div> <!-- 내용 -->
					<div class=buttonB2>
					<input type="button" class="btnB2" value="바로구매">
					<input type="button" class="btnB2" value="장바구니에 담기">
					</div> <!-- 장바구니 버튼 -->
					
				</div>
				</c:forEach>
			</c:if>	
			</div>
		</div>
	</div>
</body>
</html>