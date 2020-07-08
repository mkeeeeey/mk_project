<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>    
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
	.menu-wrap{width:100%;}
	.menu-2-wrap{background-color:#63145F;}
		.menu-2{width:1280px; margin:0 auto; padding:10px 0; text-align:center; color:white; font-weight:1px;
				border-right:1px solid #E4E1E1; border-left:1px solid #E4E1E1;}
			.menu-2 li{display:inline; font-size:25px; margin:0 15px; cursor:pointer;}
			.menu-2 a{text-decoration:none; color:white;}
			
	#market_wrap{padding:50px; position: relative; width:1280px; height:13700px; margin:0 auto;}
	#market_title{border-bottom:1px solid black; padding:10px; font-size:20px;}
	.parts{width:220px; height:300px;float: left; margin:15px;}
	.parts_img{width:220px;height:220px;}
	.parts_intro{width:100%; border:1px solid black; border-collapse:collapse;}	
	.parts_intro .parts_title{border:1px solid black; text-align:center;}
	.parts_intro .parts_assem{border:1px solid black;}
						
</style>
<script src="${path}/a00_com/jquery-3.4.1.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#cpu").click(function(){
		$("[name=category]").val("CPU");
		$("form").submit();
	});
	$("#mainbo").click(function(){
		$("[name=category]").val("메인보드");
		$("form").submit();
	});
	$("#ram").click(function(){
		$("[name=category]").val("RAM");
		$("form").submit();
	});
	$("#graphic").click(function(){
		$("[name=category]").val("그래픽카드");
		$("form").submit();
	});
	$("#ssd").click(function(){
		$("[name=category]").val("SSD");
		$("form").submit();
	});
	$("#hdd").click(function(){
		$("[name=category]").val("HDD");
		$("form").submit();
	});
	$("#case").click(function(){
		$("[name=category]").val("케이스");
		$("form").submit();
	});
	$("#power").click(function(){
		$("[name=category]").val("파워");
		$("form").submit();
	});
});
	function go_detail(num){
		$("[name=proc]").val("partsdetail");
		$("[name=parts_no]").val(num);
		$("form").submit();
	}
</script>
</head>
<body>
<form method="post">
<input type="hidden" name="proc" value="partslist"/>
<input type="hidden" name="category" value="all"/>
<input type="hidden" name="parts_no" value="0"/>
<jsp:include page="../../main/top.jsp"/>
<div class="menu-wrap">
	<div class="menu-2-wrap">
		<div class="menu-2">
			<ul>
				<li id="cpu">CPU</li>
				<li id="mainbo">메인보드</li>
				<li id="ram">RAM</li>
				<li id="graphic">그래픽카드</li>
				<li id="ssd">SSD</li>
				<li id="hdd">HDD</li>
				<li id="case">케이스</li>
				<li id="power">파워</li>
			</ul>
		</div>
	</div>
</div>
<div id="market_wrap">
	<p id="market_title">컴퓨터부품</p>
	<ul id="market_list">
		<c:forEach var="parts" items="${plist}">
			<li class="parts" onclick="javascript:go_detail('${parts.parts_no}')">
				<img src="image/parts/${parts.parts_img}" class="parts_img">
				<table class="parts_intro" border>
					<tr><td class="parts_title" colspan="2">${parts.parts_name}</td></tr>
					<tr class="parts_assem"><td>가격</td><td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${parts.parts_price}" />원</td></tr>
				</table>
			</li>
		</c:forEach>
	</ul>
</div>
</form>
<jsp:include page="../../main/bottom.jsp"/>

</body>
</html>