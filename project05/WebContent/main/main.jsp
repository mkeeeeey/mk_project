<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PC냥이:컴퓨터 맞춰보자냥</title>
<style>
body{margin:0; padding:0; overflow-x:hidden;}
a{text-decoration:none;}
ul{margin:0; padding:0;}
ul li{list-style:none;}
			
	.policy{width:1280px; margin:0 auto;}
		.menu-img{position:relative;}
			.menu-img img{width:100%; height:400px;}
				.fade{-webkit-animation-name: fade;
					  -webkit-animation-duration: 5.5s;
						animation-name: fade;
					  	animation-duration: 5.5s;
						}
						@-webkit-keyframes fade {
						  from {opacity: .4} 
						  to {opacity: 4}
						}
						@keyframes fade {
						  from {opacity: .4} 
						  to {opacity: 4}
						}
	.pdt-wrap{width:1280px; height:350px; margin:0 auto; background-color: white;}		

	.com{width:220px; height:300px;float: left; margin:15px;}
	.com_img{width:220px;height:220px;}
	.com_intro{width:100%; border:1px solid black; border-collapse:collapse;}	
	.com_intro .com_title{border:1px solid black; text-align:center;}
	.com_intro .com_assem{border-bottom:1px solid white;}
	.com_intro .com_assem:last-child{border-bottom:1px solid black;}	   			
</style>
<script src="${path}/a00_com/jquery-3.4.1.js" type="text/javascript"></script>
<script type="text/javascript">
	$("#market1").click(function(){
		$(location).attr('href','market');
	});
	$("#market1").click(function(){
		$(location).attr('href','market');
	});
	function go_detail(num){
		$("[name=proc]").val("comdetail");
		$("[name=com_no]").val(num);
		$("form").submit();
	}
</script>
</head>
<body>
<div class="all-wrap">

<jsp:include page="../main/top.jsp"/>
<form action="comlist" method="post">
	<input type="hidden" name="proc" value=""/>
	<input type="hidden" name="com_no"/>
</form>
	<div class="policy">
		<img alt="" src="image/main/policy1.jpg">
		<img alt="" src="image/main/policy2.jpg">
		<img alt="" src="image/main/policy3.jpg">
		<img alt="" src="image/main/policy4.jpg">
	</div>
	
	<div class="menu-img">
        <div class="mImg fade"><img src="image/main/main1.jpg" alt=""></div>
        <div class="mImg fade"><img src="image/main/main2.jpg" alt=""></div>
        <div class="mImg fade"><img src="image/main/main3.jpg" alt=""></div>
        <div class="mImg fade"><img src="image/main/main4.jpg" alt=""></div>
	</div>
	
	<div class="pdt-wrap">
	
		<div class="pdt-box">
			<ul id="market_list">
				<!-- 이중 forEach를 활용한 견적 호출 -->
				<c:forEach var="com" items="${clist}" begin="0" end="4">
					<li class="com" onclick="javascript:go_detail('${com.com_no}')">
						<img src="image/Computer/${com.com_img}" class="com_img">
						<table class="com_intro" border>
							<tr><td class="com_title" colspan="2">${com.com_name}</td></tr>
							<tr class="com_assem"><td>가격</td><td style="text-align:right;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${com.com_price}" />원</td></tr>
						</table>
					</li>
				</c:forEach>
			</ul>
		</div>
		
	</div>
	

<jsp:include page="../main/bottom.jsp"/>


</div>
</body>
<script type="text/javascript">
		//슬라이드 이미지 코드
		var slideIndex = 0;
		showSlides();
	
		function showSlides() {
		    var i;
		    var slides = document.getElementsByClassName("mImg");
		    for (i = 0; i < slides.length; i++) {
		       slides[i].style.display = "none";  
		    }
		    slideIndex++;
		    if (slideIndex > slides.length) {slideIndex = 1}    

		    slides[slideIndex-1].style.display = "block";  
		    setTimeout(showSlides, 2000); // Change image every 2 seconds
		}
	</script>
</html>