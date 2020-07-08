<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
          .btn{width:80px; height:40px; background-color:#63145F; color:white; border:1px solid black; font-size:20px;
	outline:none; padding:0; margin:0; cursor:pointer; align:right}
</style>

<script src="${path}/a00_com/jquery-3.4.1.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#writeQue").click(function(){
			var mem_id = "${mem.mem_id}";
			
			if(mem_id==""){
				alert('로그인이 필요합니다.');
				$(location).attr("href","${path}/login");		
			}else{
				$("[name=proc]").val("writeQue");
				$("form").submit();	
			}
			
		});
		
	});
	function go(que_no){
		$("[name=que_no]").val(que_no);
		$("[name=proc]").val("queDetail");
		$("form").submit();
	}
	
</script>
</head>
<body>

<jsp:include page="../../main/top.jsp"/>

<div class="all-wrap">
	<div class="wrap">
	<h1>고객센터 - 문의사항</h1>
	<!-- 게시판 목록 -->
	<form method="post">
	<select name="proc">
		<option value="notice" >공지사항</option>
		<option value="question" selected>문의사항</option>
		<option value="review">상품후기</option>
		<option value="as">AS목록</option>
	</select>
	<input class="btn" type="submit" value="이동" />
	<input type="hidden" name="proc" />
	<input type="hidden" name="que_no" />
	<table align="center">
		<colgroup>
			<col style="width:100px;"/>
			<col style="width:600px;"/>
			<col style="width:200px;"/>
			<col style="width:180px;"/>
		</colgroup>
		
	<!-- 타이틀 -->
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
		</tr>
		
	<!-- 글목록  -->	
	<c:forEach var="question" items="${qlist}" varStatus="status">
		<tr onclick="javascript:go(${question.que_no})">
			<td align="center">${fn:length(qlist) - status.index}</td>
			<td>${question.que_name}</td>
			<td align="center">${question.mem_id}</td>
			<td align="center">${question.que_date}</td>
		</tr>
	</c:forEach>

	<!-- 목록페이징 -->	
		<tr>
			<th colspan="4"> 1 </th>
		</tr>	
		
	<!-- 검색 + 글등록 -->
	
		<tr style="border:none;">
			<td colspan="3">
			</td>
			<th style="text-align:right;">
			<%-- <c:if test="${mem.mem_id == 'admin'}"> --%>
			<input id="writeQue" class="btn" type="button" value="글쓰기"/>
			<%-- </c:if> --%></th>
		</tr>
	</table>
	</form>
	</div>
</div>

<jsp:include page="../../main/bottom.jsp"/>

</body>
</html>