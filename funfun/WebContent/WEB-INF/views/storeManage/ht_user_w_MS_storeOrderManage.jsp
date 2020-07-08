<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/template/header.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/ht_user_w_MS_projectReg.css">
<link rel="stylesheet" href="css/ht_user_w_MS_projectManage.css">
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<script src="js/bootstrap-datepicker.js"></script>
<script>
	$(document).ready(function(){
		$(".proCancel").css('cursor','pointer').click(function(){
			$(location).attr("href", "${path}/MakerStudio.do?method=proCancel")
		})
		$(".proCurrnet").css('cursor','pointer').click(function(){
			$(location).attr("href", "${path}/MakerStudio.do?method=proCurrnet&pro_code=${projectCode}")
		})
		$(".proQnAManage").css('cursor','pointer').click(function(){
			$(location).attr("href", "${path}/MakerStudio.do?method=proQnAManage")
		})

		$(".storeOpenReg").css('cursor','pointer').click(function(){
			$(location).attr("href", "${path}/Store.do?method=storeOpenReg")
		})
		$(".storeRegReady").css('cursor','pointer').click(function(){
			$(location).attr("href", "${path}/Store.do?method=storeRegReady")
		})
		
		$(".storeBasicInfoReg").css('cursor','pointer').click(function(){
			$(location).attr("href", "${path}/Store.do?method=storeBasicInfo")
		})
		$(".storeOptionReg").css('cursor','pointer').click(function(){
			$(location).attr("href", "${path}/Store.do?method=storeOption")
		})
		$(".storeOrderManage").css('cursor','pointer').click(function(){
			$(location).attr("href", "${path}/Store.do?method=storeOrderManage")
		})
		$(".storeQnAManage").css('cursor','pointer').click(function(){
			$(location).attr("href", "${path}/Store.do?method=storeQnAManage")
		})

	})
		
</script>
</head>
<body>
	<div class="main">
	    <div class="container tim-container" style="max-width:1200px; padding-top:100px">

	<div class="row">

 
 	<jsp:include page="../makerstudio/ht_user_w_MS_menu.jsp"/>
 
 
  	<div class="col-sm-10" style="padding-left:30px;padding-right:200px;">
  	
  	<h3 style="font-weight:bolder">스토어 주문 관리</h3>
  	
  	<br><br>
  	
  	<span class="sub_gray_font">스토어에 등록된 주문 리스트입니다.</span>

  	<br><br><br><br>

	<table class="table table-hover">
		<thead>
			<tr>
			<th style="width:13%;text-align:center;">주문자 이름</th>
			<th style="width:13%;text-align:center;">주문 갯수</th>
			<th style="width:13%;">주문 가격</th>
			<th style="width:48%;">주문 상세 내용</th>
			<th style="width:13%;text-align:center;">주문 상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="orderList" items="${orderList}">
			
			<tr>
			<td style="text-align:center;">${orderList.mem_name}</td>
			<td style="text-align:center;">${orderList.sto_order_cnt}</td>
			<td style="font-weight:bold;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${orderList.sto_order_price}"/>원</td>
			<td style="word-break:break-all;">
			<span style="font-weight:bold;">이메일 :</span> ${orderList.mem_email}<br>
			<span style="font-weight:bold;">주문 날짜 :</span> ${orderList.sto_order_date}<br>
			<span style="font-weight:bold;">받는 사람 :</span> ${orderList.sto_order_receiver}<br>
			<span style="font-weight:bold;">전화 번호 :</span> ${orderList.sto_order_phoneno}<br>
			<span style="font-weight:bold;">배송 주소 :</span> ${orderList.sto_order_address}<br>
			<span style="font-weight:bold;">배송 요청 :</span> ${orderList.sto_order_ask}
			<td style="text-align:center;">${orderList.sto_order_curr}</td>
			</tr>
			
			</c:forEach>
		</tbody>
	</table>



  	
  	</div>




	</div>
	        
	    </div>
	</div>
	<!-- end main -->
</body>
</html>