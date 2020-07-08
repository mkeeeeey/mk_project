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

<style type="text/css">
.all-wrap{margin-top:100px; margin-bottom:200px;}
.wrap{width:1080px; margin:0 auto;}
          table{border-collapse:collapse; cursor:pointer; border-bottom:3px solid black;}
          table tr{border-top:1px solid gray;}
          table tr:first-child{visibility:visible; border-top:3px solid black; border-bottom:3px solid black;}
          table tr td,th {padding:10px 10px;}
          select{width:160px; height:40px; outline:none; margin-bottom:20px; font-size:20px;} 
          
          .input-box{width:250px; height:45px; outline:none; padding:0; margin:0; cursor:pointer;}
          .search-btn{width:80px; height:40px; background-color:black; color:white; border:1px solid black; font-size:20px;
          outline:none; padding:0; margin:0; cursor:pointer;}
          .reg-btn{width:80px; height:40px; background-color:black; color:white; border:1px solid black; font-size:20px;
          outline:none; padding:0; margin:0; cursor:pointer;}
          .modify-btn{width:100px; height:40px; float:right; background-color:purple; color:white; border:0px; cursor:pointer;}
          .btn{width:80px; height:40px; background-color:#63145F; color:white; border:1px solid black; font-size:20px;
</style>

<link rel="stylesheet" 
	href="path/a00_com/a00_com.css">
<!-- 서버 안에 jquery lib를 다운 받아서 설정 -->	
<script src="${path}/a00_com/jquery-3.4.1.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	
});
 function go(parts_no){
	 $("[name=parts_no]").val(parts_no);
	 $("[name=proc]").val("mpartsdetail");
	 $("form").submit();
 }

</script>
</head>
<body>

<jsp:include page="../../main/admintop.jsp"/>

<div class="all-wrap">
	<div class="wrap">
	<h1>상품관리 - 부품</h1>
	<!-- 게시판 목록 -->
	<form method="post">
	<select name="proc">
		<option value="mcomlist" >컴퓨터</option>
		<option value="mpartslist" selected>부품</option>
	</select>
	<input class="btn" type="submit" value="이동" />	
	<input type="hidden" name="proc"/>
	<input type="hidden" name="parts_no"/>
	<table align="center">
				<colgroup>
					<col style="width:60%;"/>
					<col style="width:15%;"/>
					<col style="width:15%;"/>
					<col style="width:10%;"/>
				</colgroup>
				
			<!-- 타이틀 -->
				<tr>
					<th>상품명</th>
					<th>상품분류</th>
					<th>가격</th>
					<th>상세보기</th>
				</tr>
			
		<!-- 글목록  -->	
			<c:forEach var="parts" items="${plist}">
				<tr>
					<td style="padding-left:20px;" >${parts.parts_name}</td>	
					<td style="padding-left:40px;">${parts.parts_mc}</td>
					<td style="padding-left:40px; padding-right:20px; text-align:right;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${parts.parts_price}" />원</td>
					<!--  문자열일때와 숫자일때 '' 사용 주의  -->
					<td style="padding-left:20px;" ondblclick="javascript:go('${parts.parts_no}')">상세보기</td>
				</tr>
			</c:forEach>
				<tr>
					<td colspan="4"><input class="modify-btn" id="insParts" type="button" value="등록"/>
					</td>
				</tr>
	</table>
	</form>
	</div>
</div>


</body>
</html>