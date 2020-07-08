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
	.orderlist-cont{width:1080px; margin:0px auto; min-height:700px;}
	.order-area{width:1080px; margin:20px auto;}
	fieldset{border:2px solid #63145F;}
	legend{padding:5px 10px; font-weight:700; font-size:1.2em;}
	.order-info-table{width:100%; margin:20px auto;}
	.order-info-span{display:inline-block;}
	.shipment{width:730px;}
	.payment{width:340px;}
	
	
	.order-list-table {text-align:center; margin:0 auto; border-top: 2px solid #000; border-bottom:1px solid #797979; border-spacing:0; 
    border-collapse:collapse; width:100%;}
    .order-list-table thead {display: table-header-group; vertical-align: middle; border-color:inherit;}
    .order-list-table thead tr th {text-align: center; padding: 0; height: 50px; font-size: 13px;}
    .order-list-table tbody {font-size: 12px;}
    .order-list-table tbody tr.first-tr td { padding-top: 15px;}
    .order-list-table tbody tr td {padding: 5px 0;border-top:1px solid #797979;}
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
    .price{text-align:right; padding-right:20px;}
    .total-price {font-weight: bold; text-align:right; padding-right:20px;}
    .service {padding-bottom: 15px;font-size: 12px;}
    .line {text-decoration: underline;color: #353535;}
    .fmtnum{text-align:right;}
/* 버튼 */
	.list-btn{width:1050px; margin:20px auto 50px; text-align:center;}
	.btn{background:#63145F; color:#fff; border:none; position:relative; height:60px; font-size:1.5em; padding:0 2em; cursor:pointer;
	transition:800ms ease all; outline:none;}
	.btn:hover{background:#fff; color:#63145F;}
	.btn:before,.btn:after{content:''; position:absolute; top:0; right:0; height:2px; width:0; background: #63145F; transition:400ms ease all;}
	.btn:after{right:inherit; top:inherit; left:0; bottom:0;}
	.btn:hover:before,.btn:hover:after{width:100%; transition:800ms ease all;}
	

</style>
<script type="text/javascript" src="${path}/a00_com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){		
		$("h2").text("");
		$("#no").text($("[name=ord_no]").eq(0).val());
		$("#date").text($("[name=ord_date]").eq(0).val());
		$("#mem_name").text($("[name=mem_name]").eq(0).val());
		$("#stat").text($("[name=ord_stat]").eq(0).val());
		
		$("#ord_invoice").text($("[name=ord_invoice]").eq(0).val());
		
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
		var pt = payprice*0.01;
		var ptS = pt+((pt%1>0.5)?(1-(pt%1))%1:-(pt%1));
		$("#pluspoint").text(ptS.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+" 원");

	});
</script>
</head>
<body>
	<jsp:include page="../top.jsp"/>
	<jsp:include page="../myPageTop.jsp"/>
	<h2></h2>
	
	<div class="orderlist-cont">
	<form method="post">
		<input type="hidden" name="proc" />
		<div class="order-area">
			<fieldset>
				<legend>주문 정보</legend>
				<table class="order-info-table">
					<colgroup>
						<col width="15%">
						<col width="35%">
						<col width="15%">
						<col width="35%">
					</colgroup>
					<tbody>
						<tr>
							<th>주문번호</th>
							<td id="no"></td>
							<th>주문일자</th>
							<td id="date"></td>
						</tr>
						<tr>
							<th>주문자</th>
							<td id="mem_name"></td>
							<th>주문처리상태</th>
							<td id="stat"></td>
						</tr>
					</tbody>
				</table>
			</fieldset>		
		</div>
		
		<div class="order-area">
			<legend>주문 상품 정보</legend>
			<table class="order-list-table">
				<colgroup>
					<col width="auto">
					<col width="15%">
					<col width="5%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th class="product">상품정보</th>
						<th class="sell">판매가</th>
						<th class="quantity">수량</th>
						<th class="state">총 금액</th>							
					</tr>
				</thead>
				<tbody>
				<c:forEach var="myo" items="${myolist}">
				<input type="hidden" name="ord_no" value="${myo.ord_no}"/>
				<input type="hidden" name="ord_date" value="${myo.ord_date}"/>
				<input type="hidden" name="mem_name" value="${myo.mem_name}"/>
				<input type="hidden" name="ord_stat" value="${myo.ord_stat}"/>
				<input type="hidden" name="ord_invoice" value="${myo.ord_invoice}"/>
				<c:set var="invoice" value="${myo.ord_invoice}"/>
				<input type="hidden" name="ord_name" value="${myo.ord_name}"/>
				<input type="hidden" name="ord_post" value="${myo.ord_post}"/>
				<input type="hidden" name="ord_addr1" value="${myo.ord_addr1}"/>
				<input type="hidden" name="ord_addr2" value="${myo.ord_addr1}"/>
				<input type="hidden" name="ord_tel" value="${myo.ord_tel}"/>
				<input type="hidden" name="ord_req" value="${myo.ord_req}"/>
				<input type="hidden" name="pay_method" value="${myo.pay_method}"/>
				<input type="hidden" name="total" value="${myo.total}"/>
				<input type="hidden" name="pay_point" value="${myo.pay_point}"/>
				<input type="hidden" name="pay_price" value="${myo.pay_price}"/>
					<tr>
						<td class="product">
							<span><img class="product-img" src="image/parts/${myo.parts_img}"/></span>
							<span class="product-name">
								<span style="padding-bottom:60px; font-weight:bold;">${myo.parts_name}</span>
							</span>
						</td>
						<td class="sell fmtnum" style="padding-right:40px;"><fmt:formatNumber type="number" value="${myo.parts_price}"/> 원</td>
						<td class="quantity">${myo.req_cnt}</td>
						<td class="state fmtnum" style="padding-right:10px;"><fmt:formatNumber type="number" value="${myo.req}"/> 원</td>
					</tr>
				</c:forEach>	
				</tbody>
				
			</table>
			<c:if test="${invoice!=0}">
			<table width="100%">
				<colgroup>
						<col width="15%">
						<col width="85%">
					</colgroup>
				<tr>
					<th scope="col" class="delivery-tracking">배송추적</th>
					<td class="delivery-detail" colspan="3" style="vertical-align:middle;">
						<span style="display:inline-block; margin-right:20px;"><p>CJ대한통운</p><p id="ord_invoice"></p></span>
						<a href="https://www.doortodoor.co.kr/parcel/doortodoor.do?fsp_action=PARC_ACT_002&fsp_cmd=retrieveInvNoACT&invc_no=#운송장번호" target="_blank" rel="noopener noreferrer">
							<span class="btn detail-btn">배송추적</span>
						</a>
					</td>
				</tr>
			</table>
			</c:if>
		</div>
			
		<div class="order-area">
			<span class="order-info-span shipment">
				<fieldset>
				<legend>배송지 정보</legend>
				<table width="100%">
					<colgroup>
						<col width="15%">
						<col width="85%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="col">수취인</th>
							<td id="ord_name"></td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								<div id="ord_post"></div>
								<div id="ord_addr"></div>
							</td>
						</tr>
						<tr>
							<th scope="col">연락처</th>
							<td>
								<span class="mobile-wrapper" id="ord_tel"></span>
							</td>
						</tr>
						<tr>
							<th scope="col">배송메세지</th>
							<td id="ord_req"></td>
						</tr>
					</tbody>
				</table>
				</fieldset>
			</span>
			
			<span class="order-info-span payment">
			<fieldset>
				<legend>결제 정보</legend>
				<table class="order-info" width="100%">
					<colgroup>
						<col width="60%">
						<col width="40%">
					</colgroup>
					<tbody>
						<tr>
							<th class="type">결제 방법</th>
							<td class="payment">
								<div class="payment-price" id="pay_method"></div>
							</td>
						</tr>
						<tr>
							<th class="type">총 주문금액</th>
							<td class="payment" style="padding-right:30px;">
								<div class="payment-price fmtnum" id="total"></div>
							</td>
						</tr>
						<tr>
							<th class="type">포인트 사용금액</th>
							<td class="payment" style="padding-right:30px;">
								<div class="payment-price fmtnum" id="pay_point"></div>
							</td>
						</tr>
						<tr>
							<th class="type">총 결제금액</th>
							<td class="payment" style="padding-right:30px;">
								<div class="payment-price fmtnum" id="pay_price"></div>
							</td>
						</tr>
						<tr class="mileage-wrapper">
							<th class="type">적립 포인트</th>
							<td class="payment fmtnum" id="pluspoint" style="padding-right:30px;"></td>
						</tr>
					</tbody>
				</table>
				</fieldset>
			</span>
		</div>
		</form>	
		
		<div class="list-btn">
			<input class="btn" type="button"  value="목록보기"/>
		</div>
	</div>
	
	<jsp:include page="../bottom.jsp"/>
	
</body>
</html>