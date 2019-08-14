<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>고객상담</title>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/mypage/question.css">
</head>
<body>
	<div class="container" style="height: 1300px;">
	<jsp:include page="../template/myMenu.jsp"/>
		<div class="question">
			<div class="ttitle">1:1 상담내역</div>
			<div style="color: green;">
			언제나 고객님만을 최우선으로 생각하는 저희 고객센터에서는 고객님의 불편사항이나 문의사항을 최대한 빠르고 정확하게 처리하기 위해 노력하고 있습니다.
			</div>
			
			<div align="center" class="consult">
		    	<table>
		         <tr>
		            <td width="690px" align="right" bgcolor="76CE53">
		               <a href="${root}/mypage/write.do?pageNumber=${currentPage}">글쓰기</a>
		            </td>
		         </tr>
		    	</table>
			
			  	<table class="thead">
			  		<tbody>
						<c:if test="${count==0 || qList.size()==0}">
							<div>상담내역이 없습니다.</div>
						</c:if>
						
						<c:if test="${count >0}">
					  		<tr>
								<td align="center" width="30">작성일</td>
								<td align="center" width="250">제목</td>
								<td align="center" width="70">상담분야</td>
								<td align="center" width="150">처리상태</td>
							</tr>
							<c:forEach var="questionDto" items="${qList}">
						    	<tr>
						            <td align="center"width="170">
						            <fmt:formatDate value="${questionDto.q_date}" pattern="yyyy.MM.dd"/></td>
						            <td align="center"width="300">
						            <a href="${root}/mypage/read.do?q_number=${questionDto.q_number}&pageNumber=${currentPage}">${questionDto.q_title}</a>
						            </td>
						            <td align="center"width="150">${questionDto.q_theme}</td>
						            <td align="center"width="70">${questionDto.q_state}</td>
						        </tr>
								<c:if test="${questionDto.a_member_id =='관리자'}">
							    	<tr>
							            <td align="center"width="170">
							            <fmt:formatDate value="${questionDto.a_date}" pattern="yyyy.MM.dd"/></td>
							            <td align="center"width="300">
							            <a href="${root}/mypage/readReply.do?q_number=${questionDto.q_number}&pageNumber=${currentPage}">${questionDto.a_title}</a>
							            </td>
							            <td align="center"width="150">${questionDto.q_theme}</td>
							            <td align="center"width="70">${questionDto.q_state}</td>
							        </tr>
									<tr>
									</tr>
							        
								</c:if>
						    </c:forEach>
				         </c:if>
			         </tbody>
			     </table>
		   	</div>
		   		
	   		<div align = "center" style="margin: 30px 0px;;">
		      <c:if test="${count > 0}">
		         <c:set var="pageBlock" value="${10}"/>
		         <fmt:parseNumber var="pageCount" value="${count/boardSize + (count%boardSize==0? 0:1)}" integerOnly="true"/>
		         
		         <fmt:parseNumber var="result" value="${(currentPage - 1) / pageBlock}" integerOnly="true"/>
		         <c:set var="startPage" value="${result * pageBlock + 1}"/>
		         <c:set var="endPage" value ="${startPage + pageBlock - 1}"/>
		
		         <c:if test="${endPage > pageCount}">
		            <c:set var="endPage" value="${pageCount}"/>
		         </c:if>
		         <c:if test="${startPage > pageBlock}">
		            <a href="${root}/mypage/question.do?pageNumber=${startPage-pageBlock}&member_id=${questionDto.member_id}">[이전]</a>
		         </c:if>
		         
		         <c:forEach var="i" begin="${startPage}" end="${endPage}">
		            <a href = "${root}/mypage/question.do?pageNumber=${i}&member_id=${questionDto.member_id}">[${i}]</a>
		         </c:forEach>
		         
		         <c:if test="${endPage < pageCount}">
		            <a href="${root}/mypage/question.do?pageNumber=${startPage+pageBlock}&member_id=${questionDto.member_id}">[다음]</a>
		         </c:if>
		      </c:if>
	   		</div>
		</div>
	</div>
</body>
</html>