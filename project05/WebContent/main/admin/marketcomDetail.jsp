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
			.drop-btn{width:100px; height:40px; background-color:black; 
					color:white; border-color:black; cursor:pointer; float:right;}
			.line{border-bottom:1px solid gray;}
			.modify-btn{width:100px; height:40px; float:right; background-color:purple; color:white; border:0px; cursor:pointer;}
				.modify-btn button{}
</style>


<!-- 서버 안에 jquery lib를 다운 받아서 설정 -->	
<script src="${path}/a00_com/jquery-3.4.1.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#delMem").click(function(){
			if(confirm("삭제 하시겠습니까?")){
				$("[name=proc]").val("delMem");
				$("form").submit();
			}
		});
		$("#golist").click(function(){
			$("[name=proc]").val("mcomlist");
			$("form").submit();
		});
	});
</script>
</head>
<body>

<jsp:include page="../../main/admintop.jsp"/>

<form method="post">

<div class="all-wrap">
	<input type="hidden" name="proc" />
	<div class="info-wrap">

		<table>
			<tr>
				<td class="sub-title">상품상세 정보</td>
			</tr>
			<tr>
				<td colspan="2" class="line"></td>
			</tr>
			<tr>
				<td>상품명</td>
				<td>${comd.com_name}</td>
			</tr>
			<tr>
				<td>상품용도</td>
				<td>${comd.com_kind}</td>
			</tr>
			<tr>
				<td>상품가격</td>
				<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${comd.com_price}" />원</td>
			</tr>
			<tr>
				<td>상품이미지</td>
				<td>${comd.com_img}</td>
			</tr>
			<tr>
				<td>상품상세</td>
				<td>${comd.com_detail}</td>
			</tr>
			<tr>
				<td colspan="2" class="line"></td>
			</tr>
			<tr>
				<td colspan="2"  class="sub-title">견적</td>
			</tr>
			<c:forEach var="comdetail" items="${cdlist}">
			<tr>
				<td>${comdetail.parts_mc}</td>
				<td>${comdetail.parts_name} ${comdetail.parts_cnt}개</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="2" class="line"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input style="margin-left:20px;" id="golist" class="modify-btn" type="button" value="이전"/>
					<input style="margin-left:20px;"  class="modify-btn" id="delCom" type="button" value="삭제"/>
					<input class="modify-btn" id="uptCom" type="button" value="수정"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="line"></td>
			</tr>
		</table>
	</div>
</div>
</form>


</body>
</html>