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
	.title{}
	.menu-wrap{}
		.menu-bar{border-bottom:1px solid black; padding-bottom:20px; font-size:25px;}
			.menu-bar a{padding-right:30px;}
			.menu-bar a:hover{color:orange;}
	.info-wrap{width:1000px; margin:40px auto;}
		table{aling:center; width:1000px;}
			table tr td,th {padding-top:12px;} 
			table input{width:300px; height:30px;}
			.sub-title{font-size:25px; width:160px; padding-bottom:10px;}
			.line{border-bottom:1px solid gray;}
			.modify-btn{height:40px; background-color:black; color:white; border-color:black; cursor:pointer;}
			.text-1{font-size:15px; color:gray;}
			.text-2{font-size:15px; color:gray;}
</style>


<!-- 서버 안에 jquery lib를 다운 받아서 설정 -->	
<script src="${path}/a00_com/jquery-3.4.1.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		// 삭제 버튼 클릭시.
		$("#delBtn").click(function(){		
			var mypw = "${mem.mem_pw}";
			if($("[name=mem_pw]").val() == mypw){
				alert("비밀번호 일치!");
				if( confirm("삭제하시겠습니까?") ){
					// 1. 삭제 proc 변경.
					$("[name=proc]").val("delete");
					// 2. submit처리
					$("form").submit();
				}
			}else{
				alert("비밀번호가 일치하지 않습니다.");
			}
		});	
	});
</script>
</head>
<body>

<jsp:include page="../../main/top.jsp"/>

<div class="all-wrap">

<jsp:include page="../../main/myPageTop.jsp"/>

	<div class="info-wrap">
	<form method="post">
		<input type="hidden" name="proc" value="update"/>
		<input type="hidden" name="mem_id" value="${mem.mem_id}"/>
		<table>
			<tr>
				<td class="sub-title">회원탈퇴</td>
			</tr>
			<tr>
				<td colspan="2" class="line"></td>
			</tr>
			<tr>
				<td class="text-1" colspan="2">
					<p style="font-size:25px; color:black;">그 동안 PC냥이를 이용해주셔서 감사합니다</p>
					고객님께서 회원 탈퇴를 원하신다니 저희 서비스가 많이 부족하고 미흡했나 봅니다.<br>
					불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다.</td>
			</tr>	
			<tr>
				<td colspan="2" class="line"></td>
			</tr>
			<tr>
				<td class="text-2" colspan="2">
					<p style="font-size:25px; color:black;">회원탈퇴 안내</p>
					• 회원 탈퇴 시 고객님의 정보는 상품 반품 및 A/S를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한 PC냥이 고객정보 보호정책에 따라 관리 됩니다.<br>
					• 탈퇴 시 보유하고있던 마일리지, 쿠폰은 모두 영구 삭제됩니다.<br>
					• 탈퇴 후 24시간 동안 기존에 사용하신 이메일과 휴대폰 번호로는 재가입이 불가능합니다.</td>
			</tr>
			<tr>
				<td colspan="2" class="line"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input name="mem_pw" type="password"/></td>
			</tr>
			<tr>
				<td colspan="2" class="line"></td>
			</tr>
			<tr>
				<th colspan="2"><input class="modify-btn" id="delBtn" type="button" value="확인"/></th>
			</tr>
			<tr>
				<td colspan="2" class="line"></td>
			</tr>
		</table>
	</form>
	</div>
</div>

<jsp:include page="../../main/bottom.jsp"/>

</body>
</html>