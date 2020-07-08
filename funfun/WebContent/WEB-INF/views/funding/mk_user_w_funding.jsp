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
<link rel="stylesheet" href="css/mk_user_w_projectList.css">
<style type="text/css">
#balance-warning{color:#FF9500; text-align: right; margin-right: 15px;}

</style>
<script>
	$(document).ready(function(){
		console.log("프로젝트 번호:"+$("[name=pro_code]").val());

		var balance = Number($("[name=mem_balance]").val());
		var price = Number($("[name=fund_tot]").val());
		console.log("예치금"+balance+" 결제금액"+price);
		if(balance<price){
			$("#balance-warning").text("예치금이 부족합니다!");
		}
		
		$("#funding").click(function(){
			if(balance<price){
				alert("예치금이 부족합니다!");
			} else{
				var name = $("[name=fund_receiver]").val();
				var tel = $("[name=fund_rec_tel]").val();
				var post = $("[name=fund_post]").val();
				var addr = $("[name=fund_address]").val();
				if(name!=null&&name!=""&&tel!=null&&tel!=""&&post!=null&&post!=""&&addr!=null&&addr!=""){
					alert("펀딩완료되었습니다");
					$("form").submit();
				} else {
					alert("배송지 입력 정보를 확인해 주세요");
				}
			}
		});
	});
	
	// 우편번호 찾기
	function goPopup(){
		var pop = window.open("jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 	
	}
	function jusoCallBack(roadFullAddr,zipNo){
		$("[name=fund_post]").val(zipNo);
		$("[name=fund_address]").val(roadFullAddr);
	}
	
</script>
</head>
<body>
	<div class="main" style="overflow:hidden;">
	    <div class="container tim-container" style="max-width:1200px; padding-top:100px">
	    	<%--<div class="project-title" >
	    		<div class="label label-warning">${project.cate_title}</div>
	    		<h3 style="font-weight:800;">${project.pro_title}</h3>
	    	</div> --%>
	    	<div class="funding-page">
	    		<form name="fundingForm" method="post" action="${path}/funding.do?method=funding">
	    			<input type="hidden" name="mem_code" value="${user.mem_code}"/>
	    			<input type="hidden" name="pro_code" value="${option.pro_code}"/>
	    			<input type="hidden" name="opt_code" value="${option.opt_code}"/>
	    			<input type="hidden" name="fund_price" value="${option.opt_price}">
	    			<input type="hidden" name="fund_cnt" value="1"/>
	    			<input type="hidden" name="fund_opt_detail" value=""/>
	    			
	    			<div class="funding-wrap">
						<div class="order-list" data-choiced-legnth="1">
							<div class="order-cont">
								<p class="fund-tit"><fmt:formatNumber type="number" maxFractionDigits="3" value="${option.opt_price}"/>원 펀딩</p>
								<p class="text">${option.opt_title}</p>
								<div>
									<div class="option">
										<span class="option-cont">옵션-</span>
										<span>${option.opt_detail}</span>
									</div>
								<%-- 
									<p class="sum"><em>수량 : 1개</em>
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${option.opt_price}"/>원</p>
								--%>
								</div>
							</div>
						</div>
						<div class="balance order-info">
							<p class="order-infodt">보유 예치금 <p>
							<input type="hidden" name="mem_balance" value="${balance}"/>
							<span class="order-infodd"><span id="usablePoint"><fmt:formatNumber type="number" maxFractionDigits="3" value="${balance}"/></span>원</span>
							<p id="balance-warning"></p>
						</div>
						<div class="order-info conf-info">
							<div>
								<p class="order-infodt">펀딩금액</p>
								<p class="order-infodd"><span id="fundingPrice"><fmt:formatNumber type="number" maxFractionDigits="3" value="${option.opt_price}"/></span>원</p>
							</div>
							<div>
								<p class="order-infodt">배송비</p>
								<p class="order-infodd"><fmt:formatNumber type="number" maxFractionDigits="3" value="${option.opt_delivery}"/>원</p>
							</div>
							<div class="total">
								<p class="order-infodt">최종결제금액</p>
								<p class="order-infodd">
									<input type="hidden" name="fund_tot" value="${option.opt_price+option.opt_delivery}"><em id="totalPriceView">
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${option.opt_price+option.opt_delivery}"/></em>원</p>
							</div>
						</div>
					</div>
					<div class="payment-noti">
					<!-- 결제 예약시 유의사항 -->
						<p class="fund-tit">결제 예약시 유의사항</p>
						<ul>
							<li>- 결제자 귀책사유(예치금 잔액 부족, 이용정지 등)로 인하여 결제가 실패할 수 있으니, 결제수단이 유효한지 한번 확인하세요.</li>
						</ul>
					</div>
					<div class="funding-wrap" style="height:400px;">
						<div class="col-md-4 col-sm-6" style="padding: 0;">
							<h3><em>펀딩 서포터</em></h3>
							<div class="mem-info">
								<div>
									<p class="mem-info-tit">이름</p>
									<p class="mem-info-txt">${user.mem_name}</p>
								</div>
								<div>
									<p class="mem-info-tit">이메일</p>
									<p class="mem-info-txt">${user.mem_email}</p>
								</div>
								<div class="supporter-phone-number">
									<p class="mem-info-tit">휴대폰 번호</p>
									<p class="mem-info-txt">${user.mem_phoneno}</p>
								</div>
							</div>
						</div>
						<div class="col-md-7 col-sm-6" style="padding: 0; float: right;">
							<h3><em>리워드 배송지</em></h3>
							<div class="delivery-list"></div>
							<div class="deliver-new active">
								<div class="deliver-info">
									<p class="deliver-tit">이름</p>
									<input type="text" name="fund_receiver" id="newPresenteeName" class="form-control">
									<p class="deliver-tit">휴대폰 번호</p>
									<input type="tel" name="fund_rec_tel" id="newContactNumber" maxlength="13" class="form-control">
									<p class="deliver-tit">주소</p>
									<input name="fund_post" type="text" id="newAddressDetails" placeholder="우편번호" class="form-control deliver-post"  readonly />
									<button type="button" class="btn btn-block btn-fill btn-warning find-post" onclick="goPopup()">우편번호 검색</button>
									<p class="text" id="newAddress"></p>
									<input name="fund_address" type="text" maxlength="96" id="newAddressDetails" placeholder="상세주소" class="form-control" />
								</div>
							</div>
						</div>
					</div>
	    		</form>
	    	</div>
	    	<div class="btn-wrap funding-btn">
				<button type="button" id="funding" class="btn btn-block btn-lg btn-fill btn-warning">펀딩하기</button>
			</div>
	    </div>
	</div>
	
</body>
</html>