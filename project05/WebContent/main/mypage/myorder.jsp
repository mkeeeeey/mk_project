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
	.orderlist-cont{width:1080px; margin:50px auto; min-height:700px;}
	.order-list-table {text-align:center; margin:0 auto; border-top: 2px solid #000; border-bottom:1px solid #797979; border-spacing:0; 
    border-collapse:collapse; width:100%;}
    .order-list-table thead {display: table-header-group; vertical-align: middle; border-color:inherit;}
    .order-list-table thead tr th {text-align: center; padding: 0; height: 50px; font-size: 13px;}
    .order-list-table tbody {font-size: 12px;}
    .order-list-table tbody tr.first-tr td {border-top:1px solid #797979; padding-top: 15px;}
    .order-list-table tbody tr td {padding: 5px 0;}
    .date {padding-bottom: 15px;}
    .date a {text-align: left; cursor: pointer; font-size: 12px;}
    .ordernum-container {display: inline-block;}
    .order-date {font-weight: bold;}
    .product {text-align: left; padding-left: 10px; line-height: 30px;}
    .product-img {height: 60px; width: 60px; background-size: cover; background-position: center; background-repeat: no-repeat;}
    .product div {vertical-align: middle; display: inline-block;}
    .product-name {margin-left: 10px; max-width: 263px;}
    .product-name div {display: block; font-weight: bold;}
    .option {line-height: 1em; font-size: 11px; color: #797979; font-weight: normal;}
    .price{text-align:right; padding-right:20px !important;}
    .total-price {font-weight: bold; text-align:right; padding-right:20px !important;}
    .service {padding-bottom: 15px;font-size: 12px;}
    .line {text-decoration: underline;color: #353535;}
    
    .foreach{padding:20px 0;}

</style>
<script type="text/javascript" src="${path}/a00_com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){	
		
	});
	function go(ord_no){
		// 상세 처리를 위한 controller 호출
		$("[name=proc]").val("modetail");
		$("[name=ord_no]").val(ord_no);
		$("form").submit();
	}
	
</script>
</head>
<body>
	<jsp:include page="../top.jsp"/>
	
	<jsp:include page="../myPageTop.jsp"/>
	<div class="orderlist-cont">
		<h2>주문/배송조회</h2>
	<form method="post">
		<input type="hidden" name="proc"/>
		<input type="hidden" name="ord_no" />
		<table class="order-list-table">
			<colgroup>
				<col width="16%">
				<col width="auto">
				<col width="8%">
				<col width="10%">
				<col width="10%">
				<col width="16%">
			</colgroup>
			<thead class="table_head">
				<tr>
					<th class="number">날짜 및 주문번호</th>
					<th class="product">주문정보</th>
					<th class="quantity">수량</th>
					<th>총 상품금액</th>
					<th>총 주문금액</th>
					<th class="state">주문처리상태</th>
				</tr>
			</thead>
			<tbody id="list">
				<c:forEach var="olist" items="${olist}">
				<tr class="first-tr" ondblclick="go(${olist.ord_no})">
					<td class="date">
						<div class="ordernum-container">
							<div class="order-date">${olist.ord_date}</div>
							<div class="order-num">${olist.ord_no}</div>
						</div>
					</td>
					<td class="product">
					<c:forEach var="geto" items="${getolist}">
						<c:if test="${geto.ord_no==olist.ord_no}">
						<div class="product-img" style="background-image:url('image/parts/${geto.parts_img}')" ></div>
						<div class="product-name">
							<div class="main">${geto.parts_name}</div>
						</div>
						<br>
						</c:if>
					</c:forEach>
					</td>
					<td class="quantity">
						<c:forEach var="geto" items="${getolist}">
							<c:if test="${geto.ord_no==olist.ord_no}">
								<div class="foreach">${geto.req_cnt}</div></c:if>
						</c:forEach>
					</td>
					<td class="price">
						<c:forEach var="geto" items="${getolist}">
							<c:if test="${geto.ord_no==olist.ord_no}">
							<div class="foreach"><fmt:formatNumber type="number" value="${geto.req}"/> 원</div>
							</c:if>
						</c:forEach>
					</td>
					<td class="total-price"><fmt:formatNumber type="number" value="${olist.total}"/> 원</td>
					<td class="service">
						<div>${olist.ord_stat}</div>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>	
	</div>
	
	
	<jsp:include page="../bottom.jsp"/>
	
</body>
</html>