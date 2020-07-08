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
<title>Insert title here</title>

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
</style>

<link rel="stylesheet" 
	href="path/a00_com/a00_com.css">
<!-- 서버 안에 jquery lib를 다운 받아서 설정 -->	
<script src="${path}/a00_com/jquery-3.4.1.js" type="text/javascript"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%-- ${fn:length(plist)} : ${plist}의 크기 --%>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>
		$("h2").text("서비스센터");
			
	});

</script>
</head>
<body>

<jsp:include page="top.jsp"/>

<div class="all-wrap">
	<div class="wrap">

<!-- 게시판 목록 -->
	<select align="center">
		<option>공지사항</option>
		<option>문의사항</option>
		<option>상품후기</option>
		<option>AS신청</option>
	</select>
	
<!-- td, th 가로길이 조정 td,th추가 될때마다 같이추가 해주시면 됩니다. -->
<form>
	<table align="center">
		<colgroup>
			<col style="width:100px;"/>
			<col style="width:600px;"/>
			<col style="width:200px;"/>
			<col style="width:180px;"/>
		</colgroup>
		
<!-- 타이틀 -->
<!-- 필요한 타이틀만큼 추가해서 사용 -->
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
		</tr>
		
<!-- 글목록  -->	
<!-- 타이틀 추가된만큼 같이 추가 -->
		<table>
			<c:forEach var="prod" items="${plist}" varStatus="state">
					<!-- 1번부터 5번 글을 리스트화 하여 출력 -->
					<c:if  test="${state.count < 6}">	
						<tr>
							<th>${state.count} / ${fn:length(plist)}  순번 / 전체반복횟수</th>
							<td>제목이 출력되는곳</td>
							<td>작성자가 출력되는곳</td>
							<th>등록날짜</th>
						</tr>
						<!-- 
						<tr>
							<td><img src="${path}/image/parts/${prod.parts_img}" style="width:60px;"/></td>
							<td>${prod.parts_name}</td>
							<td><fmt:formatNumber pattern="###,###" value="${prod.parts_price}"/>원</td>
							<td>idx${state.index} : cnt${state.count}</td>
							<td>${fn:length(plist)}</td>
						</tr>
						 -->
					</c:if>
			</c:forEach>
	
<!-- 목록페이징 -->	
<!-- 목록 페이징 코드 먼저 짜시는분 계시면 공유부탁드립니다  -->
		<tr><td colspan="6">
				<!-- 1부터 5 까지 페이지 번호를 출력 -->
				<c:forEach var="a" begin="1" end="5" varStatus="status">
					${status.count}
				</c:forEach></td></tr>

		
<!-- 검색 + 글등록 -->
		<tr style="border:none;">
			<td colspan="3">
<!-- 검색은 필요하신분들 사용 -->
			<input class="input-box" type="text"/>
			<input class="search-btn" type="submit" value="검색"/>
			</td>		
<!-- 버튼 이름은 각자 필요에 맞게 수정  -->
			<th><input class="reg-btn" type="button" value="글쓰기"/></th>
		</tr>
	</table>
</form>
	</div>
</div>

<jsp:include page="bottom.jsp"/>

</body>
</html>