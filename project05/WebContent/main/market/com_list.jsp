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
			.menu-2 li{display:inline; font-size:25px; margin:0 15px; color:white; cursor:pointer;}
				
	#market_wrap{position: relative; width:1280px; height:2400px; margin:0 auto;}
	#market_title{border-bottom:1px solid black; padding:10px; font-size:20px;}
	.com{width:220px; height:750px;float: left; margin:15px;}
	.com_img{width:220px;height:220px;}
	.com_intro{width:100%; border:1px solid black; border-collapse:collapse;}	
	.com_intro .com_title{border:1px solid black; text-align:center;}
	.com_intro .com_assem{border-bottom:1px solid white;}
	.com_intro .com_assem:last-child{border-bottom:1px solid black;}
	
</style>
<script src="${path}/a00_com/jquery-3.4.1.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#home").click(function(){
		$("[name=category]").val("가정/사무용");
		$("form").submit();
	});
	$("#game").click(function(){
		$("[name=category]").val("게임용");
		$("form").submit();
	});
	$("#multi").click(function(){
		$("[name=category]").val("영상작업용");
		$("form").submit();
	});
	$("#work").click(function(){
		$("[name=category]").val("워크스테이션");
		$("form").submit();
	});
});
	function go_detail(num){
		$("[name=proc]").val("comdetail");
		$("[name=com_no]").val(num);
		$("form").submit();
	}
</script>
</head>
<body>
<form method="post">
<input type="hidden" name="proc" value="comlist"/>
<input type="hidden" name="category" value="all"/>
<input type="hidden" name="com_no" value="0"/>
<jsp:include page="../../main/top.jsp"/>
	<div class="menu-wrap">
		<div class="menu-2-wrap">
			<div class="menu-2">
				<ul>
					<li id="home">가정/사무용</li>
					<li id="game">게임용</li>
					<li id="multi">영상작업용</li>
					<li id="work">워크스테이션</li>
				</ul>
			</div>
		</div>
	</div>
<div id="market_wrap">
	<p id="market_title">조립컴퓨터</p>
	<ul id="market_list">
		<!-- 이중 forEach를 활용한 견적 호출 -->
		<c:forEach var="com" items="${clist}">
			<li class="com" onclick="javascript:go_detail('${com.com_no}')">
				<img src="image/Computer/${com.com_img}" class="com_img">
				<table class="com_intro" border>
					<tr><td class="com_title" colspan="2">${com.com_name}</td></tr>
					<c:forEach var="comdetail" items="${cdlist}">
					<c:if test="${com.com_no==comdetail.com_no}">
					<tr class="com_assem"><td>${comdetail.parts_mc}</td><td>${comdetail.parts_name}</td></tr>
					</c:if>
					</c:forEach>
					<tr class="com_assem"><td>가격</td><td style="text-align:right;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${com.com_price}" />원</td></tr>
				</table>
			</li>
		</c:forEach>
	</ul>
</div>
</form>
<jsp:include page="../../main/bottom.jsp"/>
	<%-- <c:forEach>
			
	</c:forEach> --%>
</body>
</html>