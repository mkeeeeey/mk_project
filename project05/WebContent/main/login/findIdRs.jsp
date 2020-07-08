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
<style type="text/css">
.all-wrap{margin:100px 0;}
.wrap{width:1080px; margin:0 auto; align:center;}
		table tr td,th{padding:5px 10px;}
		table{cursor:pointer;}
		.logo-text{font-family:sans-serif; font-size:60px; color:#F2B809; font-weight:bold;}
		img{width:150px; height:130px; margin-bottom:40px;}
.id-result{padding:100px 0; color:orange;}
.login-btn{width:445px; height:65px; font-size:20px; font-weight:800; 
		background-color:black; color:white; border:3px solid purple;
		cursor:pointer; margin-bottom:20px;}
		
		
</style>
<title>PC냥이:컴퓨터 맞춰보자냥</title>

<script src="${path}/a00_com/jquery-3.4.1.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
	$("#gomain").click(function(){
		$(location).attr("href","${path}/login");
	});
});
</script>
</head>
<body>

<jsp:include page="../../main/top.jsp"/>

<div class="all-wrap">
	<div class="wrap">
	<form method="post">
		<table align="center">
			<tr>
				<th colspan="3" class="logo-text">PC냥이</th>
			</tr>
			<tr>
				<th colspan="3"><img src="image/main/logo.png"></th>
			</tr>
			<tr><th colspan="3" style="font-size:30px; padding-bottom:30px;">아이디 찾기</th></tr>
			<tr>
				<th colspan="3" class="id-result">귀하의 아이디는 [<span>${fid}</span>] 입니다.</th>
			</tr>
			<tr>
				<th colspan="3"><input class="login-btn" id="gomain"  type="button" value="확인"/></th>
			</tr>
		</table>
	</form>
	</div>
</div>



<jsp:include page="../../main/bottom.jsp"/>

</body>
</html>