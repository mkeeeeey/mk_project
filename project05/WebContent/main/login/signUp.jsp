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
		.import{color:red; opacity:0.6; font-size:10px;}
.input-box{width:330px; height:40px; padding:5px;}
.reg-box{width:530px; height:70px; margin-top:20px; font-size:30px;
		background-color:black; color:white;
		border:3px solid purple;
		cursor:pointer;}
		
</style>
<title>PC냥이:컴퓨터 맞춰보자냥</title>

<script src="${path}/a00_com/jquery-3.4.1.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
 	var mem_id = "${param.mem_id}";
	var proc="${param.proc}"
 	var isMember = "${isMember}";
 	
 	// 아이디중복확인
 	if(proc ==  "regCkBtn"){
		if(isMember=="true"){ 
			alert("등록된 id입니다!");
			$("[name=mem_id]").focus();
		}else{
			alert("등록가능합니다.")
			$("[name=mem_id]").val(mem_id);
			$("[name=mem_id]").attr("readOnly",true);
		}
 	}
 	// 가입버튼 클릭 시 입력란 체크 
	$("#regCkBtn").click(function(){
		$("[name=proc]").val("regCkBtn")
		$("form").submit();
	});
	$("#regbtn").click(function(){
		if(isMember == "true" || isMember == ""){
			alert("아이디를 다시 입력해주세요");
		}else{
			var mem_pw = $("[name=mem_pw]").val();
			var ck_pw = $("[name=ck_pw]").val();
			if(mem_id != null && mem_pw != ck_pw){
				alert("비밀번호가 일치하지 않습니다.");
			}else{
				var mem_name = $("[name=mem_name]").val();
				var mem_email = $("[name=mem_email]").val();
				var mem_tel= $("[name=mem_tel]").val();
				var mem_birth = $("[name=mem_birth]").val();
				if(mem_name != null && mem_email != null && 
					mem_tel != null && mem_birth != null &&
			  		mem_name != "" && mem_email != "" && 
			  		mem_tel != "" && mem_birth != ""){
					alert("회원가입완료");
					$("[name=proc]").val("regbtn")
					$("form").submit();
				}else{
					alert("모두 입력해주세요");
				}
			}
		}
	});
	
	/* 
 	$("#regCkBtn").click(function(){
		var mem_id = "${param.mem_id}";
		if(mem_id!=""){
			var isMember = "${isMember}";
			if(isMember=="true"){
				alert("등록된 id입니다");
				$("[name=mem_id]").focus();
			}else{
				alert("등록가능합니다.")
				$("[name=mem_id]").val("mem_id");
				$("form").submit();
			}
		}
	}); */
});
</script>
</head>
<body>

<jsp:include page="../../main/top.jsp"/>

<div class="all-wrap">
	<div class="wrap">
	<form method="post">
		<input type="hidden" name="proc" value=""/>
		<table align="center">
			<tr>
				<th colspan="3" class="logo-text">PC냥이</th>
			</tr>
			<tr>
				<th colspan="3"><img src="image/main/logo.png"></th>
			</tr>
			<tr><th colspan="3" style="font-size:30px; padding-bottom:30px;">회원가입</th></tr>
			<tr>
				<td>아이디<span class="import">*필수입력</span></td>
				<td><input type="text" name="mem_id" class="input-box" placeholder="아이디" /></td>
			</tr>
			
			<tr>
				<td></td><td><input type="button" value="중복확인" id="regCkBtn"/></td>
			</tr>
						
			<tr>
				<td>비밀번호<span class="import">*필수입력</span></td>
				<td><input type="password" name="mem_pw" class="input-box" placeholder="비밀번호" /></td>
			</tr>
			<tr>
				<td>비밀번호 재입력<span class="import">*필수입력</span></td>
				<td><input type="password" name="ck_pw" class="input-box" placeholder="비밀번호 재입력" /></td>
			</tr>

			<tr>
				<td>이름<span class="import">*필수입력</span></td>
				<td><input type="text" name="mem_name" class="input-box" placeholder="이름" /></td>
			</tr>
			<tr>
				<td>생년월일<span class="import">*필수입력</span></td>
				<td><input type="date" name="mem_birth" class="input-box" placeholder="'-'제외 6자리(ex:901102)" 
				value="1990/01/01"/></td>
			</tr>
			<tr>
				<td>이메일<span class="import">*필수입력</span></td>
				<td><input type="text" name="mem_email" class="input-box" placeholder="이메일" /></td>
			</tr>
			<tr>
				<td>휴대폰<span class="import">*필수입력</span></td>
				<td><input type="text" name="mem_tel" class="input-box" placeholder="'-'제외 11자리" /></td>
			</tr>
			<tr>
				<th colspan="2"><input type="button" id="regbtn" class="reg-box" value="가입하기"/></th>
			</tr>
			
		</table>
	</form>
	</div>
</div>



<jsp:include page="../../main/bottom.jsp"/>

</body>
</html>