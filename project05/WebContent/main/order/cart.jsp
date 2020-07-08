<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
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
	.cart-cont{min-height:750px;}
	.cart-title{width:1050px; margin:0 auto;}
	.cart-thead tr th{padding:12px 10px; font-weight:700;}
	.cart-tbody tr td{padding:12px 10px;border-bottom:1px solid #cacaca; }
	.cart-wrap{width:1050px; margin:0 auto;}
	.cart-table-th{width:100%; border-top:3px solid #cacaca;}
	.cart-table-td{width:100%; border-top:1px solid #cacaca; border-collapse:collapse;}
	.cart-price{width:1050px; margin:20px auto; border:2px solid #63145F; text-align:right; padding:20px 10px;}
	.fmtnum{text-align:right;}
	.product-img {height: 60px; width: 60px; background-size: cover; background-position: center; background-repeat: no-repeat;}
	
/* 버튼 */
	.btn-order-ctrl {width:1080px; margin:0 auto;overflow: hidden;padding: 30px 0 0;} 
	.btn0 {float: left;width: 50%;text-align: left;}
	.box_btn.white{border: 1px solid #e5e5e5; background: #fff;color: #333 !important; padding: 18px !important; font-size: 16px !important;}
	.box_btn > * {display: inline-block;outline: none;font-weight: 300;ext-align: center;vertical-align: middle;
    line-height: 1.4; white-space: nowrap;cursor: pointer; -webkit-appearance: none;transition: all .2s ease;}
    .btn1 {float: right; width: 50%; text-align: right;}
    
	.btn{background:#63145F; color:#fff; border:none; position:relative; height:60px; font-size:1.5em; padding:0 2em; cursor:pointer;
	transition:800ms ease all; outline:none;}
	.btn:hover{background:#fff; color:#63145F;}
	.btn:before,.btn:after{content:''; position:absolute; top:0; right:0; height:2px; width:0; background: #63145F; transition:400ms ease all;}
	.btn:after{right:inherit; top:inherit; left:0; bottom:0;}
	.btn:hover:before,.btn:hover:after{width:100%; transition:800ms ease all;}
	
</style>
<script type="text/javascript" src="${path}/a00_com/jquery-3.4.1.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%-- ${fn:length(plist)} : ${plist}의 크기 --%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("장바구니");
		var proc = "${param.proc}";
		if(proc == "cart"){
			$("[name=proc]").val("gobuy");
			$("form").submit();
		}
		if(proc == "buy"){
			$("h2").text("구매");	
		}
		// 전체선택
		$("input[type=checkbox]").prop("checked", true);
		var allCnt = $("input[type=checkbox]:not(#checkAll)").length;
		var checkedCnt = $("input[type=checkbox]:checked:not(#checkAll)").length;
		$("input[type=checkbox]:not(#checkAll)").change(function () {
			var checked = $(this).is(":checked");
			if (checked) {
				checkedCnt++;
			} else {
				$("#checkAll").prop("checked", false);
				checkedCnt--;
			}
			if (checkedCnt >= allCnt) {
				$("#checkAll").prop("checked", true);
			} else {
				$("#checkAll").prop("checked", false);
			}
		});
		$("#checkAll").change(function(){
			var checked = $(this).is(":checked");
			if (checked) {
				$("input[type=checkbox]").prop("checked", true);
				checkedCnt = allCnt;
			} else {
				$("input[type=checkbox]").prop("checked", false);
				checkedCnt = 0;
			}
		});
		// 선택삭제
		$('#delBtn').click(function(){
			if($("input[name=cartck]:checked").length == 0){
				alert("선택된 상품이 없습니다.")
			}else{
				$("[name=proc]").val("delBtn");
				$("form").submit();	
			}
		});
		
		
		// 선택삭제
		/*
		var ckbox = $("input[name=cartck]");
		var strArry= $("input[name=cartck]:checked").length;
		$('#delBtn').click(function(){
			if(strArry!=null){
				$("input[name=cartck]:checked").parent().parent().remove();
			}
		});
		*/	
		<%--$("#delBtn")--%>
		
		
		$("#allBtn").click(function(){
			$("[name=proc]").val("gopay");
			$("form").submit();
		});
		
	});
	<%-- ${fn:length(plist)} : ${plist}의 크기 --%>
	var cartCnt = "${fn:length(cart)}";
	var totPay = 0;

	function minus(no){
		// 구매수량, 수량에 따른 가격 처리
		var cnt = Number($("#cnt"+no).text());
		var price = Number($("#price"+no).val());
		var totPay = Number($("[name=totalPay]").val());
		console.log(totPay);
		if(cnt > 1){
			cnt--;
			totPay = totPay-price;
		}
		$("#cnt"+no).html("<input type='hidden' name='req_cnt' value='"+cnt+"' />"+cnt);
		var tot = cnt*price;
		var totS = tot.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$("#tot"+no).html("<input type='hidden' name='tot' value='"+tot+"'/>"+totS+" 원");
		var point = cnt*price*0.01;
		// 반올림처리
		var totpt = point+((point%1>0.5)?(1-(point%1))%1:-(point%1));
		var totptS = totpt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$("#point"+no).html("<input type='hidden' value='"+totpt+"'/>"+totptS+" p");
		var totPayS = totPay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$("#totalPay").html("<input type='hidden' name='totalPay' value='"+totPay+"'/>"+totPayS);
		
	}
	function plus(no){
		// 구매수량, 수량에 따른 가격 처리
		var cnt = Number($("#cnt"+no).text());
		var totPay = Number($("[name=totalPay]").val());
		cnt++;
		$("#cnt"+no).html("<input type='hidden' name='req_cnt' value='"+cnt+"' />"+cnt);
		console.log(totPay);
		var price = Number($("#price"+no).val());
		var tot = cnt*price;
		var totS = tot.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$("#tot"+no).html("<input type='hidden' name='tot' value='"+tot+"'/>"+totS+" 원");
		// 반올림처리
		var point = cnt*price*0.01;
		var totpt = point+((point%1>0.5)?(1-(point%1))%1:-(point%1));
		var totptS = totpt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$("#point"+no).html("<input type='hidden' value='"+totpt+"'/>"+totptS+" p");
		totPay = totPay+price;
		var totPayS = totPay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$("#totalPay").html("<input type='hidden' name='totalPay' value='"+totPay+"'/>"+totPayS);
	}

	</script>
</head>
<body>
	<jsp:include page="../top.jsp"/>
	<div class="cart-cont">
		<header class="cart-title">
			<h2></h2>
		</header>
		<form method="post">
			<input type="hidden" name="proc" value="gopay"/>
			<input type="hidden" name="mem_id" value="${mem.mem_id}"/>
			<div class="cart-wrap">
				<table class="cart-table-th">
					<colgroup>
						<col width="5%">
						<col width="55%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
					</colgroup>
					<thead class="cart-thead">
						<tr>
							<th><input type="checkbox" name="cart_all" id="checkAll" /></th>
							<th>상품명</th><th>수량</th><th>가격</th><th>합계</th><th>적립예정 포인트</th>
						</tr>
					</thead>
				</table>
				<table class="cart-table-td">
					<colgroup>
						<col width="5%">
						<col width="55%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
					</colgroup>
					<tbody class="cart-tbody">
						<c:forEach var="cart" varStatus="status" items="${cart}">
						<input type="hidden" name="req_no" value="${cart.req_no}"/>
						<tr>
							<td style="text-align:center"><input type="checkbox" name="cartck" value="${status.index}"/></td>
							<td>
								<span><img class="product-img" src="image/parts/${cart.parts_img}"/></span>
								<span style="vertical-align:middle;">${cart.parts_name}</span>
							</td>
							<td style="text-align:center">
								<div class="pd_count">
									<input type="button" onclick="minus(${status.count})" value="-"/>
									<span id="cnt${status.count}"><input type="hidden" name="req_cnt" value="${cart.req_cnt}" />${cart.req_cnt}</span>
									<input type="button" onclick="plus(${status.count})" value="+"/>
								</div>
							</td>
							<td class="fmtnum">
								<input id="price${status.count}" type="hidden" value="${cart.parts_price}"/>
								<fmt:formatNumber type="number" value="${cart.parts_price}"/> 원</td>
							<td class="fmtnum"  id="tot${status.count}" >
								<input type="hidden" name="tot" value="${cart.parts_price*cart.req_cnt}"/>
								<fmt:formatNumber type="number" value="${cart.parts_price*cart.req_cnt}"/> 원
							</td>
							<td class="fmtnum" id="point${status.count}">
								<input type="hidden" name="pt" value="${(cart.req_cnt*cart.parts_price*0.01)+(((cart.req_cnt*cart.parts_price*0.01)%1>0.5)?(1-((cart.req_cnt*cart.parts_price*0.01)%1))%1:-((cart.req_cnt*cart.parts_price*0.01)%1))}"/>
								<fmt:formatNumber type="number" value="${(cart.req_cnt*cart.parts_price*0.01)+(((cart.req_cnt*cart.parts_price*0.01)%1>0.5)?(1-((cart.req_cnt*cart.parts_price*0.01)%1))%1:-((cart.req_cnt*cart.parts_price*0.01)%1))}"/> p
							</td>
						</tr>
						<c:set var="totPay" value="${totPay+cart.parts_price*cart.req_cnt}"/>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="cart-price">
				<div>
					<b>결제예정금액</b>
					<p><span id="totalPay">
						<input type="hidden" name="totalPay" value="${totPay}"/><fmt:formatNumber type="number" value="${totPay}"/>
					</span> 원</p>
				</div>
			</div>
		</form>
		
		<div class="btn-order-ctrl">
			<div class="btn0">
				<input  class="box_btn white" id="delBtn" type="button" value="선택삭제"/>
			</div>
			<div class="btn1">
				<input class="btn" type="button" id="selBtn" value="선택주문"/>
				<input class="btn" type="button" id="allBtn" value="전체주문"/>
			</div>
		</div>
		
		
	</div>
	
	<jsp:include page="../bottom.jsp"/>
	
</body>
</html>