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

