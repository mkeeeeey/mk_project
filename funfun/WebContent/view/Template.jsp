<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<%@ include file="/template/header.jsp" %>
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
</script>
</head>
<body>
	<div class="main">
	    <div class="container tim-container" style="max-width:800px; padding-top:100px">
	        <h1 class="text-primary">여기에작성해주시면됩니다.</h1>
	        <h1>여기에작성해주시면됩니다.</h1>
	        <h1>여기에작성해주시면됩니다.</h1>
	        <h1>여기에작성해주시면됩니다.</h1>
	        <h1>여기에작성해주시면됩니다.</h1>
	        <h1>여기에작성해주시면됩니다.</h1>
	        
	    </div>
	</div>
	<!-- end main -->
</body>
</html>