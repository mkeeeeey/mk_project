<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/template/header.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
		$(document).ready(function(){
			$('h1').text('header파일에 부트스트랩 제이쿼리 템플릿 css, js가 모두 포함되어 있습니다. 따로 추가 안하셔도 됩니다.');
			
		})
		function goMS(){
			$(location).attr("href", "${path}/MakerStudio.do?method=myProject")
		}
</script>
</head>
<body>

	<div class="main">
	    <div class="container tim-container" style="max-width:1200px; padding-top:100px">

	<h2>${makerInfo.maker_name}님, 반갑습니다</h2>
	
	<br><br><br><br>
	
	<h4>시작해 볼까요?</h4>

	<br><br><br><br>
	
	<button class="btn btn-warning btn_custom" style="width:40%;" onclick="javascript:goMS()">시작하기</button>
	
	
	        
	    </div>
	</div>
	<!-- end main -->
</body>
</html>