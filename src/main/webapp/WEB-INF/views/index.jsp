<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<title>읽움에 오신걸 환영합니다.</title>
<script type="text/javascript" src="${root}/resources/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/resources/jquery/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/jquery/jquery-ui.css"/>

<script type="text/javascript" src="${root}/resources/javascript/index/slide.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/book/bookDetail.js"></script>
<script type="text/javascript"src="${root}/resources/javascript/index/index.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/index/index.css"/>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/index/slide.css"/>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/index/section.css"/>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/index/footer.css"/>
<script type="text/javascript">
	$(function(){
		var talk = "${talk}";
		if(talk != ""){
			alert("임시 비밀번호가 이메일로 발송되었습니다.");
		}
		$("#tec").autocomplete({
			source : "${root}/book/autocomplete.do"
		});		
	});

	var member_id = "${member_id}";
	if(member_id != ""){
		$(function(){
			$("#logout > li:nth-child(4)").replaceWith("<li><a href='${root}/mypage/main.do'>마이페이지</a></li>");
			$("#logout > li:nth-child(5)").replaceWith("<li><a href='${root}/index.do'>로그아웃</a></li>");
		});
	};
</script>
</head>
<body>
	<div class="wrap">
		<header>
			<div class="first">
				<div class="logo">
					<a href="#"><img src="${root}/resources/img/index/logo2.png"/></a>
				</div>  <!-- 로고 -->
				<div class="search">
					<div class="searchDiv">
						<form action="${root}/book/search_list.do" method="get">
							<input class="tec" id="tec" type="text" placeholder="검색어를 입력하세요" name="book_name">
							<input type="submit" class="btn" id="btn" value="검색"> <!-- 버튼 -->
						</form>
					</div>
				</div>  <!-- 검색 -->
			</div>
				<div class="second"> <!-- 메뉴 -->
					<nav>
						<div class="nav">
							<div>
								<ul>
									<li  id="gnb" style="width:50px; margin-left:0px;"><a href="#"><img src="${root}/resources/img/index/dropdown.png"/></a></li>
									<li><a href="${root}/book/search_list.do?book_name=">도서</a></li>
									<li><a href="${root}/book/bestSeller.do">베스트셀러</a></li> <!-- 구매순  -->
									<li><a href="${root}/book/newBook.do">신간도서</a></li> <!-- 날짜순 -->
									<li><a href="${root}/book/monthBook.do">이달의도서</a></li> <!-- 평점&리뷰순 -->
								</ul>
							</div>
							<div>
								<ul id="logout">
									<li><a href="${root}/cartList.do">장바구니</a></li>
									<li><a href="${root}/member/storeInfo.do">지점안내</a></li>
									<li><a href="#">고객센터</a></li>
									<li><a href="${root}/member/memberJoin.do">회원가입</a></li>
									<li><a href="${root}/member/memberLogin.do">로그인</a></li>
								</ul>
							</div>
						</div>
					</nav>
					<div id="snb" class="snb">
						<div class="snb_s">
							<div style="margin-left: 30px;">
								<span><a href="${root}/book/category1.do?book_category=소설/시/희곡">소설/시/희곡</a></span>
								<span><a href="${root}/book/category1.do?book_category=경제 경영">경제경영</a></span>
								<span><a href="${root}/book/category1.do?book_category=자기계발">자기계발</a></span>
							</div>
							<div>
								<span><a href="${root}/book/category1.do?book_category=인물">인물</a></span>
								<span><a href="${root}/book/category1.do?book_category=인문">인문</a></span>
								<span><a href="${root}/book/category1.do?book_category=국어 외국어 사전">국어/외국어/사전</a></span>
							</div>
							<div>
								<span><a href="${root}/book/category1.do?book_category=역사">역사</a></span>
								<span><a href="${root}/book/category1.do?book_category=사회 정치">사회/정치</a></span>
								<span><a href="${root}/book/category1.do?book_category=가정 살림">가정살림</a></span>
							</div>
							<div>
								<span><a href="${root}/book/category1.do?book_category=건강 취미">건강/취미</a></span>
								<span><a href="${root}/book/category1.do?book_category=여행">여행</a></span>
								<span><a href="${root}/book/category1.do?book_category=종교">종교</a></span>
							</div>
							<div>
								<span><a href="${root}/book/category1.do?book_category=유아">유아</a></span>
								<span><a href="${root}/book/category1.do?book_category=어린이">어린이</a></span>
								<span><a href="${root}/book/category1.do?book_category=청소년">청소년</a></span>
							</div>
							<div>
								<span><a href="${root}/book/category1.do?book_category=자연과학">자연과학</a></span>
								<span><a href="${root}/book/category1.do?book_category=IT 모바일">IT모바일</a></span>
								<span><a href="${root}/book/category1.do?book_category=정치">잡지</a></span>
							</div>
						</div>
					</div>
				</div>
		</header>
		<section>
			<div class="slide">
				<div id="slide">
  <ul class="panel">
    <li><div style="width:950px; height:325px; margin:0px auto;"><img src="${root}/resources/img/index/slider1.png" style="width:950px; height:325px;"></div></li>
    <li><div style="width:950px; height:325px; margin:0px auto;"><img src="${root}/resources/img/index/slider.png" style="width:950px; height:325px;"></div></li>
    <li><div style="width:950px; height:325px; margin:0px auto;"><img src="${root}/resources/img/index/slide3.png" style="width:950px; height:325px;"></div></li>
  </ul>
  <ul class="dot">
    <li class="on">슬라이드 버튼1번</li>
    <li>슬라이드 버튼2번</li>
    <li>슬라이드 버튼3번</li>
  </ul>
  <div class="prev"><img src="${root}/resources/img/index/left.png" id="prev"/></div>
  <div class="next"><img src="${root}/resources/img/index/right.png" id="next"/></div>
</div>
			</div> <!-- 슬라이드 -->
			<div class="best">
			<div>
				<span>이달의 도서</span>
				<span class="plus"><a href="${root}/book/monthBook.do" style="color:#edac2b;">+더보기</a></span>
			</div>
			<!-- 이달의 도서 이미지 -->
			
			<div>
				<c:forEach var="book" items="${bookList}">
						<div class="bestImg">
							<a href="javascript:void(0);" onclick="goBookDetail('${root}', ${book.book_isbn})">
							<img src="${book.book_img_url}"/>
							</a>
						</div>
				</c:forEach>
			</div>
			
			 <!-- 이달의 도서 내용 -->
			<div>
			<c:forEach var="book" items="${bookList}">
				<div class="bestContent">
					<div class="bookName">${book.book_name}</div>  <!-- 책제목 -->
					<div class="bookWriter">${book.book_writer}</div>  <!-- 작가 -->
					<div class="bookPrice">가격  : <fmt:formatNumber value="${book.book_price}" pattern="#,###,###"/>원</div>  <!-- 가격 -->
				</div>
			</c:forEach>	
			</div>
			</div> <!-- 베스트셀러 -->
			<div class="new">
				<div>
					<div>
						<div class="top">
							<span>소설</span>
							<span>
								<input type="button" value="6위-10위" id="btn2" class="btn2"/>
								<input type="button" value="1위-5위" id="btn3" class="btn3"/>								
							</span>
						</div>
						<div class="bottom" id="first_novel">
							<c:forEach var="novel" items="${novelList_first}">
								<div style="margin-top:10px;">
									<a href="${root}/book/bookDetail.do?book_isbn=${novel.book_isbn}">
									<div class="bunho" id="bunho1">${novel.num}</div>
									<div class="img"><img src="${novel.book_img_url}"/></div>
									<div class="content">
										<div class="book">
											<span>${novel.book_name}</span>
											<span>${novel.book_writer}</span>
										</div>
										<div class="price">가격  : <fmt:formatNumber value="${novel.book_price}" pattern="#,###,###"/>원</div>
									</div>
									</a>
								</div>
							</c:forEach>
						</div>
						<div class="bottom" id="second_novel">
							<c:forEach var="novel" items="${novelList_second}">
								<div style="margin-top:10px;">
									<a href="${root}/book/bookDetail.do?book_isbn=${novel.book_isbn}">
									<div class="bunho" id="bunho1">${novel.num}</div>
									<div class="img"><img src="${novel.book_img_url}"/></div>
									<div class="content">
										<div class="book">
											<span>${novel.book_name}</span>
											<span>${novel.book_writer}</span>
										</div>
										<div class="price">가격  : <fmt:formatNumber value="${novel.book_price}" pattern="#,###,###"/>원</div>
									</div>
									</a>
								</div>
							</c:forEach>
						</div>						
					</div>
					<div>
						<div class="top">
							<span>경제</span>
							<span>
								<input type="button" value="6위-10위" class="btn2" id="btn4"/>
								<input type="button" value="1위-5위" class="btn3" id="btn5"/>
							</span>
						</div>
						<div class="bottom" id="first_economy">
							<c:forEach var="economy" items="${economyList_first}">
								<div style="margin-top:10px;">
									<a href="${root}/book/bookDetail.do?book_isbn=${economy.book_isbn}">
									<div class="bunho" id="bunho1">${economy.num}</div>
									<div class="img"><img src="${economy.book_img_url}"/></div>
									<div class="content">
										<div class="book">
											<span>${economy.book_name}</span>
											<span>${economy.book_writer}</span>
										</div>
										<div class="price">가격  : <fmt:formatNumber value="${economy.book_price}" pattern="#,###,###"/>원</div>
									</div>
									</a>
								</div>
							</c:forEach>
						</div>
						<div class="bottom" id="second_economy">
							<c:forEach var="economy" items="${economyList_second}">
								<div style="margin-top:10px;">
									<a href="${root}/book/bookDetail.do?book_isbn=${economy.book_isbn}">
									<div class="bunho" id="bunho1">${economy.num}</div>
									<div class="img"><img src="${economy.book_img_url}"/></div>
									<div class="content">
										<div class="book">
											<span>${economy.book_name}</span>
											<span>${economy.book_writer}</span>
										</div>
										<div class="price">가격  : <fmt:formatNumber value="${economy.book_price}" pattern="#,###,###"/>원</div>
									</div>
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
					<div style="margin-right: 0px;">
						<div class="top">
							<span>IT</span>
							<span>
								<input type="button" value="6위-10위" class="btn2" id="btn6"/>
								<input type="button" value="1위-5위" class="btn3" id="btn7"/>
							</span>
						</div>
						<div class="bottom" id="ItList_first">
							<c:forEach var="IT" items="${ItList_first}">
								<div style="margin-top:10px;">
									<a href="${root}/book/bookDetail.do?book_isbn=${IT.book_isbn}">
									<div class="bunho" id="bunho1">${IT.num}</div>
									<div class="img"><img src="${IT.book_img_url}"/></div>
									<div class="content">
										<div class="book">
											<span>${IT.book_name}</span>
											<span>${IT.book_writer}</span>
										</div>
										<div class="price">가격  : <fmt:formatNumber value="${IT.book_price}" pattern="#,###,###"/>원</div>
									</div>
									</a>
								</div>
							</c:forEach>
						</div>
						<div class="bottom" id="ItList_second">
							<c:forEach var="IT" items="${ItList_second}">
								<div style="margin-top:10px;">
									<a href="${root}/book/bookDetail.do?book_isbn=${IT.book_isbn}">
									<div class="bunho" id="bunho1">${IT.num}</div>
									<div class="img"><img src="${IT.book_img_url}"/></div>
									<div class="content">
										<div class="book">
											<span>${IT.book_name}</span>
											<span>${IT.book_writer}</span>
										</div>
										<div class="price">가격  : <fmt:formatNumber value="${IT.book_price}" pattern="#,###,###"/>원</div>
									</div>
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div> <!--신간 도서 -->
			<div class="writer">
				<div>스토리 : 읽움</div>
				<div class="writerContent">
					<div class="circle">
						<div>
							<img alt="이미지준비중" src="http://image.kyobobook.co.kr/ink/images/prom/2019/bookcast/07/bn_23.jpg">
							<img src="http://image.kyobobook.co.kr/ink/images/welcome/mask_story.png"/>
							</div>
						<div>
							<span style="font-weight: bold;">그들이 열광한 한 장의 그림</span>
							<br/><span>비즈니스 모델, 한장으로 끝냈지</span>
						</div>
					</div>
					<div class="circle">
						<div>
							<img alt="이미지준비중" src="http://image.kyobobook.co.kr/ink/images/prom/2019/bookcast/07/bn_22.jpg">
							<img src="http://image.kyobobook.co.kr/ink/images/welcome/mask_story.png"/>
							</div>
						<div>
							<span style="font-weight: bold;">다들 웃는데 나만 못 웃어</span>
							<br/><span>삼국지, 나만 몰라?</span>
						</div>
					</div>
					<div class="circle">
						<div>
							<img alt="이미지준비중" src="http://image.kyobobook.co.kr/ink/images/prom/2019/bookcast/07/bn_25.jpg">
							<img src="http://image.kyobobook.co.kr/ink/images/welcome/mask_story.png"/>
							</div>
						<div>
							<span style="font-weight: bold;">알라딘은 중국인이었다?</span>
							<br/><span><알라딘>원작의 숨겨진 비밀3</span>
						</div>
					</div>
					<div class="circle">
						<div>
							<img alt="이미지준비중" src="http://image.kyobobook.co.kr/ink/images/prom/2019/bookcast/07/bn_24.jpg">
							<img src="http://image.kyobobook.co.kr/ink/images/welcome/mask_story.png"/>
							</div>
						<div>
							<span style="font-weight: bold;">탐스타의 이혼소식보다 놀랐던</span>
							<br/><span>예상 외의 악필</span>
						</div>
					</div>
				</div>
				<div class="writerContent">
					<div class="circle">
						<div>
							<img alt="이미지준비중" src="http://image.kyobobook.co.kr/new_ink/booknews/upload/201907/CA6455467DAB4010A665C9974A8C867A.jpg">
							<img src="http://image.kyobobook.co.kr/ink/images/welcome/mask_story.png"/>
							</div>
						<div>
							<span style="font-weight: bold;">작가와의 만남</span>
							<br/><span>「대도시 사랑법」박상영</span>
						</div>
					</div>
					<div class="circle">
						<div>
							<img alt="이미지준비중" src="http://image.kyobobook.co.kr/new_ink/booknews/upload/201907/24E7EA32852B4011A0C4AE4CE2692882.jpg">
							<img src="http://image.kyobobook.co.kr/ink/images/welcome/mask_story.png"/>
							</div>
						<div>
							<span style="font-weight: bold;">작가와의 만남</span>
							<br/><span>「오브제 문화사」이지은</span>
						</div>
					</div>
					<div class="circle">
						<div>
							<img alt="이미지준비중" src="http://image.kyobobook.co.kr/new_ink/booknews/upload/thum/005/th_large_EA8CCCDEC17E45B0A682FC6F77500728.jpg">
							<img src="http://image.kyobobook.co.kr/ink/images/welcome/mask_story.png"/>
							</div>
						<div>
							<span style="font-weight: bold;">허희 허남웅의 낭만서점</span>
							<br/><span>당한만큼 갚아준다</span>
						</div>
					</div>
					<div class="circle">
						<div>
							<img alt="이미지준비중" src="http://image.kyobobook.co.kr/new_ink/booknews/upload/thum/177/th_large_EDB7E01E70E849D8B68873943EBD2CD2.jpg">
							<img src="http://image.kyobobook.co.kr/ink/images/welcome/mask_story.png"/>
							</div>
						<div>
							<span style="font-weight: bold;">낭만서점 세계문학읽기</span>
							<br/><span>누가 버지니아 울프를 두려워?</span>
						</div>
					</div>
				</div>
			</div> <!-- 작가의말 -->
		</section>
	
		<footer>
			<div class="list">
				<div>
					<div>
						<ul>
				          <li>COMPANY</li>
				          <br/><li>한눈에 보기</li>
				          <li>읽움의 사명</li>
				          <li>읽움 소개</li>
				        </ul>
					</div>
					
					<div>
						 <ul>
					       <li>CORPORATE SALES</li>
					       <br/><li>대량 구매 안내</li>
					      </ul>
					</div>
					
					<div>
						 <ul>
				          <li>PARTNERSHIP</li>
				          <br/><li>신규 입점 제의</li>
				          <li>협력 고객사 등록신청</li>
				        </ul>
					</div>
					
					<div>
						 <ul>
				          <li>ONLINE COMMUNITY</li>
				         <br/><li>페이스북</li>
				          <li>트위터</li>
				          <li>유튜브</li>
				          <li>블로그</li>
				          <li>인스타그램</li>
				        </ul>
					</div>
					
					<div style="margin-right:0px;">
						<ul>
				   		  <li>RECRUIT</li>
				          <br/><li>채용 소개</li>
				          <li>채용 지원하기</li>
				          <c:if test="${member_id=='admin'}">
					          <li><a href="${root}/admin/AdminBook.do">관리자페이지</a></li>
				          </c:if>				          
				        </ul>
	     			 </div>
	   
				</div>	
			</div>
			
			<div class="href">
				<div>
					<ul>
						<li>회사 소개</li>
						<li>이용약관</li>
						<li>개인정보처리방침</li>
						<li>고객센터</li>
						<li>협력사여러분</li>
						<li>제휴제안</li>
						<li>채용정보</li>
					</ul>
				</div>
			</div>
			
			<div class="introduce">
				<div>
					<div><img src="${root}/resources/img/index/logo2.png" style=" height:40px; width:150px; margin-top: 20px;"></div>
					<div style="font-size: 12px;">
						<div>(주)읽움 서울시 구로구 구로3동 대표이사 : 박민주 </div>
						<div>사업자등록번호 : 102-11-56946</div>
						<div>대표전화 : 1544-1900 (발신자부담)  팩스 : 0502-569-1235 (지역번호공통)</div>
						<div>서울특변시 통신매업신고번호 : 제 653호  ▶사업자정보확인</div>
						<br/>
						<div>COPYRIGHT(C) ILGUM BOOK CENTRE ALL RIGHTS RESERVED.</div>
					</div>
				</div>
				<div>
					<div></div>
					<div style="font-size: 12px;">
						<div>LG U+ 구매안전서비스  ▶서비스 가입 확인</div>
						<div>고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰에서 가입한 LG유플러스의 구매안</div>
						<div>전서비스를 이용하실 수 있습니다.</div>
						<div><img src="http://image.kyobobook.co.kr/ink/images/common/mark_isms.png" style="margin-top: 10px;"></div>
					</div>
				</div>
			</div>
		</footer>
		</div>
</body>
</html>