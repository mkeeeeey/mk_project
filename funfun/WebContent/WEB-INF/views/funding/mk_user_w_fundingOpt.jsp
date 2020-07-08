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
.noti-label{display: inline-block; width: 40px; vertical-align: middle;}
.label-span{vertical-align: middle; padding: 15px 0 13px; display: inline-block; font-size: 17px; font-weight: 800; color: #babdc0;}
.noti-check input[type="checkbox"] {display: none;}
.noti-check input[type="checkbox"] + label {width: 15px;height: 15px;background: #ff9500; cursor: pointer; border-radius: 5px; margin: 15px 15px 8px 10px;}
.noti-check input[type="checkbox"]:checked + label {background:url(img/ck01.png) #ff9500 no-repeat center/20px 20px;margin: 15px 0 8px 10px;}

</style>
<script type="text/javascript">
	$(document).ready(function(){
		console.log("옵션선택");
		var mem_code = $("[name=mem_code]").val();
		console.log("멤버 코드 " + mem_code);
		$("#funding").click(function(){
			var checks = document.querySelectorAll("[name=reason]");
			if(checks[0].checked==false && checks[1].checked==false && checks[2].checked==false) {
				alert("펀딩하기인 이유를 확인하고 체크해주세요");
			} else{
				var opt_no = $("[name=optcode]:checked").val();
				$("[name=opt_code]").val(opt_no);
				if(opt_no!=null){
					$(location).attr("href", "${path}/funding.do?method=fund&opt_code="+opt_no+"&mem_code="+mem_code);
				} else{
					alert("옵션을 선택하세요");
				}
			}
		});
	});

</script>
</head>
<body>
	<div class="main">
		<div class="container tim-container" style="max-width:1200px; padding-top:100px">
			<div>
				<div>
					<p class="funding-noti"><strong>잠깐!</strong> 결제하기가 아닌 펀딩하기인 이유를 확인하고, 펀딩하세요.</p>
					<div class="noti-check">
						<div class="noti-label">
							<input type="checkbox" name="reason" id="checkbox1" >
							<label for="checkbox1"></label>
						</div>
						<span class="label-span">펀딩한 리워드는 새롭게 준비하고 있는 제품・서비스입니다.</span>
					</div>
					<div class="noti-detail">
						<p>펀딩 후, 리워드를 제작・준비하는 크라우드펀딩 특성상, 품질 이슈가 발생할 수 있습니다.</p>
						<p>리워드 품질 이슈 발생 시 펀딩 안내 - <strong>상세 정책</strong>을 꼭 확인해주세요. </p>
					</div>
					<div class="noti-check">
						<div class="noti-label">
							<input type="checkbox"  name="reason" id="checkbox2">
							<label for="checkbox2"></label>
						</div>
						<span class="label-span">펀딩 종료 후에는 결제를 취소할 수 없습니다.</span>
					</div>
					<div class="noti-detail">
						<fmt:parseDate var="pro_finish" value="${project.pro_finish_date}" pattern="yyyy-MM-dd HH:mm:ss" />
						<p>펀딩 종료일 <strong><fmt:formatDate value="${pro_finish}" pattern="yyyy.MM.dd"/></strong> 이후에는 메이커의 프로젝트 수행을 위해 결제 취소가 불가합니다.</p>
					</div>
					<div class="noti-check">
						<div class="noti-label">
							<input type="checkbox"  name="reason" id="checkbox3">
							<label for="checkbox3"></label>
						</div>
						<span class="label-span">펀딩한 리워드는 즉시 배송되지 않습니다.</span>
					</div>
					<div class="noti-detail">
						<p>메이커가 약속한 리워드 발송 시작일을 확인했나요? 메이커는 펀딩이 성공해야 리워드 제작・준비를 진행합니다.</p>
						<p>리워드 펀딩 특성상 발송이 지연되거나 불가할 수 있으니, 펀딩 안내 - <strong>상세 정책</strong>을 꼭 확인해주세요.</p>
					</div>
				</div>
				
				<p class="check-noti" data-toggle="modal" data-target="#myModal">프로젝트 상세 정책</p>
				<div class="modal fade in" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false" >
					<div class="modal-dialog" style="width: 800px;">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel">프로젝트 상세 정책</h4>
							</div>
							<div class="modal-body">
								<p>펀딩금 반환 안내</p>
								<p>펀딩 종료 후 아래 정책에 따라 펀딩금 반환 신청을 할 수 있습니다. 펀딩금 반환은 서포터가 펀딩한 금액만큼 예치금으로 반환하는 방식으로 이뤄집니다.펀딩금 반환은 펀딩금 반환 문의처에서 신청하실 수 있습니다.</p>
								<p>1) 리워드가 지연될 경우</p>
								<p><strong>메이커가 최대 발송 지연 가능일까지 리워드를 발송하지 않을 경우,</strong> 서포터는 펀딩금 반환 신청을 할 수 있습니다. 최대 발송 지연 가능일은 리워드 발송 시작의 마지막 날로부터 90일 이후 입니다.</p>
								<p>(예) 리워드 발송 시작일: 2020년 01월 초(1~10일)<br>
									→ 리워드 최대 발송 지연일: 2020년 04월 08일</p>
								<p>2) 리워드에 하자가 있을 경우</p>
								<p>서포터가 수령한 리워드가 아래 어느 하나에 해당할 경우, 수령일로부터 7일 이내에 펀딩금 반환 신청을 할 수 있습니다. 이때 메이커는 하자 판단을 위한 증빙자료, 리워드 반송을 서포터에게 요청할 수 있습니다.</p>
								<p>- 리워드의 유통 및 제작에 법적으로 문제가 있는 경우<br>
								- 리워드의 내용이 표시/광고 내용과 현저하게 상이한 경우<br>
								- 정상적인 사용상태에서 리워드의 기능/성능상 오작동이 발생되는 경우<br>
								- 리워드가 미작동될 경우<br>
								- 주요 성분 미기재로 인해 서포터에게 중대한 신체 피해를 입힌 경우</p>
								<p>단, 아래 어느 하나에 해당될 경우 펀딩금 반환은 불가합니다.</p>
								<p>- 메이커가 프로젝트 페이지 내에 명시적으로 고지한 하자 불인정 사유에 해당하는 경우<br>
								(예) 공장 제작 과정상 벌어짐 방지를 위해 봉제되어 제공되는 포켓은 하자 사유가 되지 않습니다.<br>
								- 서포터의 귀책 사유로 리워드의 일부 혹은 전체가 분실/파손/고장/오염/훼손이 발생된 경우<br>
								- 모니터 해상도의 차이로 인해 색상이나 이미지가 실제와 다른 경우<br>
								- 공연, 디지털컨텐츠, 여행 패키지 상품, 무형 서비스 및 컨텐츠의 제공이 완료되었을 경우<br>
								- 신선식품 혹은 정기구독 서비스일 경우<br>
								- 서포터의 제품 숙지 미숙으로 인해 문제가 발생했을 경우</p>
								<p>3) 기타 주의 사항</p>
								<p>- 크라우드펀딩의 특성상 프로젝트 종료 후 서포터의 단순변심으로 인한 펀딩금 반환은 불가합니다.<br>
								- 회사는 메이커와 상호 협의 하에 프로젝트를 취소할 수 있으며, 펀딩 종료 후 프로젝트가 취소될 경우에는 펀딩금이 반환됩니다.<br>
								- 하자가 있는 경우, 리워드 반송을 위한 배송비는 메이커가 부담하여야 하고 하자가 없는 경우에는 리워드 반송 및 재반송에 대한 배송비를 서포터에게 청구될 수 있습니다.</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default btn-simple" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
                </div>
			</div>
			
			<div class="funding-opt" >
				<div class="top-area">
					<h3><em>리워드 선택</em></h3>
					<p class="sub-text">펀딩해주시는 금액에 따라 감사의 의미로 리워드를 제공해 드립니다.</p>
				</div>
				<form method="post" >
					<input type="hidden" name="opt_code"/>
					<input type="hidden" name="mem_code" value="${user.mem_code}"/>
				</form>
				<div>
					<ul>
					<c:forEach var="opt" items="${opt}" >
					<c:if test="${opt.opt_max != 0}">
						<li class="opt-list">
						<fmt:parseDate var="opt_deliver_date" value="${opt.opt_deliver_date}" pattern="yyyy-MM-dd HH:mm:ss" />
							<div class="opt-box">
								<label class="radio" for="checkbox1">
		                       		<span class="icons">
		                       			<span class="first-icon fa fa-circle-o"></span>
		                        		<span class="second-icon fa fa-dot-circle-o"></span>
		                        	</span>
		                        	<input type="radio" value="${opt.opt_code}" id="checkbox1" data-toggle="radio" name="optcode">
								</label>
								<p class="reward-qty">남은 수량 <strong>${opt.opt_max}</strong>개 &nbsp; </p>
								<p class=""><fmt:formatNumber type="number" maxFractionDigits="3" value="${opt.opt_price}"/>원 펀딩합니다.</p>
								<p class="">${opt.opt_title}</p>
								<p class="">${opt.opt_detail}</p>
								<p class="">배송비 <fmt:formatNumber type="number" maxFractionDigits="3" value="${opt.opt_delivery}"/>원 | 리워드 제공 예상일 : 
								<em><fmt:formatDate value="${opt_deliver_date}" pattern="yyyy년 MM월 dd일"/> 예정</em></p>
								<div id="writeopt" style="display:none;">
									<div style="display: inline-block;width: 120px;">
										<input type="button" class="btn btn-block btn-warning" onclick="minus" value="-" style="padding: 0; width: 25px;height: 25px;display: inline-block;">
										<span id="cnt" style="padding: 0 5px;"><input type="hidden" name="fund_cnt">1</span>
										<input type="button" class="btn btn-block btn-warning" onclick="plus" value="+" style="padding: 0;width: 25px;height: 25px;display: inline-block;">
									</div>
									<div style="display: inline;">
										옵션상세 <input type="text" class="" name="fund_opt_detail">
									</div>
								</div>
							</div>
						</li>
						</c:if>
					</c:forEach>
					</ul>
				</div>
			</div>
			
			<div class="next-step">
				<button id="funding" class="btn btn-block btn-lg btn-fill btn-warning">다음 단계로</button>
			</div>
			
		</div>
	</div>

</body>
<script type="text/javascript">

</script>
</html>