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
		
</script>
<link rel="stylesheet" href="${path }/css/shakeAndBounce.css" />

<script>
$(document).ready(function(){
	$('.main').addClass('bounce');
	setTimeout(()=>{
		$('.main').removeClass('bounce');
	},500);
})
</script>
</head>
<body>
	<div class="main">
	    <div class="container tim-container" style="max-width:1200px; padding-top:100px">
	       <form method="post" enctype="multipart/form-data" action="${path}/fileUpload.do">
		       	<input type="file" name="myfile" class="custom-file-input" id="file01"/>
		       	<button>업로드</button>
           </form>
	    </div>
	</div>
	<!-- end main -->
</body>
</html>