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
<title>PC냥이:컴퓨터 맞춰보자냥</title>
<style>

body{margin:0; padding:0; overflow-x:hidden;}
a{text-decoration:none;}
ul{margin:0; padding:0;}
ul li{list-style:none;}
						
						
	#market_wrap{padding:50px; position: relative; width:1280px; height:16500px; margin:0 auto;}
	#market_title{border-bottom:1px solid black; padding:10px; font-size:20px;}
	#market_detail{ padding-left:150px;}
	.parts{width:220px; margin:15px; }
	.parts_img{width:300px;height:300px; float: left;}
	.parts_intro{width:600px; height:300px; border:1px solid black; border-collapse:collapse;}
	.parts_title{height:50px; padding-left:20px;}
	.parts_intro .parts_assem{border-bottom:1px solid white;}
	.parts_intro .parts_assem:last-child{border-bottom:1px solid black;}
	.parts_opt{border-collapse:collapse; width:600px; height:300px;}
	#parts_info{margin-top:50px; margin-left:20px; width:995px; height:1000px;}
	#parts_infotitle {position:relative; height:100px; margin:0 auto;}
	#parts_infotitle ul{ float:left; text-align:center; padding:}
	#parts_infotitle li{ display:inline-block; text-align:center; }
	#parts_infodetail {position:relative; height:900px;}
	.parts_detailimg {width:100%;}
	#opt_detail select{width:300px;}
	#opt_detail input{width:30px;}
	.buyPro {width:200px;text-align:center; border:1px solid black; cursor:pointer;
	 display:inline-block; margin:10px; padding:20px; background-color:purple; color:white;
	 font-weight: bold; font-size:1.5em;}
	#price{ text-align: right;}
						
</style>
<script src="${path}/a00_com/jquery-3.4.1.js" type="text/javascript"></script>
<script type="text/javascript">
var price= Number("${partsd.parts_price}");
$(document).ready(function(){
	var priceOri= Number("${partsd.parts_price}");
	$("#cntdown").click(function(){
		var cnt = Number($("[name=cnt]").val()); 
		if(cnt<=1){
			
			$("[name=cnt]").val(1);
		}else{
			$("[name=cnt]").val(cnt-1);
			price -= priceOri;
		}
		
		var priceS = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

		$('#price').html("<input type='hidden' name='tot_price' value='"+price+"'/>가격 : "+priceS+"원");
	});
	$("#cntup").click(function(){
		var cnt = Number($("[name=cnt]").val()); 
		$("[name=cnt]").val(cnt+1);
		price += priceOri;
		
		var priceS = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		
		$('#price').html("<input type='hidden' name='tot_price' value='"+price+"'.>가격 : "+priceS+"원");
	});
	
});
function addCart(){

	var cnt = Number($("[name=cnt]").val()); 
	
	$("[name=proc]").val("cart");
	$("[name=req_cnt]").val(cnt);
	
	var mem_id = "${mem.mem_id}";
	
	if(mem_id==""){
		$(location).attr("href","${path}/login");		
	}else{
		$("form").attr("action","${path}/order").submit();	
	}
}
function goPay(){

	var cnt = Number($("[name=cnt]").val()); 
	
	$("[name=proc]").val("gopay");
	$("[name=req_cnt]").val(cnt);
	
	var mem_id = "${mem.mem_id}";
	
	if(mem_id==""){
		$(location).attr("href","${path}/login");		
	}else{
		$("form").attr("action","${path}/order").submit();	
	}
}
</script>
</head>
<body>

<jsp:include page="../../main/top.jsp"/>

<div id="market_wrap">
	<p id="market_title">컴퓨터부품</p>
	<form action="${path}/order"  method="post">
		<input type="hidden" name="proc">
		<input type="hidden" name="mem_id" value="${mem.mem_id}">
		<input type="hidden" name="req_no" value="${partsd.parts_no}">
		<input type="hidden" name="req_cnt">
		<input type="hidden" name="req_opt">
		<ul id="market_detail">
			<li class="parts">
				<img src="image/parts/${partsd.parts_img}" class="parts_img">
			</li>
			<li class="parts" style="padding-left:400px">
				<table class="parts_opt" border>
					<tr><td colspan="2">${partsd.parts_name}</td></tr>
					<tr>
					<td>
						<table id="opt_detail">
							<tr style="user-select: none;"><th>수량</th>
							<td>
								<span id="cntdown">◀</span><input name="cnt" type="text" value="1" readonly/><span id="cntup">▶</span>
							</td></tr>
						</table>	 
					</td>
					<td id="price"><input type="hidden" name="tot_price" value="${partsd.parts_price}"/>
					가격 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${partsd.parts_price}" />원</td>
					</tr>
					<tr><td align="center" colspan="2"><div class="buyPro" id="addCart" onclick="addCart()">장바구니</div><div class="buyPro" onclick="goPay()">바로구매</div></td></tr>
				</table>
			</li>
			<li>
				<div id="parts_info">
					<div style="padding:30px;font-size:1.5em;">상품 상세</div>
					<div id="parts_infodetail">
						<img src="image/${partsd.parts_mc}/${partsd.parts_detail}" class="parts_detailimg">
					</div>
				</div>
			</li>
		</ul>
	</form>
</div>

<jsp:include page="../../main/bottom.jsp"/>

</body>
</html>