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
			
			$("#second_novel").css("display","block");
			$("#first_novel").css("display","none");
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
			
			$("#first_novel").css("display","block");
			$("#second_novel").css("display","none");
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
			
			$("#second_economy").css("display","block");
			$("#first_economy").css("display","none");
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
			
			$("#first_economy").css("display","block");
			$("#second_economy").css("display","none");
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
			
			$("#ItList_second").css("display","block");
			$("#ItList_first").css("display","none");
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
			
			$("#ItList_first").css("display","block");
			$("#ItList_second").css("display","none");
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

