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
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/mk_user_w_projectList.css">
<script src="js/bootstrap-datepicker.js"></script>
<script>
	$(document).ready(function(){

		$(".basicReqBtn").css('cursor','pointer').click(function(){
			$(location).attr("href", "${path}/ProjectReg.do?method=basicReq")
		})
		$(".basicInfoBtn").css('cursor','pointer').click(function(){
			$(location).attr("href", "${path}/ProjectReg.do?method=basicInfo")
		})
		$(".storyBtn").css('cursor','pointer').click(function(){
			$(location).attr("href", "${path}/ProjectReg.do?method=story")
		})
		$(".rewardBtn").css('cursor','pointer').click(function(){
			$(location).attr("href", "${path}/ProjectReg.do?method=reward")
		})
		$(".riskBtn").css('cursor','pointer').click(function(){
			$(location).attr("href", "${path}/ProjectReg.do?method=risk")
		})
		$(".proQnaBtn").css('cursor','pointer').click(function(){
			$(location).attr("href", "${path}/MakerStudio.do?method=proQna")
		})		
		$(".deleteX").css('cursor','pointer');
		
		$( "#deliveryDate" ).datepicker({format:'yyyy/mm/dd'});
		
	})

	
</script>
</head>
<body>
	<div class="main">
	    <div class="container tim-container" style="max-width:1200px; padding-top:100px">

	<div class="row">

 	<jsp:include page="ht_user_w_MS_projectReg_menu.jsp"/>


  	<div class="col-sm-10" style="padding-left:30px;">
  	
  	<h3 style="font-weight:bolder">리워드 설계</h3>
  	
  	<br><br>
  	
  	<span class="sub_gray_font">서포터에게 제공할 리워드 옵션 내용을 입력하세요</span>

  	<br><br><br><br>

	<c:forEach var="opt" items="${optList}">
			<div class="optUnitContainer">
			<div class="optUnitPrice">
				<fmt:formatNumber type="number" maxFractionDigits="3" value="${opt.opt_price}"/>원
				<span class="navbar-right deleteX sub_gray_font" style="display:inline-block"  onclick="javascript:deleteProOpt('${opt.opt_code}')">x</span>
			</div>
			<div class="optUnitTitle">${opt.opt_title}</div>
			<div class="optUnitDetail">${opt.opt_detail}</div>
			<div class="optUnitCondition">${opt.opt_condition}</div>
			<div class="optUnitDeliver">배송비 : ${opt.opt_delivery} 원</div>
			<div class="optUnitDeliverDate">배송 예정일 : ${opt.opt_deliver_date}</div>
 			<button class="btn btn-warning btn_custom optUpt navbar-right" 
 			 		style="display:inline-block;width:40%;height:30px;margin-top:10px;padding:0;text-align:center;"
					data-toggle="modal"
					data-target="#myModalUpt"
					data-opt_code="${opt.opt_code}"
					data-opt_price="${opt.opt_price}"
					data-opt_title="${opt.opt_title}"
					data-opt_detail="${opt.opt_detail}"
					data-opt_condition="${opt.opt_condition}"
					data-opt_deliver="${opt.opt_delivery}"
					data-opt_max="${opt.opt_max}"
					data-opt_deliver_date="${opt.opt_deliver_date}"
					> 리워드 수정</button>
			</div>
	</c:forEach>	
	

	<div class="form-group">

	<button class="btn btn-warning btn_custom" style="margin-top:40px;" data-toggle="modal" data-target="#myModal">+ 추가하기</button>

	
	<form method="post" action="${path}/ProjectReg.do" id="OptUnitSubmitForm">
	<input type="hidden" name="method" value="rewardUnitReg"/>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding:30px 20px 20px 30px;">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				  	<h3 class="modal-title" id="myModalLabel" style="font-weight:bolder">리워드 옵션 추가</h3>
				</div>
				<div class="modal-body" style="padding-left:70px;padding-right:70px;">
				
					<div class="reward_reg_subTitle">
						<div class="reward_reg_content_container1">펀딩 금액</div>
						<div class="reward_reg_content_container2">
							<input type="text" name="opt_price" class="form-control" style="width:60%;display:inline-block;"/>&nbsp&nbsp&nbsp원
						</div>
					</div>
				
					<div class="reward_reg_subTitle">
						<div class="reward_reg_content_container1">옵션명</div>
						<div class="reward_reg_content_container2">
							<input type="text" name="opt_title" class="form-control"/>
							<span class="sub_gray_font">xx자 남음</span>
						</div>
					</div>
				
					<div class="reward_reg_subTitle">
						<div class="reward_reg_content_container1">상세설명</div>
						<div class="reward_reg_content_container2">
							<textarea class="form-control" name="opt_detail"></textarea>
							<span class="sub_gray_font">xx자 남음</span>
						</div>
					</div>
				
					<div class="reward_reg_subTitle">
						<div class="reward_reg_content_container1">옵션조건</div>
						<div class="reward_reg_content_container2">
							<select class="form-control" name="opt_condition" id="sel1" style="width:60%;">
							<option>옵션 없음</option>
							<option>선택 옵션(사이즈, 색상 등)</option>
							<option>직접 입력 옵션(각인, 메세지 등)</option>
							</select>
						</div>
					</div>
				
					<div class="reward_reg_subTitle">
						<div class="reward_reg_content_container1">배송비</div>
						<div class="reward_reg_content_container2">
							<div style="padding-left:30px;line-height:1.5em">
								<input type="text" name="opt_delivery" class="form-control" style="width:80%;display:inline-block;height:30px;"/>&nbsp&nbsp&nbsp원<br>
								<span class="sub_gray_font">배송금액이 필요 없는 경우 0을 입력하세요</span>
							</div>
						</div>
					</div>
				
					<div class="reward_reg_subTitle">
						<div class="reward_reg_content_container1">제한수량</div>
						<div class="reward_reg_content_container2">
							<input type="text" name="opt_max" class="form-control" style="width:30%;display:inline-block;"/>&nbsp&nbsp&nbsp개
						</div>
					</div>
				
					<div class="reward_reg_subTitle">
						<div class="reward_reg_content_container1">발송시작 예정일</div>
						<div class="reward_reg_content_container2">
							<input type="text" placeholder="날짜를 선택하세요" name="opt_deliver_date" id="deliveryDate" class="form-control" style="width:60%;" autocomplete="off">
						</div>
					</div>
				
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default btn-simple" data-dismiss="modal">취소</button>
						<div class="divider"></div>
					<button type="button" class="btn btn-info btn-simple" id="subBtn">등록</button>
				</div>
			</div>
		</div>
	</div>
	</form>


  
	<form method="post" action="${path}/ProjectReg.do" id="OptUnitUptSubmitForm">
	<input type="hidden" name="method" value="uptProOption"/>
	<input type="hidden" name="opt_code" id="opt_code"/>

	<div class="modal fade" id="myModalUpt" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding:30px 20px 20px 30px;">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				  	<h3 class="modal-title" id="myModalLabel" style="font-weight:bolder">리워드 옵션 수정</h3>
				</div>
				<div class="modal-body" style="padding-left:70px;padding-right:70px;">
				
					<div class="reward_reg_subTitle">
						<div class="reward_reg_content_container1">펀딩 금액</div>
						<div class="reward_reg_content_container2">
							<input type="text" name="opt_price" id="opt_price" class="form-control" style="width:60%;display:inline-block;"/>&nbsp&nbsp&nbsp원
						</div>
					</div>
				
					<div class="reward_reg_subTitle">
						<div class="reward_reg_content_container1">옵션명</div>
						<div class="reward_reg_content_container2">
							<input type="text" name="opt_title" id="opt_title" class="form-control"/>
							<span class="sub_gray_font">xx자 남음</span>
						</div>
					</div>
				
					<div class="reward_reg_subTitle">
						<div class="reward_reg_content_container1">상세설명</div>
						<div class="reward_reg_content_container2">
							<textarea class="form-control" name="opt_detail" id="opt_detail"></textarea>
							<span class="sub_gray_font">xx자 남음</span>
						</div>
					</div>
				
					<div class="reward_reg_subTitle">
						<div class="reward_reg_content_container1">옵션조건</div>
						<div class="reward_reg_content_container2">
							<select class="form-control" name="opt_condition" id="sel1" style="width:60%;">
							<option>옵션 없음</option>
							<option>선택 옵션(사이즈, 색상 등)</option>
							<option>직접 입력 옵션(각인, 메세지 등)</option>
							</select>
						</div>
					</div>
				
					<div class="reward_reg_subTitle">
						<div class="reward_reg_content_container1">배송비</div>
						<div class="reward_reg_content_container2">
							<div style="padding-left:30px;line-height:1.5em">
								<input type="text" name="opt_delivery" id="opt_delivery" class="form-control" style="width:80%;display:inline-block;height:30px;"/>&nbsp&nbsp&nbsp원<br>
								<span class="sub_gray_font">배송금액이 필요 없는 경우 0을 입력하세요</span>
							</div>
						</div>
					</div>
				
					<div class="reward_reg_subTitle">
						<div class="reward_reg_content_container1">제한수량</div>
						<div class="reward_reg_content_container2">
							<input type="text" name="opt_max" id="opt_max" class="form-control" style="width:30%;display:inline-block;"/>&nbsp&nbsp&nbsp개
						</div>
					</div>
				
					<div class="reward_reg_subTitle">
						<div class="reward_reg_content_container1">발송시작 예정일</div>
						<div class="reward_reg_content_container2">
							<input type="text" placeholder="날짜를 선택하세요" name="opt_deliver_date" id="deliveryDate" class="form-control" style="width:60%;" autocomplete="off">
						</div>
					</div>
				
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default btn-simple" data-dismiss="modal">취소</button>
						<div class="divider"></div>
					<button type="button" class="btn btn-info btn-simple" id="optUptBtn">등록</button>
				</div>
			</div>
		</div>
	</div>
	</form>


	<br><br><br><br>

  	<c:set var="projectCode" value="${projectCode}"/>
  	<button class="btn btn-warning btn_custom" style="width:40%" onclick="javascript:go_ready('${projectCode}')">저장하기</button>

	<br><br><br><br>

	</div>
  	
  	</div>




	</div>
	        
	    </div>
	</div>
	<!-- end main -->
</body>

<script>
	$("#subBtn").click(function(){
		$("#OptUnitSubmitForm").submit();
	})
 	$("#optUptBtn").click(function(){
		$("#OptUnitUptSubmitForm").submit();
	})
	
	
 	$(".optUpt").on('click', function(event){
		$("#opt_code").val(event.target.dataset.opt_code);
		$("#opt_price").val(event.target.dataset.opt_price);
		$("#opt_title").val(event.target.dataset.opt_title);
		$("#opt_detail").val(event.target.dataset.opt_detail);
		$("#sel1").val(event.target.dataset.opt_condition);
		$("#opt_deliver").val(event.target.dataset.opt_deliver);
		$("#opt_max").val(event.target.dataset.opt_max);
		$("#deliveryDate").val(event.target.dataset.opt_deliver_date);
	});
		
	
	function go_ready(pro_code){
		if (confirm("저장 하시겠습니까?")){
			$(location).attr("href", "${path}/ProjectReg.do?method=projectManage&pro_code="+pro_code);	
		}
	}
	
	function deleteProOpt(opt_code){
		if (confirm("삭제 하시겠습니까?")){
			$(location).attr("href", "${path}/ProjectReg.do?method=deleteProOption&opt_code="+opt_code);	
		}		
	}
	
</script>

</html>