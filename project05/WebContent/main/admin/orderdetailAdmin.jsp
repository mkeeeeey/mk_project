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
	.mgr-table{width:100%; border-collapse:collapse; cursor:pointer; border-bottom:2px solid black;}
	.mgr-table thead{visibility:visible; border-top:3px solid black; border-bottom:3px solid black;}
	.mgr-table tr{border-top:1px solid gray;}
	table tr td,th {padding:10px 10px;}
	.detail-table{width:100%; margin:50px 0; border-collapse:collapse; cursor:pointer;}
	.input-wrap{width:220px;padding:7px 10px 9px;border:1px solid #dfdfdf;display:inline-block;vertical-align:middle;position:relative; text-align:center;}
	.input{width:100%;color:#3d4248;background:none; border:0;}
	.parcel{width:100px !important;}

/* 버튼 */
	.pay-btn{width:1050px; margin:20px auto 50px; text-align:center;}
	.btn{background:#63145F; color:#fff; border:none; position:relative; height:60px; font-size:1.5em; padding:0 2em; cursor:pointer;
	transition:800ms ease all; outline:none;}
	.btn:hover{background:#fff; color:#63145F;}
	.btn:before,.btn:after{content:''; position:absolute; top:0; right:0; height:2px; width:0; background: #63145F; transition:400ms ease all;}
	.btn:after{right:inherit; top:inherit; left:0; bottom:0;}
	.btn:hover:before,.btn:hover:after{width:100%; transition:800ms ease all;}
	
</style>
<script src="${path}/a00_com/jquery-3.4.1.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>
		$("h2").text("주문/배송관리");
		
		$("#edit").click(function(){
			$("[name=proc]").val("uptord");
			var ord_no = Number($("#ord_no").text());
			$("[name=ord_no]").val(ord_no);
			console.log(ord_no);
			$("form").submit();
		});
		$("#ord_no").text($("[name=ord_no]").eq(0).val());
		$("#ord_date").text($("[name=ord_date]").eq(0).val());
		$("#mem_name").text($("[name=mem_name]").eq(0).val());
		$("#ord_stat").text($("[name=ord_stat]").eq(0).val());
		
		$("#ord_invoice").val($("[name=ord_invoice]").eq(0).val());
		
		$("#ord_name").text($("[name=ord_name]").eq(0).val());
		$("#ord_post").text("("+$("[name=ord_post]").eq(0).val()+")");
		$("#ord_addr").text($("[name=ord_addr1]").eq(0).val()+" "+$("[name=ord_addr2]").eq(0).val());
		$("#ord_tel").text($("[name=ord_tel]").eq(0).val());
		$("#ord_req").text($("[name=ord_req]").eq(0).val());
		
		$("#pay_method").text($("[name=pay_method]").eq(0).val());
		var totalS = Number($("[name=total]").eq(0).val());
		$("#total").text(totalS.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+" 원");
		var paypoint = Number($("[name=pay_point]").eq(0).val());
		$("#pay_point").text(paypoint.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+" 원");
		var payprice = Number($("[name=pay_price]").eq(0).val());
		$("#pay_price").text(payprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+" 원");
	});
</script>
</head>
<body>
	<jsp:include page="../../main/admintop.jsp"/>
	
	<div class="mgr-wrap">
		<header>
			<h2></h2>
		</header>
	<form method="post" >
	<input type="hidden" name="proc" />
		<table class="detail-table" border>
			<colgroup>
				<col width="15%">
				<col width="35%">
				<col width="15%">
				<col width="35%">
			</colgroup>
			<tr>
				<th>주문번호</th><td id="ord_no"></td><th>주문일</th><td id="ord_date"></td>
			</tr>
			<tr>
				<th>주문자</th><td id="mem_name"></td><th>결제금액</th><td id="pay_price" style="text-align:right;padding-right:270px;"></td>
			</tr>
			<tr>
				<th>배송지</th>
				<td colspan="3" >
					<span id="ord_name"></span> / <span id="ord_tel"></span><br>
					<span id="ord_post"></span> <span id="ord_addr"></span>
				</td>
			</tr>
			<tr>
				<th>요청사항</th>
				<td colspan="3" id="ord_req"></td>
			</tr>
			<tr>
				<th>운송장등록</th>
				<td colspan="3">
					<span class="input-wrap parcel">
						<input class="input" type="text" name="" value="CJ대한통운" readonly="readonly"/>
					</span>
					<span class="input-wrap">
						<input class="input" type="text" name="ord_invoice" id="ord_invoice" value=""/>
					</span>
				</td>
			</tr>
		</table>
		
		<table class="detail-table" border>
			<colgroup>
				<col width="auto">
				<col width="20%">
				<col width="10%">
			</colgroup>
			<tr>
				<th>상품명</th><th>상품금액</th><th>수량</th>
			</tr>
			<c:forEach var="geto" items="${getord}">
				<input type="hidden" name="ord_no" value="${geto.ord_no}"/>
				<input type="hidden" name="ord_date" value="${geto.ord_date}"/>
				<input type="hidden" name="mem_name" value="${geto.mem_name}"/>
				<input type="hidden" name="ord_stat" value="${geto.ord_stat}"/>
				<input type="hidden" name="ord_invoice" value="${geto.ord_invoice}"/>
				<input type="hidden" name="ord_name" value="${geto.ord_name}"/>
				<input type="hidden" name="ord_post" value="${geto.ord_post}"/>
				<input type="hidden" name="ord_addr1" value="${geto.ord_addr1}"/>
				<input type="hidden" name="ord_addr2" value="${geto.ord_addr1}"/>
				<input type="hidden" name="ord_tel" value="${geto.ord_tel}"/>
				<input type="hidden" name="ord_req" value="${geto.ord_req}"/>
				<input type="hidden" name="pay_method" value="${geto.pay_method}"/>
				<input type="hidden" name="total" value="${geto.total}"/>
				<input type="hidden" name="pay_point" value="${geto.pay_point}"/>
				<input type="hidden" name="pay_price" value="${geto.pay_price}"/>
			<tr>
				<td>${geto.parts_name}</td>
				<td style="text-align:right;padding-right:20px;"><fmt:formatNumber type="number" value="${geto.parts_price}"/> 원</td>
				<td style="text-align:center;">${geto.req_cnt}</td>
			</tr>
			</c:forEach>
		</table>
		</form>	
		<div class="pay-btn">
			<input class="btn" type="button" id="edit" value="수정/확인"/>
		</div>
	</div>
	

</body>
</html>