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
		
			
	})
	
</script>
</head>
<body>
	<div class="main">
	    <div class="container tim-container" style="max-width:1200px; padding-top:100px">

	<div class="row">

 	<jsp:include page="ht_user_w_MS_projectReg_menu.jsp"/>


  	<div class="col-sm-10" style="padding-left:30px;">
  	
  	<h3 style="font-weight:bolder">위험요인 설계</h3>
  	
  	<br><br>
  	
  	<span class="sub_gray_font">
  	크라우드펀딩 특성상, 리워드 발송 예상 변동 기간에 대하여<br>
  	서포터에게 미리 알리고, 교환/펀딩금반환/AS 정책을 고지하여야 합니다.<br>
  	프로젝트 오픈 후에는 수정이 불가능 하니 신중하게 작성하세요.<br>
  	</span>

  	<br><br><br><br>

	<c:forEach var="risk" items="${riskList}">
		<div class="riskUnitContainer">
			<div class="riskUnitTitle">
				${risk.risk_title}
				<span class="navbar-right deleteX sub_gray_font" style="display:inline-block"  onclick="javascript:deleteProRisk('${risk.risk_code}')">x</span>
			</div>
			<div class="riskUnitDetail">${risk.risk_detail}</div>
			<button class="btn btn-warning btn_custom riskUpt navbar-right" 
			 		style="display:inline-block;width:40%;height:30px;margin-top:10px;padding:0;text-align:center;"
					data-toggle="modal"
					data-target="#myModalUpt"
					data-risk_code="${risk.risk_code}"
					data-risk_title="${risk.risk_title}"
					data-risk_detail="${risk.risk_detail}"
					> 리스크 수정</button>
		</div>
	</c:forEach>	


	<div class="form-group">

	<button class="btn btn-warning btn_custom" data-toggle="modal" data-target="#myModal">+ 추가하기</button>


	<form method="post" action="${path}/ProjectReg.do" id="RiskUnitSubmitForm">
	<input type="hidden" name="method" value="riskUnitReg"/>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding:30px 20px 20px 30px;">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				  	<h3 class="modal-title" id="myModalLabel" style="font-weight:bolder">위험요인 추가</h3>
				</div>
				<div class="modal-body" style="padding-left:70px;padding-right:70px;">
				
					<div class="reward_reg_subTitle">
						<div class="reward_reg_content_container1">위험내용 제목</div>
						<div class="reward_reg_content_container2">
							<input type="text" name="risk_title" class="form-control"/>
							<span class="sub_gray_font">xx자 남음</span>
						</div>
					</div>
				
					<div class="reward_reg_subTitle">
						<div class="reward_reg_content_container1">상세설명</div>
						<div class="reward_reg_content_container2">
							<textarea class="form-control" name="risk_detail"></textarea>
							<span class="sub_gray_font">xx자 남음</span>
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




	<form method="post" action="${path}/ProjectReg.do" id="RiskUnitUptForm">
	<input type="hidden" name="method" value="riskUnitUpt"/>
	<input type="hidden" name="risk_code" id="risk_code"/>

	<div class="modal fade" id="myModalUpt" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding:30px 20px 20px 30px;">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				  	<h3 class="modal-title" id="myModalLabel" style="font-weight:bolder">위험요인 수정</h3>
				</div>
				<div class="modal-body" style="padding-left:70px;padding-right:70px;">
				
					<div class="reward_reg_subTitle">
						<div class="reward_reg_content_container1">위험내용 제목</div>
						<div class="reward_reg_content_container2">
							<input type="text" name="risk_title" id="risk_title" class="form-control"/>
							<span class="sub_gray_font">xx자 남음</span>
						</div>
					</div>
				
					<div class="reward_reg_subTitle">
						<div class="reward_reg_content_container1">상세설명</div>
						<div class="reward_reg_content_container2">
							<textarea class="form-control" name="risk_detail" id="risk_detail"></textarea>
							<span class="sub_gray_font">xx자 남음</span>
						</div>
					</div>
				
				
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default btn-simple" data-dismiss="modal">취소</button>
						<div class="divider"></div>
					<button type="button" class="btn btn-info btn-simple" id="uptBtn">수정</button>
				</div>
			</div>
		</div>
	</div>

	</form>

	<br><br><br><br>

	  	<c:set var="projectCode" value="${projectCode}"/>
  	<button class="btn btn-warning btn_custom" style="width:40%"  onclick="javascript:go_ready('${projectCode}')">저장하기</button>

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
		$("#RiskUnitSubmitForm").submit();
	})

	$("#uptBtn").click(function(){
		$("#RiskUnitUptForm").submit();
	})

	function go_ready(pro_code){
		if (confirm("저장 하시겠습니까?")){
			$(location).attr("href", "${path}/ProjectReg.do?method=projectManage&pro_code="+pro_code);	
		}
	}
		
 	$(".riskUpt").on('click', function(event){
		$("#risk_code").val(event.target.dataset.risk_code);
		$("#risk_title").val(event.target.dataset.risk_title);
		$("#risk_detail").val(event.target.dataset.risk_detail);
	});

	function deleteProRisk(risk_code){
		if (confirm("삭제 하시겠습니까?")){
			$(location).attr("href", "${path}/ProjectReg.do?method=deleteProRisk&risk_code="+risk_code);	
		}		
	}

</script>

</html>