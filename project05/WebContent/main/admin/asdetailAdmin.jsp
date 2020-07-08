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
		var mgr_no = "${mgr.mgr_no}";
		$("h2").text("AS관리("+mgr_no+")");
		
		var proc = "${param.proc}";
		if(proc=='uptmgrDetail'){
			$("[name=proc]").val("mgr");
			$("form").submit();
		}
		
	});
</script>
</head>
<body>
	<jsp:include page="../../main/admintop.jsp"/>
	
	<div class="mgr-wrap">
		<header>
			<h2></h2>
		</header>
		<form method="post">
		<input type="hidden" name="proc" value="uptmgrDetail" />
		<input type="hidden" name="mgr_no" value="${mgr.mgr_no}" />
		<table class="mgr-table">
			<colgroup>
				<col width="10%">
				<col width="25%">
				<col width="10%">
				<col width="10%">
				<col width="25%">
				<col width="20%">
			</colgroup>
			<thead>
				<tr>
					<th>신청번호</th><th>신청일</th><th>분류</th><th>신청자</th><th>입고일</th><th>진행상태</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="text-align:center;">${mgr.as_no}</td>
					<td style="text-align:center;">${mgr.as_date}</td>
					<td style="text-align:center;">${mgr.as_cate}</td>
					<td style="text-align:center;">${mgr.mem_id}</td>
					<td style="text-align:center;">${mgr.mgr_date}</td>
					<td>
						<div class="input-wrap">
							<input class="input" type="text" name="mgr_stat" value="${mgr.mgr_stat}"/>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		
		<table class="detail-table" border>
			<colgroup>
				<col width="15%">
				<col width="35%">
				<col width="15%">
				<col width="35%">
			</colgroup>
			<tr>
				<th>주문번호</th><td>${mgr.ord_no}</td><th>구매일</th><td>${mgr.ord_date}</td>
			</tr>
			<tr>
				<th>구매상품</th>
				<td colspan="3">
				<c:forEach var="ord" items="${ordlist}">
					<img src="${path}/image/parts/${ord.parts_img}" style="width:40px;"/> ${ord.parts_name}<br>
				</c:forEach>
				</td>
			</tr>
			<tr>
				<th>신청내용</th><td colspan="3">${mgr.as_detail}</td>
			</tr>
		</table>
		
		<table>
			<tr><th>처리비용</th>
				<td>
					<div class="input-wrap">
						<input class="input" type="number" name="mgr_price" value="${mgr.mgr_price}"/>
					</div>
				</td>
				<th>비고</th>
				<td>
					<div class="input-wrap">
						<input class="input" type="text" name="mgr_note" value="${mgr.mgr_note}"/>
					</div>
				</td>
			</tr>
		</table>
		
		<div class="pay-btn">
			<input class="btn" type="submit" value="수정/확인"/>
		</div>
		</form>
	</div>
	

</body>
</html>