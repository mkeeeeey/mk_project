<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
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
<style type="text/css">
.all-wrap{width:1280px; margin:0 auto;}
	.menu-bar{border-bottom:1px solid black; padding-bottom:20px; font-size:25px;}
			.menu-bar span{padding-right:30px;}
			.menu-bar span:hover{color:orange;}
	.info-wrap{width:1000px; margin:40px auto;}
</style>
<script src="${path}/a00_com/jquery-3.4.1.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#myinfo").click(function(){
			$("[name=proc]").val("userInfo");
			$("form").submit();
		});
		$("#mypt").click(function(){
			$("[name=proc]").val("mypt");
			$("form").submit();
		});
		$("#myorder").click(function(){
			$("[name=proc]").val("myorder");
			$("form").submit();
		});
	});
</script>
</head>
<body>

<div class="all-wrap">
	<div class="title"><h1>마이페이지</h1></div>
	<div class="menu-wrap">
		<form method="post">
		<input type="hidden" name="proc"/>
		<div class="menu-bar">
			<span id="myinfo">내정보관리</span><span id="mypt">포인트</span><span id="myorder">주문/배송조회</span>
		</div>
		</form>
	</div>
</div>

</body>
</html>