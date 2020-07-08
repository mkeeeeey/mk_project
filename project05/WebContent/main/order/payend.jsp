<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.* "%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="UTF-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PC냥이:컴퓨터 맞춰보자냥</title>
<style type="text/css">
	section{min-height:800px;}
	.payend{margin:20px auto; text-align:center; width:1080px; padding-top:250px; font-size:30px; font-weight:700;}
	
</style>
<script type="text/javascript" src="${path}/a00_com/jquery-3.4.1.js"></script>

</head>
<body>
	<jsp:include page="../top.jsp"/>
	
	<section>
		<h2></h2>
		<div class="payend">
			구매가 완료되었습니다
		</div>
	</section>
	
		<jsp:include page="../bottom.jsp"/>
	
</body>
</html>