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
.input-id{width:420px; height:40px; font-size:15px; padding:10px;}
.input-ps{width:420px; height:40px; font-size:15px; padding:10px; margin-bottom:20px;}
.login-btn{width:445px; height:65px; font-size:20px; font-weight:800; 
		background-color:black; color:white; border:3px solid purple;
		cursor:pointer; margin-bottom:20px;}
		
</style>
<title>PC냥이:컴퓨터 맞춰보자냥</title>

<script src="${path}/a00_com/jquery-3.4.1.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	// 입력정보가 틀렸을 때
	var proc="${param.proc}"
	if(proc=="findBtn"){
		alert("입력하신 정보가 없습니다");
	}
	// 칮기 버튼 클릭 
	$("#findBtn").click(function(){
		var mem_name = $("[name=mem_name]").val();
		var mem_email= $("[name=mem_email]").val();

		if(mem_name != null && mem_email != null &&
			mem_name != "" && mem_email != ""){
			$("form").submit();
		}else{
			alert("다시 입력해주세요");
		}
	});
});
</script>
</head>
<body>

<jsp:include page="../../main/top.jsp"/>

<div class="all-wrap">
	<div class="wrap">
	<form method="post">
	<!-- name과 value의 역할 차이 -->
	<input type="hidden" name="proc" value="findBtn" />
		<table align="center">
			<tr>
				<th colspan="3" class="logo-text">PC냥이</th>
			</tr>
			<tr>
				<th colspan="3"><img src="image/main/logo.png"></th>
			</tr>
			<tr><th colspan="3" style="font-size:30px; padding-bottom:30px;">아이디 찾기</th></tr>
			<tr>
				<th colspan="3"><input name="mem_name" class="input-id" type="text" placeholder="이름"/></th>
			</tr>
			<tr>
				<th colspan="3"><input name="mem_email" class="input-ps" type="text" placeholder="이메일"/></th>
			</tr>
			<tr>
				<th colspan="3"><input class="login-btn" id="findBtn" type="button" value="확인"/></th>
			</tr>
		</table>
	</form>
	</div>
</div>



<jsp:include page="../../main/bottom.jsp"/>

</body>
</html>