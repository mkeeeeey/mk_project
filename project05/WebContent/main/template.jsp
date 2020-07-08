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
<title></title>
<style>

body{margin:0; padding:0; overflow-x:hidden;}
a{text-decoration:none;}
ul{margin:0; padding:0;}
ul li{list-style:none;}
						
</style>
</head>
<body>

<!-- 공통 header -->
<jsp:include page="top.jsp"/>

<!-- 공통 footer -->
<jsp:include page="bottom.jsp"/>

<!--  mypage menubar -->
<jsp:include page="myPageTop.jsp"/>

<!-- admin header -->
<jsp:include page="admintop.jsp"/>

</body>
</html>