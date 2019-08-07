<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<title>Insert title here</title>
<script type="text/javascript" src="${root}/resources/jquery/jquery.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/index/slide.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/index/index.css"/>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/index/slide.css"/>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/index/section.css"/>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/index/footer.css"/>
<script>
	var login = ${login};
	alert(login);
	if(login != null){
		$(function(){
			$("#logout > li:nth-child(3)").replaceWith("<li><a href='#'>마이페이지</a></li>");
			$("#logout > li:nth-child(4)").replaceWith("<li><a href='${root}/index.do'>로그아웃</a></li>");
		});
	}
</script>
<script type="text/javascript">
	/* show, hide, toggle : 나타남, 사라짐
	   fadeIn, fadeOut, fadeToggle : 불투명도로 점점 감소, 나타남
	   slideUp, slideDown, slideToogle : 높이가 0에 가깝게 서서히 나타남, 사라짐
	*/
	
	var zoomx = 100;
	
	$(function(){ //$(document).ready(function(){
		$("#btn").hover(function(){
			$(this).css("cursor","pointer");
		});
		
		$("#tec").focusin(function(){
			$(this).attr("placeholder","");
		});
		
		$("#tec").focusout(function(){
			$(this).attr("placeholder","검색어를 입력하세요");
		});
		
		$("#btn2").click(function(){
			$(this).css({
			"background-color":"#fff",
			"color":"#edac2b",
			"line-height":"18px",
			"border":"2px solid #edac2b"
			});
			
			$("#btn3").css("color","#FFFFFF")
			.css("background-color","#edac2b")
			.css("line-height","20px");
			
			$("#bunho1").html("6");
			$("#bunho2").html("7");
			$("#bunho3").html("8");
			$("#bunho4").html("9");
			$("#bunho5").html("10");
		});
		
		$("#btn3").click(function(){
			$(this).css({
			"background-color":"#fff",
			"color":"#edac2b",
			"line-height":"18px",
			"border":"2px solid #edac2b"
			});
			
			$("#btn2").css("color","#FFFFFF")
			.css("background-color","#edac2b")
			.css("line-height","20px");
		
			
			$("#bunho1").html("1");
			$("#bunho2").html("2");
			$("#bunho3").html("3");
			$("#bunho4").html("4");
			$("#bunho5").html("5");
		});
		
		$("#btn4").click(function(){
			$(this).css({
			"background-color":"#fff",
			"color":"#edac2b",
			"line-height":"18px",
			"border":"2px solid #edac2b"
			});
			
			$("#btn5").css("color","#FFFFFF")
			.css("background-color","#edac2b")
			.css("line-height","20px");
			
			$("#bunho6").html("6");
			$("#bunho7").html("7");
			$("#bunho8").html("8");
			$("#bunho9").html("9");
			$("#bunho10").html("10");
		});
		
		$("#btn5").click(function(){
			$(this).css({
			"background-color":"#fff",
			"color":"#edac2b",
			"line-height":"18px",
			"border":"2px solid #edac2b"
			});
			
			$("#btn4").css("color","#FFFFFF")
			.css("background-color","#edac2b")
			.css("line-height","20px");
		
			
			$("#bunho6").html("1");
			$("#bunho7").html("2");
			$("#bunho8").html("3");
			$("#bunho9").html("4");
			$("#bunho10").html("5");
		});
		
		$("#btn6").click(function(){
			$(this).css({
			"background-color":"#fff",
			"color":"#edac2b",
			"line-height":"18px",
			"border":"2px solid #edac2b"
			});
			
			$("#btn7").css("color","#FFFFFF")
			.css("background-color","#edac2b")
			.css("line-height","20px");
			
			$("#bunho11").html("6");
			$("#bunho12").html("7");
			$("#bunho13").html("8");
			$("#bunho14").html("9");
			$("#bunho15").html("10");
		});
		
		$("#btn7").click(function(){
			$(this).css({
			"background-color":"#fff",
			"color":"#edac2b",
			"line-height":"18px",
			"border":"2px solid #edac2b"
			});
			
			$("#btn6").css("color","#FFFFFF")
			.css("background-color","#edac2b")
			.css("line-height","20px");
		
			
			$("#bunho11").html("1");
			$("#bunho12").html("2");
			$("#bunho13").html("3");
			$("#bunho14").html("4");
			$("#bunho15").html("5");
		});
		
		$("#gnb").mouseover(function(){
			$("#snb").slideDown(200);	
		});
		
		$('#snb').mouseenter(function() { 
		     $(this).animate({opacity: 'show'}, 'slow'); 
		    }); 

		$('#snb').mouseleave(function() { 
		     $(this).animate({opacity: 'hide'}, 'fast'); 
		    }); 
		
	});
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
									<li><a href="#">도서</a></li>
									<li><a href="#">베스트셀러</a></li> <!-- 구매순  -->
									<li><a href="#">신간도서</a></li> <!-- 날짜순 -->
									<li><a href="#">이달의도서</a></li> <!-- 평점&리뷰순 -->
									<li><a href="#">이벤트</a></li>
								</ul>
							</div>
							<div>
								<ul id="logout">
									<li><a href="#">장바구니</a></li>
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
								<span><a href="#">소설/시/희곡</a></span>
								<span><a href="#">경제경영</a></span>
								<span><a href="#">자기계발</a></span>
							</div>
							<div>
								<span><a href="#">인물</a></span>
								<span><a href="#">인문</a></span>
								<span><a href="#">국어/외국어/사전</a></span>
							</div>
							<div>
								<span><a href="#">역사</a></span>
								<span><a href="#">사회/정치</a></span>
								<span><a href="#">가정살림</a></span>
							</div>
							<div>
								<span><a href="#">건강/취미</a></span>
								<span><a href="#">여행</a></span>
								<span><a href="#">종교</a></span>
							</div>
							<div>
								<span><a href="#">유아</a></span>
								<span><a href="#">어린이</a></span>
								<span><a href="#">청소년</a></span>
							</div>
							<div>
								<span><a href="#">자연과학</a></span>
								<span><a href="#">IT모바일</a></span>
								<span><a href="#">잡지</a></span>
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
				<span class="plus"><a href="#" style="color:#edac2b;">+더보기</a></span>
			</div>
			<div> <!-- 이달의 도서 이미지 -->
				<div class="bestImg"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"></div>
				<div class="bestImg"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"></div>
				<div class="bestImg"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"></div>
				<div class="bestImg"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"></div>
				<div class="bestImg"style="margin-right: 0px;"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"></div>
			</div>
			<div> <!-- 이달의 도서 내용 -->
				<div class="bestContent">
					<div class="bookName">대도시의 사랑법</div>  <!-- 책제목 -->
					<div class="bookWriter">박상영</div>  <!-- 작가 -->
					<div class="bookPrice">가격 8,820원</div>  <!-- 가격 -->
				</div>
				
				<div class="bestContent">
					<div class="bookName">대도시의 사랑법</div>  <!-- 책제목 -->
					<div class="bookWriter">박상영</div>  <!-- 작가 -->
					<div class="bookPrice">가격 8,820원</div>  <!-- 가격 -->
				</div>
				
				<div class="bestContent">
					<div class="bookName">대도시의 사랑법</div>  <!-- 책제목 -->
					<div class="bookWriter">박상영</div>  <!-- 작가 -->
					<div class="bookPrice">가격 8,820원</div>  <!-- 가격 -->
				</div>
				
				<div class="bestContent">
					<div class="bookName">대도시의 사랑법</div>  <!-- 책제목 -->
					<div class="bookWriter">박상영</div>  <!-- 작가 -->
					<div class="bookPrice">가격 8,820원</div>  <!-- 가격 -->
				</div>
				
				<div class="bestContent" style="margin-right: 0px;">
					<div class="bookName">대도시의 사랑법</div>  <!-- 책제목 -->
					<div class="bookWriter">박상영</div>  <!-- 작가 -->
					<div class="bookPrice">가격 8,820원</div>  <!-- 가격 -->
				</div>
	
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
						<div class="bottom">
							<div style="margin-top:10px;">
								<div class="bunho" id="bunho1">1</div>
								<div class="img"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"/></div>
								<div class="content">
									<div class="book">
										<span style="color:black; font-size: 14px;">대도시의 사랑법</span>
										</br><span>박상영</span>
									</div>
									<div class="price">가격 8,820원</div>
								</div>
							</div>
							
							<div>
								<div class="bunho" id="bunho2">2</div>
								<div class="img"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"/></div>
								<div class="content">
									<div class="book">
										<span style="color:black; font-size: 14px;">대도시의 사랑법</span>
										</br><span>박상영</span>
									</div>
									<div class="price">가격 8,820원</div>
								</div>
							</div>
							
							<div>
								<div class="bunho" id="bunho3">3</div>
								<div class="img"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"/></div>
								<div class="content">
									<div class="book">
										<span style="color:black; font-size: 14px;">대도시의 사랑법</span>
										</br><span>박상영</span>
									</div>
									<div class="price">가격 8,820원</div>
								</div>
							</div>
							
							<div>
								<div class="bunho" id="bunho4">4</div>
								<div class="img"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"/></div>
								<div class="content">
									<div class="book">
										<span style="color:black; font-size: 14px;">대도시의 사랑법</span>
										</br><span>박상영</span>
									</div>
									<div class="price">가격 8,820원</div>
								</div>
							</div>
							
							<div>
								<div class="bunho" id="bunho5">5</div>
								<div class="img"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"/></div>
								<div class="content">
									<div class="book">
										<span style="color:black; font-size: 14px;">대도시의 사랑법</span>
										</br><span>박상영</span>
									</div>
									<div class="price">가격 8,820원</div>
								</div>
							</div>
							
						</div>
					</div>
					<div>
						<div class="top">
							<span>동화</span>
							<span>
								<input type="button" value="6위-10위" class="btn2" id="btn4"/>
								<input type="button" value="1위-5위" class="btn3" id="btn5"/>
							</span>
						</div>
						<div class="bottom">
							<div style="margin-top:10px;">
								<div class="bunho" id="bunho6">1</div>
								<div class="img"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"/></div>
								<div class="content">
									<div class="book">
										<span style="color:black; font-size: 14px;">대도시의 사랑법</span>
										</br><span>박상영</span>
									</div>
									<div class="price">가격 8,820원</div>
								</div>
							</div>
							<div>
								<div class="bunho" id="bunho7">2</div>
								<div class="img"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"/></div>
								<div class="content">
									<div class="book">
										<span style="color:black; font-size: 14px;">대도시의 사랑법</span>
										</br><span>박상영</span>
									</div>
									<div class="price">가격 8,820원</div>
								</div>
							</div>
							<div>
								<div class="bunho" id="bunho8">3</div>
								<div class="img"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"/></div>
								<div class="content">
									<div class="book">
										<span style="color:black; font-size: 14px;">대도시의 사랑법</span>
										</br><span>박상영</span>
									</div>
									<div class="price">가격 8,820원</div>
								</div>
							</div>
							<div>
								<div class="bunho" id="bunho9">4</div>
								<div class="img"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"/></div>
								<div class="content">
									<div class="book">
										<span style="color:black; font-size: 14px;">대도시의 사랑법</span>
										</br><span>박상영</span>
									</div>
									<div class="price">가격 8,820원</div>
								</div>
							</div>
							<div>
								<div class="bunho" id="bunho10">5</div>
								<div class="img"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"/></div>
								<div class="content">
									<div class="book">
										<span style="color:black; font-size: 14px;">대도시의 사랑법</span>
										</br><span>박상영</span>
									</div>
									<div class="price">가격 8,820원</div>
								</div>
							</div>
						</div>
					</div>
					<div style="margin-right: 0px;">
						<div class="top">
							<span>수험서</span>
							<span>
								<input type="button" value="6위-10위" class="btn2" id="btn6"/>
								<input type="button" value="1위-5위" class="btn3" id="btn7"/>
							</span>
						</div>
						<div class="bottom">
							<div style="margin-top:10px;">
								<div class="bunho" id="bunho11">1</div>
								<div class="img"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"/></div>
								<div class="content">
									<div class="book">
										<span style="color:black; font-size: 14px;">대도시의 사랑법</span>
										</br><span>박상영</span>
									</div>
									<div class="price">가격 8,820원</div>
								</div>
							</div>
							<div>
								<div class="bunho" id="bunho12">2</div>
								<div class="img"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"/></div>
								<div class="content">
									<div class="book">
										<span style="color:black; font-size: 14px;">대도시의 사랑법</span>
										</br><span>박상영</span>
									</div>
									<div class="price">가격 8,820원</div>
								</div>
							</div>
							<div>
								<div class="bunho" id="bunho13">3</div>
								<div class="img"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"/></div>
								<div class="content">
									<div class="book">
										<span style="color:black; font-size: 14px;">대도시의 사랑법</span>
										</br><span>박상영</span>
									</div>
									<div class="price">가격 8,820원</div>
								</div>
							</div>
							<div>
								<div class="bunho" id="bunho14">4</div>
								<div class="img"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"/></div>
								<div class="content">
									<div class="book">
										<span style="color:black; font-size: 14px;">대도시의 사랑법</span>
										</br><span>박상영</span>
									</div>
									<div class="price">가격 8,820원</div>
								</div>
							</div>
							<div>
								<div class="bunho" id="bunho15">5</div>
								<div class="img"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"/></div>
								<div class="content">
									<div class="book">
										<span style="color:black; font-size: 14px;">대도시의 사랑법</span>
										</br><span>박상영</span>
									</div>
									<div class="price">가격 8,820원</div>
								</div>
							</div>
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