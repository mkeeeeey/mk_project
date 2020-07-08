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
<link rel="stylesheet" href="css/kb_W_user_StorePayDone.css">
<script>
		$(document).ready(function(){
			
		})
</script>
</head>
<body>
	<div class="main">
	    <div class="container tim-container" style="max-width:1200px; padding-top:100px">
	         <div id="Done_Div">
	            <div id="Done_Title">
	                	주문이 완료되었습니다.
	            </div>
	            <div id="Done_Btn_Div">
	                <Button id="Done_Btn" onclick="location.href='main.do'">홈으로 가기</Button>
	            </div>
        </div>
	        
	    </div>
	</div>
	<!-- end main -->
</body>
</html>