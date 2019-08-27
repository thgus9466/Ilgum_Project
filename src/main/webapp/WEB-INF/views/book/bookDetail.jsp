<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${root}/resources/javascript/book/bookDetail.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/book/script.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/book/replyUpdate.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/book/xhr.js"></script>
<link rel="stylesheet" href="${root}/resources/css/book/bookDetail.css"/>
<title>Insert title here</title>
<script type="text/javascript">
	var session = "${login}";
	
		if(session != ""){
			$(function(){
			$(".noreview").css("display","none");
			$("#review").css("display","block");
		});
	}
</script>
</head>
<body>
	<div class="dt_wrapper">
		<div class="dt_header"></div>

		<div class="dt_content">
			<div class="book_index">
				<ul>
					<li style="font-weight: 50;">홈 </li>
					<li> > <a href="${root}/book/category1.do?book_category=${bookDto.book_category}">${bookDto.book_category}</a></li>
				</ul>
			</div>

			<div class="book_info1">
				<div class="book_img">
					<img src="${bookDto.book_imgxl_url}" alt="">
				</div>

				<div class="dt_desc">
					<div class="book_title">
						<ul>
							<li>${bookDto.book_name}</li>
							<li style="margin-left:2px;">${bookDto.book_writer}｜</li>
							<li>${bookDto.book_publisher}｜</li>
							<li>${bookDto.book_publish_date}</li>
						</ul>
					</div>

					<div class="book_price">
						<div class="price_title">
							<ul>
								<li>정가</li>
								<li>판매가</li>
								<li>포인트 적립</li>
								<li>배송비</li>
							</ul>
						</div>

						<div class="price_info">
							<ul>
								<li><fmt:formatNumber value="${bookDto.book_cost}" maxFractionDigits="0"/>원</li>
								<li><strong><fmt:formatNumber value="${bookDto.book_price}" maxFractionDigits="0"/></strong>원</li>
								<li><fmt:formatNumber value="${bookDto.book_price*0.05}" maxFractionDigits="0"/> 포인트 [5% 적립]</li>
								<li style="color: blue;">무료배송</li>
							</ul>
						</div>
					</div>

					<div class="book_quantity">
						<span>구매수량</span>
						<span><input type="text" name="amount" value="1"size="1"></span>
						<span>+</span>
						<span>-</span>
					</div>

					<div class="book_buy_btn">
						<a href="javascript:void(0);" onclick="bookPay('${root}', '${bookDto.book_isbn}', '${login}')" style="margin-right: 10px; background: #14488d; color: white;">구매하기</a>
						<a href="" style="margin-right: 10px;background: #fff; color: #14488d; border: 1px solid #14488d;">장바구니 담기</a>
						<a href="" style="background: #F2F2F2; border: solid 1px #D9D9D9;">내 서재 담기</a>
					</div>
				</div>
			</div>

			<div class="info_bar1">
				<a href="">상품정보</a>
				<a href="">회원리뷰</a>
				<a href="">교환/반품/품절</a>
				<div></div>
			</div>

			<div class="prod_info">
				<h3>책 소개</h3>
				${bookDto.book_intro}
			</div>

			<div class="prod_contents">
				<h3>목차</h3>
				${bookDto.book_index}
			</div>

			<div class="info_bar2">
				<a href="">상품정보</a>
				<a href="">회원리뷰</a>
				<a href="">교환/반품/품절</a>
				<div></div>
			</div>

			<input type="hidden" value="${bookDto.book_isbn}" name="book_num"/>
			<c:if test="${count==0 || currentPage==1}"> 
			<div class="book_reply">
				<div class="noreview" style="display:block;">로그인을 해주세요</div>
				<div class="review" id="review" style="display:none;">
					<form action="${root}/member/writeOk.do" method="post">
					<input type="hidden" value="${bookDto.book_isbn}" name="book_num"/>
						<div class="reviewTop">
							<span style="font-size:15px; margin-left: 30px;">아이디 : </span>
							
							<span><input type="text" value="${login}" readonly="readonly" name="member_id" style="text-align:center; width:150px; height:20px; font-size:15px;"/></span>
							
							<span style="margin-left: 20px;">
								<label><input type="radio" name="userbookstar_star" value="1"/>★</label>
								<label><input type="radio" name="userbookstar_star" value="2"/>★★</label>
								<label><input type="radio" name="userbookstar_star" value="3"/>★★★</label>
								<label><input type="radio" name="userbookstar_star" value="4"/>★★★★</label>
								<label><input type="radio" name="userbookstar_star" value="5"/>★★★★★</label>
							</span>
						</div>
						
						<div class="reviewBottom">
							<textarea name="book_review" style="font-size:15px; margin-left: 30px; width:90%; height:95%;"></textarea>
						</div>	
						
						<div class="reviewButton">
							<span><input type="reset" value="취소" style=" float: right; margin-right:35px;"/></span>
							<span><input type="submit" value="확인" style=" float: right; margin-right:20px;"/></span>
						</div>	
							
					</form>
				</div>
			</div>
			</c:if>
			 
			 <br/>
	      	 <br/>
			<!-- 방명록 목록의 내용 보여주기 -->
			<c:if test="${count>0}">
				<c:forEach var="userBookStar" items="${reviewList}"> <!-- 반복문을 돌면서 저장된 데이터 값들을 뿌려줌 -->
				<div class="book_reply" id="${userBookStar.order_bunho}">
				<div class="review" id="review">
					
						<div class="reviewTop">
							<span style="font-size:15px; margin-left: 30px;">아이디 : </span>
							
							<span><input type="text" value="${userBookStar.member_id}" readonly="readonly" name="member_id" style="text-align:center; width:150px; height:20px; font-size:15px;"/></span>
							
							<span style="margin-left: 20px;">
							<c:set var="data" value="${userBookStar.userbookstar_star}" />
 
							<c:choose>
							 
							    <c:when test="${data==1}">
							  		    ★
							    </c:when>
							 
							    <c:when test="${data==2}">
							        ★★
							    </c:when>
							 
							 	 <c:when test="${data==3}">
							        	★★★
							    </c:when>
							     <c:when test="${data==4}">
							       ★★★★
							    </c:when>
							    <c:otherwise>
							        ★★★★★
							    </c:otherwise>
							 
							</c:choose>
							</span>
						</div>
						
						<div class="reviewBottom">
							<textarea name="book_review" readonly="readonly" style="font-size:15px; margin-left: 30px; width:90%; height:95%;">${userBookStar.book_review}</textarea>
						</div>	
						
						<div class="reviewButton" id="reviewButton">
							<a href="javascript:updateToServer('${root}','${currentPage}','${userBookStar.order_bunho}','${userBookStar.member_id}','${bookDto.book_isbn}','${login}')" style="font-size:18px; margin-left:30px;">수정</a>&nbsp;&nbsp;
							<a href="javascript:deleteCheck('${root}','${currentPage}','${userBookStar.order_bunho}','${userBookStar.member_id}','${bookDto.book_isbn}', '${login}')" style="font-size:18px;">삭제</a>
						</div>	
				</div>
			</div>	
			<br/>
			<br/>	
			</c:forEach>
			</c:if>
			
			
			  <br/>
	      <br/>
	      
	<!-- 페이지블록 -->
	<div align="center">
		<c:if test="${count>0}">                                  
			<fmt:parseNumber var="pageCount" value="${count/boardSize+(count%boardSize==0? 0:1)}" integerOnly="true"/>
			<!-- integerOnly="true"는 형변환(이 경우 소수가 나오지 않게 함) -->
			<c:set var="pageBlock" value="${3}"/>
				 
			<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock}" integerOnly="true"/>
			
			<c:set var="startPage" value="${rs*pageBlock+1}"/>
			
			<c:set var="endPage" value="${startPage+pageBlock-1}"/>
			<c:if test="${endPage>pageCount}">
				<c:set var="endPage" value="${pageCount}"/>
			</c:if>
			
			<c:if test="${startPage > pageBlock}">
				<a href="${root}/book/bookDetail.do?pageNumber=${startPage-pageBlock}&book_isbn=${bookDto.book_isbn}">[이전]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="${root}/book/bookDetail.do?pageNumber=${i}&book_isbn=${bookDto.book_isbn}">[${i}]</a>
			</c:forEach>
			
			<c:if test = "${endPage<pageCount}">
				<a href="${root}/book/bookDetail.do?pageNumber=${startPage+pageBlock}&book_isbn=${bookDto.book_isbn}">[다음]</a>
			</c:if>
		</c:if>
	</div>
	
		
		</div>
	</div>
</body>
</html>