<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="path" value="${pageContext.request.contextPath }" />
<%@ include file="/template/header.jsp" %>
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/sh_user_w_userProfile.css">
<link rel="stylesheet" href="css/toastr.css">
<script src="js/toastr.js"></script>
<script>
	
	
toastr.options = {
	    "closeButton": false,
	    "debug": false,
	    "newestOnTop": false,
	    "progressBar": false,
	    "positionClass": "toast-top-right",
	    "preventDuplicates": false,
	    "onclick": null,
	    "showDuration": 800,
	    "hideDuration": 800,
	    "timeOut": 1500,
	    "extendedTimeOut": 1500,
	    "showEasing": "swing",
	    "hideEasing": "linear",
	    "showMethod": "fadeIn",
	    "hideMethod": "fadeOut"
	  }
		var rdlist = "${rdlist}";
		if(rdlist ===''){
			window.location = "${path}/login.do";
			alert("로그인해주세요");
		}
		
		function removeComma(str){
			n = parseInt(str.replace(/,/g,""));

			return n;
		}
		function rdCharge(){
			var amount = $("[name=\"chargeQuery\"]").val()
			amount = removeComma(amount)
			amount = Number(amount)
			if(isNaN(amount)){
				amount=null;
				$("#chargeInput").val('')
			}
			$("[name=\"chargeQuery\"]").val(amount)
			
			if(amount == null || amount == 0){
				Command: toastr["warning"]("충전신청 금액을 정확히 입력해주세요");
			}else if(amount < 1000){
				Command: toastr["warning"]("최소 충전 금액은 1000원 입니다");	
			}else{
				var result = confirm(amount+'원을 충전 신청 하시겠습니까?'); 
				if(result) { 
					$("#chargeForm").submit();
					alert("입금 신청이 완료되었습니다");
				} else {
					
				}
			}
		}
		function rdWithdrawl(){
			var memBalance = "${clist.memBalance}";
			var amount = $("#wiAmount").val();
			var memAccount = "${clist.memAccount}"
			amount = removeComma(amount)
			amount = Number(amount)
			$("#wiAmount").val(amount)
			if(isNaN(amount)){
				amount=null;
				$("#wiAmount").val('')
			}
			if(memAccount=='미등록'){
				Command: toastr["warning"]("계좌정보 등록이 필요합니다");
			}else{
				if(amount == null || amount == 0){
					Command: toastr["warning"]("출금 신청 금액을 정확히 입력해주세요");
				}else if(memBalance < amount){
					Command: toastr["warning"]("보유금액이 부족합니다");
				}else{
					var result = confirm(amount+'원을 출금 신청 하시겠습니까?'); 
					if(result) { 
						$("#chargeForm").submit();
						alert("출금 신청이 완료되었습니다");
						$("#wiForm").submit()
					} else {
						
					}
					
				}
			}
		}
		
		function chgAct(){
			var bankName = $("[name=\"bankName\"]").val();
			var memAccount = $("[name=\"memAccount\"]").val();
			if(memAccount==''||memAccount==null){
				Command: toastr["warning"]("계좌번호를 입력해주세요");
			}else if(bankName == '은행선택'){
				Command: toastr["warning"]("은행을 선택해주세요");
			}else{
				var result = confirm('계좌 정보를 수정/등록 하시겠습니까?'); 
				if(result) { 
					$("#actForm").submit();
				} else {
					
				}	
			}
		}
		
		
		$(document).ready(function(){
			var memBank = "${clist.memBank}";
			if(memBank=='미등록'){
				$("#selectBox").val('은행선택').prop("selected", true);
			}else{
				$("#selectBox").val(memBank).prop("selected", true);
			}
			
			
			function setComma(inputNumber){
				return inputNumber.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1,'); 
			}
			
			var ph = $(".ph").get()
			for(let i=0;i<ph.length;i++){
				$(ph[i]).blur(function(){		
					var chargeInputVal = $(ph[i]).val();
					$(ph[i]).val(setComma(chargeInputVal));
				})
				$(ph[i]).click(function(){
					var chargeInputVal = $(ph[i]).val()
					if($(ph[i]).val().match(",")!=null){
						if(chargeInputVal !='' || chargeInputVal != null){
							$(ph[i]).val('');
						}else{
							
						}
					}else{

					}
					
				})
			}
			
			
		
		
			 $('#chargeInput').keypress(function() {
				 if (event.which && (event.which  > 47 && event.which  < 58 || event.which == 8)) {
					 if($('#chargeInput').val() > 1000000000) {
						 $('#chargeInput').val('')
						 $('#chargeInput').blur()		 
						 $('#chargeInput').val(1000000000);
						 $('#chargeInput').blur()
						 Command: toastr["warning"]("1회 입금 가능한 최대 금액은 10억원을 초과 할 수 없습니다");
					 }
				 } else {
				    alert('숫자만 입력 가능합니다!');
				 }
				
			});
		
			 $('#wiAmount').keypress(function() {
				 if (event.which && (event.which  > 47 && event.which  < 58 || event.which == 8)) {
					 if($('#wiAmount').val() > 1000000000) {
						 $('#wiAmount').val('')
						 $('#wiAmount').blur()		 
						 $('#wiAmount').val(1000000000);
						 $('#wiAmount').blur()
						 Command: toastr["warning"]("1회 출금 가능한 최대 금액은 10억원을 초과 할 수 없습니다");
					 }
				 } else {
				    alert('숫자만 입력 가능합니다!');
				 }
				
			});
			
			
		})
		
		var curPage;
		// ajax
		function goPageWi(no){
			$.ajax({
				type:"post",
				url:"${path}/withdrawlList.do?curPage="+no,
				dataType:"json",
				async : false,
				success:function(data){
					
					var wilist = data.wilist;
					$("#wiTable").empty();
					var show = $("#wiTable").html();
					show += "<tr><td colspan='3'><hr></td></tr>";
					$.each(wilist,function(idx,Withdrawl){
						show += "<tr><td>"+Withdrawl.wiDate+"</td>";
						show += "<td>"+Number(Withdrawl.minusBal).toLocaleString()+"원 </td>";
						show += "<td>"+Withdrawl.wiCurr+"</td></tr>";
						show += "<tr><td colspan='3'><hr></td></tr>";
					});
					$("#wiTable").html(show);
				},
				error:function(err){
					console.log("에러:"+err);
				}
			});
		}
		
		function goPageCh(no){
					$.ajax({
						type:"post",
						url:"${path}/depositList.do?curPage="+no,
						dataType:"json",
						async : false,
						success:function(data){
							var rdlist = data.rdlist;
							$("#chTable").empty();
							var show = $("#chTable").html();
							show += "<tr><td colspan='3'><hr></td></tr>";
							$.each(rdlist,function(idx,Deposit){
								show += "<tr><td>"+Deposit.rddate+"</td>";
								show += "<td>"+Number(Deposit.chargeQueryAmount).toLocaleString()+"원 </td>";
								show += "<td>"+Deposit.curr+"</td></tr>";
								show += "<tr><td colspan='3'><hr></td></tr>";
							});
							$("#chTable").html(show);

						},
						error:function(err){
							console.log("에러:"+err);
							
						}
					});
				}
		
		function goPageUs(no){	
			
			$.ajax({
				type:"post",
				url:"${path}/usingList.do?curPage="+no,
				dataType:"json",
				async : false,
				success:function(data){
					var blist = data.blist;
					$("#usTable").empty();
					var show = $("#usTable").html();	
					show += "<tr><td colspan='4'><hr></td></tr>";
					$.each(blist,function(idx,Balance){
						show += "<tr><td>"+Balance.balDate+"</td>";
						show += "<td>"+Number(Balance.balAmount).toLocaleString()+"원 </td>"
						show += "<td>"+Balance.balHis+"</td><td>";
						if(Balance.balType == '입금') show +="<p class='ifText' style='color:rgb(247,0,0);'>입금</p>";
						if(Balance.balType == '출금') show +="<p class='ifText' style='color:rgb(9,54,135);'>출금</p>";
						if(Balance.balType == '스토어구매') show +="<p class='ifText' style='color:rgb(1,200,201);'>스토어 구매</p>";
						if(Balance.balType == '펀딩투자') show +="<p class='ifText' style='color:rgb(255,151,5);'>펀딩 투자</p>";
						if(Balance.balType == '펀딩수입') show +="<p class='ifText' style='color:rgb(255,151,5)'>펀딩 수입</p>";
						if(Balance.balType == '스토어수입') show +="<p class='ifText' style='color:rgb(1,200,201);'>스토어 수입</p>";
						if(Balance.balType == '펀딩취소') show +="<p class='ifText' style='color:gray;'>펀딩취소</p>";
						if(Balance.balType == '주문취소') show +="<p class='ifText' style='color:gray;'>주문취소</p>";
						show +="</td></tr>";
						show +="<tr><td colspan='4'><hr></td></tr>";
					});
					$("#usTable").html(show);

				},
				error:function(error){
					console.log("에러:"+error);
					
				}
			});
		}
		
		
</script>
</head>
<body style="overflow-y:scroll;">
	<div class="main">
	    <div class="container tim-container" style="max-width:900px; margin:auto;padding-top:100px">
	        <div class="row">
			<div class="col-md-12" style="display:flex;">
				<div style="width:25%;">
					<div style="height : 305px;margin-top:50px;box-shadow: rgba(0, 0, 0, 0.1) 0px 3px 6px 0px;">
						<div class="titleNav"><p class="navText">예치금 관리</p></div>
						<div class="innerNav"><p class="navText txinner" id="chargeM">예치금 충전</p></div>
						<div class="innerNav"><p class="navText txinner" id="withdrawlM">예치금 출금</p></div>
						<div class="innerNav"><p class="navText txinner" id="usingM">이용내역</p></div>
						<div class="innerNav"><p class="navText txinner" id="infoM">계좌정보</p></div>
					</div>
					
					<div style="height:110px;margin-top:30px;box-shadow: rgba(0, 0, 0, 0.1) 0px 3px 6px 0px;padding:10px;padding-top:20px;padding-bottom:20px;">
						<table style="margin:auto;margin-top:3px;" class="moneyTable">
						<tr><td style="text-align:center;text-decoration:underline;font-weight:bold;color:#424242;">${clist.memName}님의 보유금액</td></tr>
						<tr><td style="height:10px;"></td></tr>
						<tr><td style="width:120px;font-weight:bold;font-size:14px;text-align:center;color:#424242;">
						<fmt:formatNumber value = "${clist.memBalance}" type = "number" pattern = "#,###,###,###,###원"/>
						</td></tr>
						</table>
					</div>
				</div>
				<!-- 이용내역 -->	
				<div id="usingM_div" style="display:none;width:75%;box-shadow: rgba(0, 0, 0, 0.1) 0px 3px 6px 0px;margin-left:40px;margin-top:50px;padding : 60px;">
			    	<p style="font-weight:bold;font-size:20px;margin-bottom:20px;">이용내역</p>
			    	<c:if test="${empty blist}">
			    		<hr>
			    		<div class="emptyMsgCharge">이용내역이 존재하지 않습니다</div>
			    	</c:if>
			    	<c:if test="${!empty blist}">
				    	<table id="usTable" style="width:100%;margin:auto;text-align:center">
				    		<tr><td colspan="4"><hr></td></tr>
				    		<c:forEach var="list" items="${blist}">
				    		<tr><td>${list.balDate}</td><td>
				    		<fmt:formatNumber value = "${list.balAmount}" type = "number" pattern = "#,###,###,###,###원"/>
				    		</td><td>${list.balHis}</td>
				    		<td>
				    		<c:if test="${list.balType == '입금'}"><p class="ifText" style="color:rgb(247,0,0);">입금</p></c:if>
				    		<c:if test="${list.balType == '출금'}"><p class="ifText" style="color:rgb(9,54,135)">출금</p></c:if>
				    		<c:if test="${list.balType == '스토어구매'}"><p class="ifText" style="color:rgb(1,200,201);">스토어 구매</p></c:if>
				    		<c:if test="${list.balType == '펀딩투자'}"><p class="ifText" style="color:rgb(255,151,5);">펀딩 투자</p></c:if>
				    		<c:if test="${list.balType == '펀딩수입'}"><p class="ifText" style="color:rgb(255,151,5)">펀딩 수입</p></c:if>
				    		<c:if test="${list.balType == '스토어수입'}"><p class="ifText" style="color:rgb(1,200,201);">스토어 수입</p></c:if>
				    		<c:if test="${list.balType == '펀딩취소'}"><p class="ifText" style="color:gray;">펀딩취소</p></c:if>
				    		<c:if test="${list.balType == '주문취소'}"><p class="ifText" style="color:gray;">주문취소</p></c:if>
				    		</td></tr>
				    		<tr><td colspan="4"><hr></td></tr>
				    		</c:forEach>
				    	</table>
				    	<div class="text-center">
					        <ul class="pagination ct-orange"> 
								<li><a href="javascript:goPageUs(${psh.startBlock-1})">&laquo;</a></li>
								<c:forEach var="cnt" begin="${psh.startBlock}" end="${psh.endBlock}">
									<li id="wiLi" class="${psh.curPage==cnt?'active':'' }"><a class="wiCnt" href="javascript:goPageUs(${cnt})">${cnt}</a></li>
								</c:forEach>
								<li><a href="javascript:goPageUs(${psh.endBlock==psh.pageCount?psh.pageCount:psh.endBlock+1})">&raquo;</a></li>
							</ul>
			       		</div>
			       		</c:if>
				    </div>
			    	
			    	
				<!-- 계좌 정보 -->	
				<div id="infoM_div" style="display:none;width:75%;box-shadow: rgba(0, 0, 0, 0.1) 0px 3px 6px 0px;margin-left:40px;margin-top:50px;padding : 60px;">
			    	<p style="font-weight:bold;font-size:20px;margin-bottom:20px;">계좌 정보 등록 및 수정</p>

			    	<form id="actForm" action="/funfun/myaccount.do/chgAccountInfo.do">
			    	<p style="margin-top:40px;font-weight:bold;"class="profile__img--title">은행 선택</p>
			    	<select id="selectBox" name="bankName" style="margin-top:5px;width:100%;height:40px;">
						    <option selected>은행선택</option>
						    <option value="신한은행">신한은행</option>
						    <option value="우리은행">우리은행</option>
						    <option value="농협은행">농협은행</option>
						    <option value="기업은행">기업은행</option>
						    <option value="산업은행">산업은행</option>
					</select>
					<p style="margin-top:30px;font-weight:bold;"class="profile__img--title">계좌 번호</p>
			    	<c:if test="${clist.memAccount=='미등록'}">
			    	<input name="memAccount" value="" style="margin-top:-3px;width:100%;height:40px;">
			    	</c:if>
			    	<c:if test="${clist.memAccount !='미등록'}">
			    	<input name="memAccount" value="${clist.memAccount}" style="margin-top:-3px;width:100%;height:40px;">
			    	</c:if>
			    	<div style="display:flex;margin-top:40px;">
							<button onclick="chgAct()" style="background-color:orange;color:white;width:100%;" class="profile__submit" type="button">제출</button>
			    	</div>
			    	</form>
							
				</div>
				<!-- 예치금 충전 -->			
				<div id="chargeM_div" style="width:75%;box-shadow: rgba(0, 0, 0, 0.1) 0px 3px 6px 0px;margin-left:40px;margin-top:50px;padding : 60px;">
			    	<p style="font-weight:bold;font-size:20px;margin-bottom:20px;">예치금 충전</p>
			    	<p style="font-size:14px;margin-bottom:20px;">
			    	회원님에게 할당된 아래 전용번호로 입금하면, 입금 금액만큼 KRW포인트가 충전됩니다.
			    	</p>
			    	<table class="chargInfo">
			    	<tr><td>입금은행</td><td class="secondTd">기업은행</td></tr>
			    	<tr><td>계좌번호</td><td class="secondTd">999555510</td></tr>
			    	<tr><td>예금주</td><td class="secondTd">펀펀(${clist.memName})</td></tr>
			    	</table>
			    	<hr style="margin-bottom: 20px;">
			    	<form id="chargeForm" action="/funfun/myaccount.do/chargeQuery.do">
			    	<div style="border-radius:3px;border:1px solid #c0c0c0;margin-top:15px;width:100%;height:40px;">
			    		<input id="chargeInput" style="padding-left:20px;border:none;background:transparent;postion:realative;top:5px;height:40px;width:90%;" class="numberic ph" name="chargeQuery" placeholder="충전할 금액을 입력해주세요">
			    		<span style="color:#c0c0c0;font-size:15px;">원</span>
			    	</div>
			    	<div style="display:flex;margin-top:45px;">
						<button onclick="rdCharge()" style="background-color:orange;color:white;margin:0;position:relative;bottom:20px;width:100%" class="profile__submit" type="button">
						신청하기
						</button>
			    	</div>
			    	</form>
			    	<p style="margin-top:40px;margin-bottom:-10px;font-weight:bold;"class="profile__img--title">신청 내역</p>
			    	<c:if test="${empty rdlist}">
			    	<hr>
			    	<div class="emptyMsgCharge" style="margin-top:50px;">신청내역이 존재하지 않습니다</div>
			    	</c:if>
			    	<c:if test="${!empty rdlist}">
			    	<table id="chTable" style="width:100%;margin:auto;">
			    		<tr><td colspan="3"><hr></td></tr>
			    		<c:forEach var="list" items="${rdlist}">
			    		<tr><td>${list.rddate}</td><td>
			    		<fmt:formatNumber value = "${list.chargeQueryAmount}" type = "number" pattern = "#,###,###,###,###원"/>
			    		</td><td>${list.curr}</td></tr>
			    		<tr><td colspan="3"><hr></td></tr>
			    		</c:forEach>
			    	</table>
			    	
		    	 <!-- 페이징(입금신청 목록) -->

				<div class="text-center">
				        <ul class="pagination ct-orange"> 
							<li><a href="javascript:goPageCh(${psh.startBlock-1})">&laquo;</a></li>
							<c:forEach var="cnt" begin="${psh.startBlock}" end="${psh.endBlock}">
								<li class="${psh.curPage==cnt?'active':'' }"><a href="javascript:goPageCh(${cnt})">${cnt}</a></li>
							</c:forEach>
							<li><a href="javascript:goPageCh(${psh.endBlock==psh.pageCount?psh.pageCount:psh.endBlock+1})">&raquo;</a></li>
						</ul>
		        </div>
			    </c:if>	
				</div>
				
				<!-- 예치금 출금 -->	
				<div id="withdrawlM_div" style="display:none;width:75%;box-shadow: rgba(0, 0, 0, 0.1) 0px 3px 6px 0px;margin-left:40px;margin-top:50px;padding : 60px;">
			    	<p style="font-weight:bold;font-size:20px;margin-bottom:20px;">예치금 출금</p>
			    	<div style="display:flex;font-size:14px;">
			    	<table style="font-size:14px;margin-bottom:20px;">
			    	<tr>
				    	<td style="font-size:14px;font-weight:bold;">보유 금액
				    	</td>
				    	<td style="width:440px;text-align:right;font-size:14px;font-weight:bold;">
				    		<fmt:formatNumber value = "${clist.memBalance}" type = "number" pattern = "#,###,###,###,###원"/>
				    	</td>
			    	</tr>
			    	</table>
			    	</div>
			    	<table class="chargInfo">
			    	<tr><td>출금은행</td><td class="secondTd">${clist.memBank}</td></tr>
			    	<tr><td>계좌번호</td><td class="secondTd">${clist.memAccount}</td></tr>
			    	<tr><td>예금주</td><td class="secondTd">${clist.memName}</td></tr>
			    	</table>
			    	<hr style="margin-bottom: 20px;">
			    	<form id="wiForm" action="/funfun/myaccount.do/withdrawlQuery.do">
			    	<div style="border-radius:3px;border:1px solid #c0c0c0;margin-top:15px;width:100%;height:40px;">
						<input id="wiAmount" name="minusBal" style="padding-left:20px;border:none;background:transparent;postion:realative;top:5px;height:40px;width:90%;" class="ph" placeholder="출금할 금액을 입력해주세요">
			    		<span style="color:#c0c0c0;font-size:15px;">원</span>
			    	</div>
			    	<div style="display:flex;margin-top:45px;">
						<button onclick="rdWithdrawl()" style="background-color:orange;color:white;margin:0;position:relative;bottom:20px;width:100%" class="profile__submit" type="button">신청하기</button>
			    	</div>
			    	</form>
			    	<p style="margin-top:40px;margin-bottom:-10px;font-weight:bold;"class="profile__img--title">신청 내역</p>
			    	<c:if test="${empty wilist}">
			    	<hr>
			    	<div class="emptyMsgCharge" style="margin-top:50px;">신청내역이 존재하지 않습니다</div>
			    	</c:if>
			    	<c:if test="${!empty wilist}">
			    	<div id="withDrawlTb"></div>
			    	
			    	<table id="wiTable" style="width:100%;margin:auto;">
			    		<tr><td colspan="3"><hr></td></tr>
			    		<c:forEach var="list" items="${wilist}">
			    		<tr><td>${list.wiDate}</td><td>
			    		<fmt:formatNumber value = "${list.minusBal}" type = "number" pattern = "#,###,###,###,###원"/>
			    		</td><td>${list.wiCurr}</td></tr>
			    		<tr><td colspan="3"><hr></td></tr>
			    		</c:forEach>
			    	</table>
			    	
			    <!-- 페이징(출금신청 목록) -->

				<div class="text-center">
			        <ul class="pagination ct-orange"> 
						<li><a href="javascript:goPageWi(${psh.startBlock-1})">&laquo;</a></li>
						<c:forEach var="cnt" begin="${psh.startBlock}" end="${psh.endBlock}">
							<li id="wiLi" class="${psh.curPage==cnt?'active':''}"><a class="wiCnt" href="javascript:goPageWi(${cnt})">${cnt}</a></li>
						</c:forEach>
						<li><a href="javascript:goPageWi(${psh.endBlock==psh.pageCount?psh.pageCount:psh.endBlock+1})">&raquo;</a></li>
					</ul>
		        </div>
				</c:if>
				
	        </div>
		    </div>
	    </div>
	</div>
	</div>
	<script src="js/sh_user_w_myPage.js"></script>
	<!-- end main -->
</body>
</html>