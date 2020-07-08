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
<link rel="stylesheet" href="css/mk_user_w_projectList.css">
<script>
	$(document).ready(function(){
		
		

		
		$("#newProRegBtn").click(function(){
			$(location).attr("href", "${path}/ProjectReg.do?method=ready")
		})			
		$("#makerInfoBtn").click(function(){
			$(location).attr("href", "${path}/MakerStudio.do?method=makerInfo")
		})		
		
	})
	
	function go_update(pro_code){
		$(location).attr("href", "${path}/ProjectReg.do?method=projectManage&pro_code="+pro_code)
	}

	function go_manage(pro_code){
		$(location).attr("href", "${path}/MakerStudio.do?method=proCurrnet&pro_code="+pro_code)
	}
</script>

</head>
<body>


	<div class="main">
    <div class="container tim-container" style="max-width:1200px; padding-top:100px; padding-bottom:50px;">
		<h3>${makerInfo.maker_name}님이 만든 프로젝트</h3>
		<span class="navbar-right" style="display:inline-block">
		<button id="newProRegBtn" class="btn btn-warning btn_custom">새 프로젝트 오픈</button>
		<button id="makerInfoBtn" class="btn btn-warning btn_custom">메이커 정보 변경</button>
		</span>
		<br><br><br><br><br>
		<div class="sub_gray_font">
		수정하기 - 프로젝트 오픈 신청이 완료되지 않았습니다. 프로젝트 신청을 완료해 주세요<br><br>
		프로젝트 관리 - 프로젝트 오픈 신청이 완료되었습니다. 프로젝트 현황 및 스토어 서비스를 관리할 수 있습니다.
		</div>
    </div>

	<div class="jumbotron" style="padding-bottom:50px;">
	<div class="container tim-container" style="max-width:1200px;background-color:#EEEEEE;"> 

	


 	<c:choose>
	
	<c:when test="${list==[] }">
		<span class="sub_gray_font_big">
		아직 등록한 프로젝트가 없습니다.<br>
		프로젝트 오픈 신청으로 프로젝트를 시작해 보세요 :)
		<br><br><br><br><br><br>
		</span>
	</c:when>

	<c:otherwise>	 
	<div class="row">
		
		<c:forEach var="proj" items="${list}">
		<c:set var="rate" value="${proj.pro_money/proj.pro_target*100}"/>
		
		<div class="col-xs-12 col-md-3 item">
			<div class="thumbnail projectList-item" style="">
				<c:choose>
					<c:when test="${proj.pro_reg_date==null}">
					<div class="myProjectFunction" onclick="javascript:go_update('${proj.pro_code}')">수정하기</div>
					</c:when>
					<c:otherwise>
					<div class="myProjectFunction" onclick="javascript:go_manage('${proj.pro_code}')">프로젝트 관리</div>
					</c:otherwise>
				</c:choose>
				<img src="${path}/${proj.pro_image}" onerror="this.src='img/img_alter.png'">
				<div class="caption proj-info">
					<p class="ProjectList-title">${proj.pro_title}</p>
					<div class="maker-info">
						<c:choose>
							<c:when test="${proj.cate_title!=null }">
							<span class="ProjectList-maker">${proj.cate_title} | ${proj.maker_name}</span>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
					</div>
					<div>
						<c:choose>
							<c:when test="${proj.pro_sub_date==null}">
							<span class="ProjectList-rate">펀딩 시작 전</span>
							</c:when>
							<c:otherwise>
							<span class="ProjectList-rate">모금율 : ${rate}%</span>
							</c:otherwise>
						</c:choose>
<!-- 					<c:choose>
						<c:when test="${proj.dday>0}">
							<span class="ProjectList-date">${proj.dday}일 남음</span>
						</c:when>
						<c:when test="${proj.dday<0}">
							<span class="ProjectList-date">펀딩 종료</span>
						</c:when>
						<c:when test="${proj.dday==0}">
							<span class="ProjectList-date">오늘 마감</span>
						</c:when>
					</c:choose>
 -->				</div>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>


 	</c:otherwise>
	</c:choose>
 
	</div>
	</div>


	    
	</div>
	
	
	<!-- end main -->
</body>



</html>