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
						
	#market_wrap{padding:50px; position: relative; width:1280px; height:1600px; margin:0 auto;}
	#market_title{border-bottom:1px solid black; padding:10px; font-size:20px;}
	#market_detail{ padding-left:150px;}
	.com{width:220px; margin:15px; }
	.com_img{width:300px;height:300px; float: left;}
	.com_intro{width:600px; height:300px; border:1px solid black; border-collapse:collapse;}
	.com_title{height:50px; padding-left:20px;}
	.com_intro .com_assem{border-bottom:1px solid white;}
	.com_intro .com_assem:last-child{border-bottom:1px solid black;}
	.com_opt{border-collapse:collapse; width:995px; height:200px;}
	#com_info{margin-top:50px; margin-left:20px; width:995px; height:1000px;}
	#com_infotitle {position:relative; height:100px; margin:0 auto;}
	#com_infotitle ul{ float:left; text-align:center; padding:}
	#com_infotitle li{ display:inline-block; text-align:center; }
	#com_infodetail {position:relative; height:900px;}
	.com_detailimg {width:100%;}
	#opt_detail select{width:300px;}
	#opt_detail input{width:30px;}
	.buyPro {width:200px;text-align:center; border:1px solid black; cursor:pointer;
	 display:inline-block; margin:10px; padding:20px; background-color:purple; color:white;
	 font-weight: bold; font-size:1.5em;}
	#price{ text-align: right;}
							
</style>
<script src="${path}/a00_com/jquery-3.4.1.js" type="text/javascript"></script>
<script type="text/javascript">
var price= Number("${comd.com_price}");
$(document).ready(function(){
	var priceOri= Number("${comd.com_price}");
	//수량 감소
	$("#cntdown").click(function(){
		var cnt = Number($("[name=cnt]").val());
		//수량이 1 이하로 떨어지지 않음
		if(cnt<=1){
			$("[name=cnt]").val(1);
		}else{
			$("[name=cnt]").val(cnt-1);
			price -= priceOri;
		}
		//가격 정규식 표현
		var priceS = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$('#price').html("<input type='hidden' name='tot_price' value='"+price+"'/>가격 : "+priceS+"원");
	});
	//수량 증가
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
	var opt1 = Number($("select[name=opt1]").val());
	var opt2 = Number($("select[name=opt2]").val());
	var opt3 = Number($("select[name=opt3]").val());
	var opt4 = Number($("select[name=opt4]").val());
	var tot_opt = opt1 + opt2 + opt3 + opt4;
	
	$("[name=proc]").val("cart");
	$("[name=req_cnt]").val(cnt);
	$("[name=req_opt]").val(tot_opt);
	
	var mem_id = "${mem.mem_id}";
	
	if(mem_id==""){
		$(location).attr("href","${path}/login");		
	}else{
		$("form").attr("action","${path}/order").submit();	
	}
}

function goPay(){
	var cnt = Number($("[name=cnt]").val()); 
	var opt1 = Number($("select[name=opt1]").val());
	var opt2 = Number($("select[name=opt2]").val());
	var opt3 = Number($("select[name=opt3]").val());
	var opt4 = Number($("select[name=opt4]").val());
	var tot_opt = opt1 + opt2 + opt3 + opt4;
	
	$("[name=proc]").val("gopay");
	$("[name=req_cnt]").val(cnt);
	$("[name=req_opt]").val(tot_opt);
	
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
	<p id="market_title">조립컴퓨터</p>
	<form method="post">
		<input type="hidden" name="proc">
		<input type="hidden" name="mem_id" value="${mem.mem_id}">
		<input type="hidden" name="req_no" value="${comd.com_no}">
		<input type="hidden" name="req_cnt">
		<input type="hidden" name="req_opt">
		<ul id="market_detail">
			<li class="com">
				<img src="image/Computer/${comd.com_img}" class="com_img">
			</li>
			<li class="com" style="padding-left:400px">
				<table class="com_intro" border>
					<c:forEach var="comdetail" items="${cdlist}">
					<tr class="com_assem"><td>${comdetail.parts_mc}</td><td>${comdetail.parts_name}</td></tr>
					</c:forEach>
				</table>
			</li>
			<li style="padding:20px 0 0 20px;">
				<table class="com_opt" border>
					<tr>
					<td rowspan="2">
						<table id="opt_detail">
							<tr><th colspan="2">선택 옵션</th></tr>
							<tr><th>메모리 추가</th>
							<td>
							<select name="opt1">
								<option value="0">해당 없음</option>
								<option value="27000">삼성 DDR4 4G 추가(+27,000원)</option>
								<option value="50500">삼성 DDR4 8G 추가(+50,500원)</option>
								<option value="77500">삼성 DDR4 12G 추가(+77,500원)</option>
								<option value="99500">삼성 DDR4 16G 추가(+99,500원)</option>
							</select>
							</td></tr>
							<tr><th>SSD</th>
							<td>
								<select name="opt2">
								<option value="0">해당 없음</option>
								<option value="20000">SSD 240GB로 변경(+20,000원)</option>
								<option value="66000">SSD 500GB로 변경(+66,000원)</option>
								<option value="32500">삼성 SSD 250GB로 변경(+32,500원)</option>
								<option value="75000">삼성 SSD 500GB로 변경(+75,000원)</option>
								</select>							
							</td></tr>
							<tr><th>HDD 추가</th>
							<td>
								<select name="opt3">
								<option value="0">해당 없음</option>
								<option value="56000">HDD 1TB 추가(+56,000원)</option>
								<option value="75000">HDD 2TB 추가(+75,000원)</option>
								<option value="110000">HDD 3TB 추가(+110,000원)</option>
								<option value="135000">HDD 4TB 추가(+135,000원)</option>
								</select>							
							</td></tr>
							<tr><th>운영체제</th>
							<td>
								<select name="opt4">
								<option value="0">해당 없음</option>
								<option value="9800">리눅스 OS 설치(+9,800원)</option>
								<option value="156000">윈도우 10 Home DSP(+156,000원)</option>
								<option value="176000">윈도우 10 Pro DSP(+176,000원)</option>
								<option value="199000">윈도우 10 Home 처음사용자용(+199,000원)</option>
								<option value="270000">윈도우 10 Pro 처음사용자용(+270,000원)</option>
								</select>							
							</td></tr>
							<tr style="user-select: none;"><th>수량</th>
							<td>
								<span id="cntdown">◀</span><input name="cnt" type="text" value="1" readonly/><span id="cntup">▶</span>
							</td></tr>
						</table>	 
					</td>
					<td id="price"><input type="hidden" name="tot_price" value="${comd.com_price}"/>
					가격 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${comd.com_price}" />원</td>
					</tr>
					<tr><td align="center"><div class="buyPro" id="addCart" onclick="addCart()">장바구니</div><div class="buyPro" onclick="goPay()">바로구매</div></td></tr>
				</table>
			</li>
			<li>
				<div id="com_info">
					<div id="com_infodetail">
						<img src="image/Computer/${comd.com_detail}" class="com_detailimg">
					</div>
				</div>
			</li>
		</ul>
	</form>
</div>

<jsp:include page="../../main/bottom.jsp"/>

</body>
</html>