<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
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
a{text-decoration:none; color:black;}
ul{margin:0; padding:0;}
ul li{list-style:none;}

.all-wrap{}
/*상단 메뉴바 시작*/
	.menu-wrap{width:100%;}
		.menu-1{width:1280px; margin:0 auto; height:25px; padding:5px 0;
					border-right:1px solid #E4E1E1; border-left:1px solid #E4E1E1;}
			.menu-1 a{display:inline; margin:0 15px; float:right;}
		.menu-div{border-bottom:1px solid #E4E1E1;}
		.menu-2-wrap{background-color:#63145F;}
			.menu-2{width:1280px; margin:0 auto; padding:10px 0; text-align:center; color:white; font-weight:1px;
					border-right:1px solid #E4E1E1; border-left:1px solid #E4E1E1;}
				.menu-2 li{display:inline; font-size:25px; margin:0 65px; cursor: pointer;}
/*상단 메뉴바 끝*/


</style>
<!-- 서버 안에 jquery lib를 다운 받아서 설정 -->	
<script src="${path}/a00_com/jquery-3.4.1.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#member").click(function(){
		$("[name=proc").val("member");
		$("form").submit();
	});
	$("#mcomlist").click(function(){
		$("[name=proc]").val("mcomlist");
		$("form").submit();
	});
	$("#order").click(function(){
		$("[name=proc]").val("order");
		$("form").submit();
	});
	$("#as").click(function(){
		$("[name=proc]").val("mgr");
		$("form").submit();
	});
});
</script>
</head>
<body>
	
<!-- 상단 메뉴바 시작 -->
		<form method="post">
		<input type="hidden" name="proc"/>
		<div class="menu-wrap">
			<div class="menu-1">
				<a href="main">메인화면</a>
			</div>
			<div class="menu-div"></div>
			<div class="menu-2-wrap">
				<div class="menu-2">
				<span style="padding-left:25px;font-size:25px; float:left"><a href="main" style="color:orange;">PC냥이</a></span>
					<ul>
						<li id="member">회원관리</li>
						<li id="mcomlist">상품관리</li>
						<li id="order">주문관리</li>
						<li id="as">AS관리</li>
					</ul>
				</div>
			</div>
		</div>
		</form>
<!-- 상단 메뉴바 끝 -->

</body>
</html>