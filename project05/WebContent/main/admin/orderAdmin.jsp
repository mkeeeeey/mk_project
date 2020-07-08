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
	.mgr-wrap{width:1080px; margin:20px auto;}
	.mgr-table{width:100%; border-collapse:collapse; cursor:pointer; border-bottom:3px solid black;}
	.mgr-table thead{visibility:visible; border-top:3px solid black; border-bottom:3px solid black;}
	.mgr-table tr{border-top:1px solid gray;}
	table tr td,th {padding:10px 10px;}
 .product {text-align: left; padding-left: 10px; line-height: 30px;}
    .product-img {height: 60px; width: 60px; background-size: cover; background-position: center; background-repeat: no-repeat;}
    .product div {vertical-align: middle; display: inline-block;}
    .product-name {margin-left: 10px; max-width: 263px;}
    .product-name div {display: block; font-weight: bold;}
	
</style>
<script src="${path}/a00_com/jquery-3.4.1.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>
		$("h2").text("주문/배송관리");
	});
	function go(ord_no){
		// 상세 처리를 위한 controller 호출
		$("[name=proc]").val("orderdetail");
		$("[name=ord_no]").val(ord_no);
		$("form").submit();
	}
</script>
</head>
<body>
	<jsp:include page="../../main/admintop.jsp"/>
	
	<div class="mgr-wrap">
		<header>
			<h2></h2>
		</header>
	<form method="post">
		<input type="hidden" name="proc"/>
		<input type="hidden" name="ord_no" />
		<table class="mgr-table">
			<colgroup>
				<col width="12%">
				<col width="12%">
				<col width="auto">
				<col width="12%">
				<col width="12%">
				<col width="12%">
			</colgroup>
			<thead>
				<tr>
					<th>주문번호</th><th>주문날짜</th><th>상품명</th><th>결제금액</th><th>주문상태</th><th>배송</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="order" items="${getorders}">
				<tr ondblclick="go(${order.ord_no})">
					<td>${order.ord_no}</td><td>${order.ord_date}</td>
					<td>
					<c:forEach var="olist" items="${orderslist}">
						<c:if test="${olist.ord_no==order.ord_no}">
							<span><img class="product-img" src="image/parts/${olist.parts_img}"/></span>
							<span class="product-name">
								<span style="padding-bottom:60px; font-weight:bold;">${olist.parts_name}</span>
							</span>
							<br>
						</c:if>
					</c:forEach>
					</td>
					<td style="text-align:right;padding-right:20px;"><fmt:formatNumber type="number" value="${order.total}"/> 원</td>
					<td style="text-align:center;">${order.ord_stat}</td><td style="text-align:center;">${order.ord_invoice}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		</form> 
	</div>
	

</body>
</html>