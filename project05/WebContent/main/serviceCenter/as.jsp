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
    .ordL{text-align:left;}
    .ordR{text-align:right;}      
          
	table{border-collapse:collapse; cursor:pointer; border-bottom:3px solid black; width:100%; margin:0 auto;}
	table tr{border-top:1px solid gray;}
	table tr:first-child{visibility:visible; border-top:3px solid black; border-bottom:3px solid black;}
	table tr td,th {padding:10px 10px; text-align:center;} 
	
	select{width:160px; height:40px; outline:none; margin-bottom:20px; font-size:20px;}
	.input-box{width:250px; height:45px; outline:none; padding:0; margin:0; cursor:pointer;}
	.btn{width:80px; height:40px; background-color:#63145F; color:white; border:1px solid black; font-size:20px;
	outline:none; padding:0; margin:0; cursor:pointer;}
          
</style>

<script src="${path}/a00_com/jquery-3.4.1.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var proc = "${param.proc}";
		if(proc=="notice"){
			location.href="${path}/as";
		}
		if(proc=="question"){
			location.href="${path}/as";
		}
		if(proc=="review"){
			location.href="${path}/as";
		}
		if(proc=="as"){
			$("h1").append(" - AS목록");
		}
		
		$(".ins-btn").click(function(){
			var mem_id = "${mem.mem_id}";
			if(mem_id == ""){
				alert("로그인이 필요합니다.");
				location.href="${path}/login";
			}else{
				$("[name=proc]").val("insAs");
				$("[name=mem_id]").val(mem_id);
				$("form").submit();	
			}
		});
		
		
	});
	
	function goAs(as_no){
		$("[name=proc]").val("goAs");
		$("[name=as_no]").val(as_no);
		$("form").submit();
	}
	
	
</script>
</head>
<body>

<jsp:include page="../../main/top.jsp"/>

<div class="all-wrap">
	<div class="wrap">
	<h1>고객센터</h1>
	<!-- 게시판 목록 -->
	<form method="post">
		<select align="center" name="proc">
			<option value="notice">공지사항</option>
			<option value="question">문의사항</option>
			<option value="review">상품후기</option>
			<option value="as" selected>AS목록</option>
		</select>
		<input class="btn" type="submit" value="이동" />
		<input type="hidden" name="proc" />
	    <input type="hidden" name="as_no" />
	    <input type="hidden" name="mem_id" />
		<table align="center">
			<colgroup>
				<col style="width:10%;"/>
				<col style="width:15%;"/>
				<col style="width:45%"/>
				<col style="width:20%;"/>
				<col style="width:20%;"/>
			</colgroup>
			
		<!-- 타이틀 -->
			<tr>
				<th>글번호</th>
				<th>분류</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
			</tr>
		
		<!-- 글목록  -->	
			<c:forEach var="as" items="${asList}" >
				<tr onclick="goAs(${as.as_no})">
					<td>${as.as_no}</td>
					<td>${as.as_cate}</td>
					<td class="ordL">${as.as_cate} 관련 문의드립니다</td>
					<td>${as.mem_id}</td>
					<td>${as.as_date}</td>
				</tr>
			</c:forEach>
		
			<tr><th colspan="5"></th></tr>
		<!-- 검색 + 글등록 -->
			<tr style="border:none;">
				<th colspan="5" class="ordR">
					<input class="btn ins-btn" type="button" value="글쓰기"></th>
			</tr>
		</table>
	</form>
	</div>
</div>

<jsp:include page="../../main/bottom.jsp"/>

</body>
</html>