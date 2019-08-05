<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<script type="text/javascript">
	/* show, hide, toggle : ��Ÿ��, �����
	   fadeIn, fadeOut, fadeToggle : �������� ���� ����, ��Ÿ��
	   slideUp, slideDown, slideToogle : ���̰� 0�� ������ ������ ��Ÿ��, �����
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
			$(this).attr("placeholder","�˻�� �Է��ϼ���");
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
				</div>  <!-- �ΰ� -->
				<div class="search">
					<div class="searchDiv">
						<input class="tec" id="tec" type="text" placeholder="�˻�� �Է��ϼ���">
						<button class="btn" id="btn">�˻�</button> <!-- ��ư -->
					</div>
				</div>  <!-- �˻� -->
			</div>
				<div class="second"> <!-- �޴� -->
					<nav>
						<div class="nav">
							<div>
								<ul>
									<li  id="gnb" style="width:50px; margin-left:0px;"><a href="#"><img src="${root}/resources/img/index/dropdown.png"/></a></li>
									<li><a href="#">����</a></li>
									<li><a href="#">����Ʈ����</a></li> <!-- ���ż�  -->
									<li><a href="#">�Ű�����</a></li> <!-- ��¥�� -->
									<li><a href="#">�̴��ǵ���</a></li> <!-- ����&����� -->
									<li><a href="#">�̺�Ʈ</a></li>
								</ul>
							</div>
							<div>
								<ul>
									<li><a href="#">��ٱ���</a></li>
									<li><a href="#">������</a></li>
									<li><a href="${root}/member/memberJoin.do">ȸ������</a></li>
									<li><a href="${root}/member/memberLogin.do">�α���</a></li>
								</ul>
							</div>
						</div>
					</nav>
					<div id="snb" class="snb">
						<div class="snb_s">
							<div style="margin-left: 30px;">
								<span><a href="#">�Ҽ�/��/���</a></span>
								<span><a href="#">�����濵</a></span>
								<span><a href="#">�ڱ���</a></span>
							</div>
							<div>
								<span><a href="#">�ι�</a></span>
								<span><a href="#">�ι�</a></span>
								<span><a href="#">����/�ܱ���/����</a></span>
							</div>
							<div>
								<span><a href="#">����</a></span>
								<span><a href="#">��ȸ/��ġ</a></span>
								<span><a href="#">�����츲</a></span>
							</div>
							<div>
								<span><a href="#">�ǰ�/���</a></span>
								<span><a href="#">����</a></span>
								<span><a href="#">����</a></span>
							</div>
							<div>
								<span><a href="#">����</a></span>
								<span><a href="#">���</a></span>
								<span><a href="#">û�ҳ�</a></span>
							</div>
							<div>
								<span><a href="#">�ڿ�����</a></span>
								<span><a href="#">IT�����</a></span>
								<span><a href="#">����</a></span>
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
    <li class="on">�����̵� ��ư1��</li>
    <li>�����̵� ��ư2��</li>
    <li>�����̵� ��ư3��</li>
  </ul>
  <div class="prev"><img src="${root}/resources/img/index/left.png" id="prev"/></div>
  <div class="next"><img src="${root}/resources/img/index/right.png" id="next"/></div>
</div>
			</div> <!-- �����̵� -->
			<div class="best">
			<div>
				<span>�̴��� ����</span>
				<span class="plus"><a href="#" style="color:#edac2b;">+������</a></span>
			</div>
			<div> <!-- �̴��� ���� �̹��� -->
				<div class="bestImg"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"></div>
				<div class="bestImg"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"></div>
				<div class="bestImg"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"></div>
				<div class="bestImg"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"></div>
				<div class="bestImg"style="margin-right: 0px;"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"></div>
			</div>
			<div> <!-- �̴��� ���� ���� -->
				<div class="bestContent">
					<div class="bookName">�뵵���� �����</div>  <!-- å���� -->
					<div class="bookWriter">�ڻ�</div>  <!-- �۰� -->
					<div class="bookPrice">���� 8,820��</div>  <!-- ���� -->
				</div>
				
				<div class="bestContent">
					<div class="bookName">�뵵���� �����</div>  <!-- å���� -->
					<div class="bookWriter">�ڻ�</div>  <!-- �۰� -->
					<div class="bookPrice">���� 8,820��</div>  <!-- ���� -->
				</div>
				
				<div class="bestContent">
					<div class="bookName">�뵵���� �����</div>  <!-- å���� -->
					<div class="bookWriter">�ڻ�</div>  <!-- �۰� -->
					<div class="bookPrice">���� 8,820��</div>  <!-- ���� -->
				</div>
				
				<div class="bestContent">
					<div class="bookName">�뵵���� �����</div>  <!-- å���� -->
					<div class="bookWriter">�ڻ�</div>  <!-- �۰� -->
					<div class="bookPrice">���� 8,820��</div>  <!-- ���� -->
				</div>
				
				<div class="bestContent" style="margin-right: 0px;">
					<div class="bookName">�뵵���� �����</div>  <!-- å���� -->
					<div class="bookWriter">�ڻ�</div>  <!-- �۰� -->
					<div class="bookPrice">���� 8,820��</div>  <!-- ���� -->
				</div>
	
			</div>
			</div> <!-- ����Ʈ���� -->
			<div class="new">
				<div>
					<div>
						<div class="top">
							<span>�Ҽ�</span>
							<span>
								<input type="button" value="6��-10��" id="btn2" class="btn2"/>
								<input type="button" value="1��-5��" id="btn3" class="btn3"/>
							</span>
						</div>
						<div class="bottom">
							<div style="margin-top:10px;">
								<div class="bunho" id="bunho1">1</div>
								<div class="img"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"/></div>
								<div class="content">
									<div class="book">
										<span style="color:black; font-size: 14px;">�뵵���� �����</span>
										</br><span>�ڻ�</span>
									</div>
									<div class="price">���� 8,820��</div>
								</div>
							</div>
							
							<div>
								<div class="bunho" id="bunho2">2</div>
								<div class="img"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"/></div>
								<div class="content">
									<div class="book">
										<span style="color:black; font-size: 14px;">�뵵���� �����</span>
										</br><span>�ڻ�</span>
									</div>
									<div class="price">���� 8,820��</div>
								</div>
							</div>
							
							<div>
								<div class="bunho" id="bunho3">3</div>
								<div class="img"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"/></div>
								<div class="content">
									<div class="book">
										<span style="color:black; font-size: 14px;">�뵵���� �����</span>
										</br><span>�ڻ�</span>
									</div>
									<div class="price">���� 8,820��</div>
								</div>
							</div>
							
							<div>
								<div class="bunho" id="bunho4">4</div>
								<div class="img"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"/></div>
								<div class="content">
									<div class="book">
										<span style="color:black; font-size: 14px;">�뵵���� �����</span>
										</br><span>�ڻ�</span>
									</div>
									<div class="price">���� 8,820��</div>
								</div>
							</div>
							
							<div>
								<div class="bunho" id="bunho5">5</div>
								<div class="img"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"/></div>
								<div class="content">
									<div class="book">
										<span style="color:black; font-size: 14px;">�뵵���� �����</span>
										</br><span>�ڻ�</span>
									</div>
									<div class="price">���� 8,820��</div>
								</div>
							</div>
							
						</div>
					</div>
					<div>
						<div class="top">
							<span>��ȭ</span>
							<span>
								<input type="button" value="6��-10��" class="btn2" id="btn4"/>
								<input type="button" value="1��-5��" class="btn3" id="btn5"/>
							</span>
						</div>
						<div class="bottom">
							<div style="margin-top:10px;">
								<div class="bunho" id="bunho6">1</div>
								<div class="img"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"/></div>
								<div class="content">
									<div class="book">
										<span style="color:black; font-size: 14px;">�뵵���� �����</span>
										</br><span>�ڻ�</span>
									</div>
									<div class="price">���� 8,820��</div>
								</div>
							</div>
							<div>
								<div class="bunho" id="bunho7">2</div>
								<div class="img"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"/></div>
								<div class="content">
									<div class="book">
										<span style="color:black; font-size: 14px;">�뵵���� �����</span>
										</br><span>�ڻ�</span>
									</div>
									<div class="price">���� 8,820��</div>
								</div>
							</div>
							<div>
								<div class="bunho" id="bunho8">3</div>
								<div class="img"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"/></div>
								<div class="content">
									<div class="book">
										<span style="color:black; font-size: 14px;">�뵵���� �����</span>
										</br><span>�ڻ�</span>
									</div>
									<div class="price">���� 8,820��</div>
								</div>
							</div>
							<div>
								<div class="bunho" id="bunho9">4</div>
								<div class="img"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"/></div>
								<div class="content">
									<div class="book">
										<span style="color:black; font-size: 14px;">�뵵���� �����</span>
										</br><span>�ڻ�</span>
									</div>
									<div class="price">���� 8,820��</div>
								</div>
							</div>
							<div>
								<div class="bunho" id="bunho10">5</div>
								<div class="img"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"/></div>
								<div class="content">
									<div class="book">
										<span style="color:black; font-size: 14px;">�뵵���� �����</span>
										</br><span>�ڻ�</span>
									</div>
									<div class="price">���� 8,820��</div>
								</div>
							</div>
						</div>
					</div>
					<div style="margin-right: 0px;">
						<div class="top">
							<span>���輭</span>
							<span>
								<input type="button" value="6��-10��" class="btn2" id="btn6"/>
								<input type="button" value="1��-5��" class="btn3" id="btn7"/>
							</span>
						</div>
						<div class="bottom">
							<div style="margin-top:10px;">
								<div class="bunho" id="bunho11">1</div>
								<div class="img"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"/></div>
								<div class="content">
									<div class="book">
										<span style="color:black; font-size: 14px;">�뵵���� �����</span>
										</br><span>�ڻ�</span>
									</div>
									<div class="price">���� 8,820��</div>
								</div>
							</div>
							<div>
								<div class="bunho" id="bunho12">2</div>
								<div class="img"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"/></div>
								<div class="content">
									<div class="book">
										<span style="color:black; font-size: 14px;">�뵵���� �����</span>
										</br><span>�ڻ�</span>
									</div>
									<div class="price">���� 8,820��</div>
								</div>
							</div>
							<div>
								<div class="bunho" id="bunho13">3</div>
								<div class="img"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"/></div>
								<div class="content">
									<div class="book">
										<span style="color:black; font-size: 14px;">�뵵���� �����</span>
										</br><span>�ڻ�</span>
									</div>
									<div class="price">���� 8,820��</div>
								</div>
							</div>
							<div>
								<div class="bunho" id="bunho14">4</div>
								<div class="img"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"/></div>
								<div class="content">
									<div class="book">
										<span style="color:black; font-size: 14px;">�뵵���� �����</span>
										</br><span>�ڻ�</span>
									</div>
									<div class="price">���� 8,820��</div>
								</div>
							</div>
							<div>
								<div class="bunho" id="bunho15">5</div>
								<div class="img"><img src="http://image.kyobobook.co.kr/images/book/large/978/l9788936437978.jpg"/></div>
								<div class="content">
									<div class="book">
										<span style="color:black; font-size: 14px;">�뵵���� �����</span>
										</br><span>�ڻ�</span>
									</div>
									<div class="price">���� 8,820��</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div> <!--�Ű� ���� -->
			<div class="writer">
				<div>���丮 : �п�</div>
				<div class="writerContent">
					<div class="circle">
						<div>
							<img alt="�̹����غ���" src="http://image.kyobobook.co.kr/ink/images/prom/2019/bookcast/07/bn_23.jpg">
							<img src="http://image.kyobobook.co.kr/ink/images/welcome/mask_story.png"/>
							</div>
						<div>
							<span style="font-weight: bold;">�׵��� ������ �� ���� �׸�</span>
							<br/><span>����Ͻ� ��, �������� ������</span>
						</div>
					</div>
					<div class="circle">
						<div>
							<img alt="�̹����غ���" src="http://image.kyobobook.co.kr/ink/images/prom/2019/bookcast/07/bn_22.jpg">
							<img src="http://image.kyobobook.co.kr/ink/images/welcome/mask_story.png"/>
							</div>
						<div>
							<span style="font-weight: bold;">�ٵ� ���µ� ���� �� ����</span>
							<br/><span>�ﱹ��, ���� ����?</span>
						</div>
					</div>
					<div class="circle">
						<div>
							<img alt="�̹����غ���" src="http://image.kyobobook.co.kr/ink/images/prom/2019/bookcast/07/bn_25.jpg">
							<img src="http://image.kyobobook.co.kr/ink/images/welcome/mask_story.png"/>
							</div>
						<div>
							<span style="font-weight: bold;">�˶���� �߱����̾���?</span>
							<br/><span><�˶��>������ ������ ���3</span>
						</div>
					</div>
					<div class="circle">
						<div>
							<img alt="�̹����غ���" src="http://image.kyobobook.co.kr/ink/images/prom/2019/bookcast/07/bn_24.jpg">
							<img src="http://image.kyobobook.co.kr/ink/images/welcome/mask_story.png"/>
							</div>
						<div>
							<span style="font-weight: bold;">Ž��Ÿ�� ��ȥ�ҽĺ��� �����</span>
							<br/><span>���� ���� ����</span>
						</div>
					</div>
				</div>
				<div class="writerContent">
					<div class="circle">
						<div>
							<img alt="�̹����غ���" src="http://image.kyobobook.co.kr/new_ink/booknews/upload/201907/CA6455467DAB4010A665C9974A8C867A.jpg">
							<img src="http://image.kyobobook.co.kr/ink/images/welcome/mask_story.png"/>
							</div>
						<div>
							<span style="font-weight: bold;">�۰����� ����</span>
							<br/><span>���뵵�� ��������ڻ�</span>
						</div>
					</div>
					<div class="circle">
						<div>
							<img alt="�̹����غ���" src="http://image.kyobobook.co.kr/new_ink/booknews/upload/201907/24E7EA32852B4011A0C4AE4CE2692882.jpg">
							<img src="http://image.kyobobook.co.kr/ink/images/welcome/mask_story.png"/>
							</div>
						<div>
							<span style="font-weight: bold;">�۰����� ����</span>
							<br/><span>�������� ��ȭ�硹������</span>
						</div>
					</div>
					<div class="circle">
						<div>
							<img alt="�̹����غ���" src="http://image.kyobobook.co.kr/new_ink/booknews/upload/thum/005/th_large_EA8CCCDEC17E45B0A682FC6F77500728.jpg">
							<img src="http://image.kyobobook.co.kr/ink/images/welcome/mask_story.png"/>
							</div>
						<div>
							<span style="font-weight: bold;">���� �㳲���� ��������</span>
							<br/><span>���Ѹ�ŭ �����ش�</span>
						</div>
					</div>
					<div class="circle">
						<div>
							<img alt="�̹����غ���" src="http://image.kyobobook.co.kr/new_ink/booknews/upload/thum/177/th_large_EDB7E01E70E849D8B68873943EBD2CD2.jpg">
							<img src="http://image.kyobobook.co.kr/ink/images/welcome/mask_story.png"/>
							</div>
						<div>
							<span style="font-weight: bold;">�������� ���蹮���б�</span>
							<br/><span>���� �����Ͼ� ������ �η���?</span>
						</div>
					</div>
				</div>
			</div> <!-- �۰��Ǹ� -->
		</section>
	
		<footer>
			<div class="list">
				<div>
					<div>
						<ul>
				          <li>COMPANY</li>
				          <br/><li>�Ѵ��� ����</li>
				          <li>�п��� ���</li>
				          <li>�п� �Ұ�</li>
				        </ul>
					</div>
					
					<div>
						 <ul>
					       <li>CORPORATE SALES</li>
					       <br/><li>�뷮 ���� �ȳ�</li>
					      </ul>
					</div>
					
					<div>
						 <ul>
				          <li>PARTNERSHIP</li>
				          <br/><li>�ű� ���� ����</li>
				          <li>���� ���� ��Ͻ�û</li>
				        </ul>
					</div>
					
					<div>
						 <ul>
				          <li>ONLINE COMMUNITY</li>
				         <br/><li>���̽���</li>
				          <li>Ʈ����</li>
				          <li>��Ʃ��</li>
				          <li>��α�</li>
				          <li>�ν�Ÿ�׷�</li>
				        </ul>
					</div>
					
					<div style="margin-right:0px;">
						<ul>
				   		  <li>RECRUIT</li>
				          <br/><li>ä�� �Ұ�</li>
				          <li>ä�� �����ϱ�</li>
				        </ul>
	     			 </div>
	   
				</div>	
			</div>
			
			<div class="href">
				<div>
					<ul>
						<li>ȸ�� �Ұ�</li>
						<li>�̿���</li>
						<li>��������ó����ħ</li>
						<li>������</li>
						<li>���»翩����</li>
						<li>��������</li>
						<li>ä������</li>
					</ul>
				</div>
			</div>
			
			<div class="introduce">
				<div>
					<div><img src="${root}/resources/img/index/logo2.png" style=" height:40px; width:150px; margin-top: 20px;"></div>
					<div style="font-size: 12px;">
						<div>(��)�п� ����� ���α� ����3�� ��ǥ�̻� : �ڹ��� </div>
						<div>����ڵ�Ϲ�ȣ : 102-11-56946</div>
						<div>��ǥ��ȭ : 1544-1900 (�߽��ںδ�)  �ѽ� : 0502-569-1235 (������ȣ����)</div>
						<div>����Ư���� ��Ÿž��Ű��ȣ : �� 653ȣ  �����������Ȯ��</div>
						<br/>
						<div>COPYRIGHT(C) ILGUM BOOK CENTRE ALL RIGHTS RESERVED.</div>
					</div>
				</div>
				<div>
					<div></div>
					<div style="font-size: 12px;">
						<div>LG U+ ���ž�������  ������ ���� Ȯ��</div>
						<div>������ �����ŷ��� ���� ���� ������ ������ ���� ���θ����� ������ LG���÷����� ���ž�</div>
						<div>�����񽺸� �̿��Ͻ� �� �ֽ��ϴ�.</div>
						<div><img src="http://image.kyobobook.co.kr/ink/images/common/mark_isms.png" style="margin-top: 10px;"></div>
					</div>
				</div>
			</div>
		</footer>
		</div>
</body>
</html>