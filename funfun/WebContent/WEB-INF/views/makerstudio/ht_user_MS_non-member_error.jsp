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
</script>
</head>
<body>
	<div class="main">
	    <div class="container tim-container" style="max-width:1200px; padding-top:100px">

	<div class="row">
  	<div class="col-sm-4" style="background-color:yellow">.col-sm-4</div>
  	<div class="col-sm-8" style="background-color:blue">.col-sm-8</div>
	</div>

	<script>
	if(confirm("로그인이 필요한 서비스입니다. \n로그인 페이지로 이동 하시겠습니까?")){
		console.log("이거 찍힘???");
		$(location).attr("href", "${path}/login.do")
	} else {
		$(location).attr("href", "${path}/main.do")
	}
	
	

	</script>



	    </div>
	</div>
	<!-- end main -->
</body>
</html>