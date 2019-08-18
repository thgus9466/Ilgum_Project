<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>상담 작성</title>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/myPage/write.css">
</head>
<body>
	<div class="container">
		<jsp:include page="../template/myMenu.jsp"/>
		
		<div class="write">
		<div class="ttitle">1:1 고객상담</div>
			<div style="color: green; font-size: 0.9em; margin-bottom: 30px;">
			주문 후 입금대기, 주문완료 상태에서는 직접 취소가 가능합니다.<br/>
			(배송조회 -> 주문번호 선택 -> 상품정보 확인 후 취소할 수 있습니다.)
			직접 취소가 불가능한 경우 고객센터로 연락해 주시기 바랍니다.
			(고객센터 근무시간 - 평일 09:00 ~ 18:00 / 점심시간 12:00 ~ 13:00)
			상품의 재고유무에 따라 주문 후 바로 출고가 되는 경우 취소가 불가능 할 수 있습니다.
			상품 출고 이후에는 반품으로 처리가 진행되며, 반송에 따른 배송비 부담이 있을 수 있습니다.
			</div>
		<form class="form_style"  action="#" 
			  method="post" onsubmit="return boardForm(this)">
		
		<table>
	         <tr>
	            <td width="444px" align="right" bgcolor="76CE53">
	               <a href="${root}/myPage/question.do">글목록</a>
	            </td>
	         </tr>
	      </table>
			
		<div class="line">
			<label class="title">작성자</label>
			<span class="content">
				<input type="text" name="writer"/>
			</span>
		</div>
		
		<div class="line">
			<label class="title">제목</label>
		    <span class="content"><input type="text" size="30" name="subject"/></span>
		</div>
		
		<div class="line">
			<label class="title">상담 분야</label>
			<span class="content">
				<select name="question">
					<option value="">상담분야선택</option>
					<option value="qdelivery">주문확인 및 배송</option>
					<option value="qservice">서비스 불편사항</option>
					<option value="qaddress">배송 주소변경</option>
					<option value="qcancel">주문취소</option>
					<option value="qrefund">환불처리</option>
					<option value="qetc">기타</option>
				</select>
			</span>
		</div>
		
		<div class="line" style="height:235px;">
			<label class="title" style="height:230px;">상담 내용</label>
			<span class="content" style="height:230px;">
				<textarea rows="15" cols="45" name="content"></textarea>
			</span>
		</div>
		
		<div class="line" style="width:451px; border-width:1px; text-align:center;">
			<input type="submit" value="글쓰기"/>
			<input type="reset" value="다시작성"/>
			<input type="button" value="목록보기" onclick="location.href='${root}/question.jsp'"/>
		</div>
	</form>
	</div>
	</div>
</body>
</html>