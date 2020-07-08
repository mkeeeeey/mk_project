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
// 로그인 성공 여부 확인
$(document).ready(function(){
	var mem_id = "${mem.mem_id}";
	var proc = "${param.proc}";
	if(proc=='login'){
		if(mem_id!=""){
			alert("로그인 성공");
			$(location).attr("href","main")
		}else{
			alert("로그인 실패");
		}
	}
	// 아이디찾기 이동
	$("[name=findId]").click(function(){
		$("[name=proc]").val("findID");
		$("form").submit();
	});
	// 비밀번호찾기 이동
	$("[name=findPS]").click(function(){
		$("[name=proc]").val("findPS");
		$("form").submit();
	});
	// 회원가입 이동
	$("[name=signUp]").click(function(){
		$("[name=proc]").val("signUp");
		$("form").submit();
	});
});
</script>
</head>
<body>

<jsp:include page="../../main/top.jsp"/>

<div class="all-wrap">
	<div class="wrap">
	<form method="post">
		<input type="hidden" name="proc" value="login"/>
	<table align="center">
			<tr>
				<th colspan="3" class="logo-text">PC냥이</th>
			</tr>
			<tr>
				<th colspan="3"><img src="image/main/logo.png"></th>
			</tr>
			<tr><th colspan="3" style="font-size:30px; padding-bottom:30px;">로그인</th></tr>
			<tr>
				<th colspan="3"><input class="input-id" type="text" name="mem_id" placeholder="아이디"/></th>
			</tr>
			<tr>
				<th colspan="3"><input class="input-ps" type="password" name="mem_pw" placeholder="비밀번호"/></th>
			</tr>
			<tr>
				<th colspan="3"><input class="login-btn" type="submit" value="로그인"/></th>
			</tr>
			<tr>
				<th name="findId">아이디 찾기</th>
				<th name="findPS">비밀번호 찾기</th>
				<th name="signUp">회원가입</th>
			</tr>
	</table>
	</form>
	</div>
</div>

<jsp:include page="../../main/bottom.jsp"/>

</body>
</html>