<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, z01_vo.* "
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<%--

--%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/a00_com.css" >
<script src="${path}/a00_com/jquery-3.4.1.js" type="text/javascript"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%-- ${fn:length(plist)} : ${plist}의 크기 --%>
<%
ArrayList<Cart> plist = new ArrayList<Cart>();

if(session.getAttribute("plist")==null){
plist.add(new Cart(1,28000));
plist.add(new Cart(2,25000));
plist.add(new Cart(3,27000));
plist.add(new Cart(4,27000));
plist.add(new Cart(5,27000));
plist.add(new Cart(6,27000));
plist.add(new Cart(7,27000));
session.setAttribute("plist", plist);
}
plist = (ArrayList<Cart>)session.getAttribute("plist");
plist.remove(1);

%>


<script type="text/javascript">
	$(document).ready(function(){
		var tot = 0;
		
		// session으로 가져온 값의 합계와 정규식으로 천단위 콤마 작성.
		for(var idx=0; idx < ${fn:length(plist)}; idx++ ){
			var ageS = $("span").eq(idx).text();
			var age = Number(ageS);
			tot += age;
			$("span").eq(idx).text(ageS.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","))
			console.log(age);
		}
		
		console.log("tot"+tot);
		$("h3").text(tot.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"개");
	});
</script>
</head>

<body>
<h2 align="center"></h2>
	<c:forEach var="p" items="${plist}" varStatus="status">
		<h4>p(${status.count}):${p.req_no}-<span>${p.req_cnt}</span>개</h4>
	</c:forEach>
	<h3></h3>
</body>
</html>