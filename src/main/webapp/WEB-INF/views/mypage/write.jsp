<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>상담 작성</title>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/mypage/write.css">
</head>
<body>
	<div class="container" style="height: 1300px;">
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

		<form class="form_style"  action="${root}/mypage/writeOk.do" 
			  method="get" onsubmit="return boardForm(this)">
			  
		<input type="hidden" name="member_id" value="${login}"/>	  
		<input type="hidden" name="q_number" value="${q_number}"/>
		<input type="hidden" name="group_number" value="${group_number}"/>
		<input type="hidden" name="sequence_number" value="${sequence_number}"/>
		<input type="hidden" name="sequence_level" value="${sequence_level}"/>
		
		<table>
	         <tr>
	            <td width="444px" align="right" bgcolor="76CE53">
	               <a href="${root}/mypage/question.do?pageNumber=${pageNumber}">글목록</a>
	            </td>
	         </tr>
	      </table>
			
		<div class="line">
			<label class="title">작성자</label>
			<span class="content">
				<input type="text" name="member_name" value='${member_name}' readonly/>
			</span>
		</div>
		
		<div class="line">
			<label class="title">제목</label>
		    <span class="content"><input type="text" size="30" name="q_title"/></span>
		</div>
		
		<div class="line">
			<label class="title">상담 분야</label>
			<span class="content">
				<select name="q_theme">
					<option value="">상담분야선택</option>
					<option value="주문확인 및 배송">주문확인 및 배송</option>
					<option value="서비스 불편사항">서비스 불편사항</option>
					<option value="배송 주소변경">배송 주소변경</option>
					<option value="주문취소">주문취소</option>
					<option value="환불처리">환불처리</option>
					<option value="기타">기타</option>
				</select>
			</span>
		</div>
		
		<div class="line" style="height:235px;">
			<label class="title" style="height:230px;">상담 내용</label>
			<span class="content" style="height:230px;">
				<textarea rows="15" cols="45" name="q_content"></textarea>
			</span>
		</div>
		
		<div class="line" style="width:451px; border-width:1px; text-align:center;">
			<input type="submit" value="글쓰기"/>
			<input type="reset" value="다시작성"/>
			<input type="button" value="목록보기" onclick="location.href='${root}/mypage/question.do?pageNumber=${pageNumber}'"/>
		</div>
	</form>
	</div>
	</div>
</body>
</html>