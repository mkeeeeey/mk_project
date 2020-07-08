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

	<c:set var="pro" value="${projectInfo}"/>
	<c:set var="rate" value="${pro.pro_money/pro.pro_target*100 }"/>
	<c:set var="today" value="${today}"/>
	<c:set var="startDate" value="${startDate}"/>
	<c:set var="finishDate" value="${finishDate}"/>
	

	<fmt:parseDate var="pro_start_date" value="${pro.pro_start_date}" pattern="yyyy-MM-dd HH:mm:ss" />
	<fmt:parseDate var="pro_finish_date" value="${pro.pro_finish_date}" pattern="yyyy-MM-dd HH:mm:ss" />

 	
 	
 	<jsp:include page="ht_user_w_MS_menu.jsp"/>
 
 
  	<div class="col-sm-10" style="padding-left:30px;padding-right:200px;">
  	
  	<h3 style="font-weight:bolder">프로젝트 현황</h3>
  	
  	<br><br>
  	
  	<span class="sub_gray_font">현재 프로젝트 현황입니다</span>

  	<br><br><br><br>



	<div class="currentTitle">프로젝트 타이틀</div>
	<div class="currentDetail">${pro.pro_title }</div>
  	
  	<br><br>
	
	<div class="currentTitle">프로젝트 카테고리</div>
	<div class="currentDetail">${pro.cate_title }</div>
  	
  	<br><br>
	
	<div class="currentTitle">프로젝트 대표 이미지</div>
	<div class="currentDetail"><img src="${path}/${pro.pro_image }" style="width:300px"/></div>
  	
  	<br><br>
	
	<div class="currentTitle">프로젝트 시작 날짜</div>
	<div class="currentDetail"><fmt:formatDate value="${pro_start_date}" pattern="yyyy년 MM월 dd일"/></div>
  	
  	<br><br>
	
	<div class="currentTitle">프로젝트 종료 날짜</div>
	<div class="currentDetail"><fmt:formatDate value="${pro_finish_date}" pattern="yyyy년 MM월 dd일"/></div>
  	
  	<br><br>
	
	<div class="currentTitle">펀딩 목표 금액</div>
	<div class="currentDetail"><fmt:formatNumber type="number" maxFractionDigits="3" value="${pro.pro_target}"/>원</div>
  	
  	<br><br>
	
	<div class="currentTitle">현재 모금액</div>
	<div class="currentDetail"><fmt:formatNumber type="number" maxFractionDigits="3" value="${pro.pro_money}"/>원</div>
  	
  	<br><br>
	
	<div class="currentTitle">달성율</div>
	<div class="currentDetail">${rate}%</div>
  	
  	<br><br>
	
	<div class="currentTitle">현재 상태</div>

	<c:choose>
	<c:when test="${pro.pro_sub_date==null }">
		<div class="currentDetail">프로젝트 신청 완료, 프로젝트가 승인되지 않았습니다. 프로젝트 삭제 신청을 할 수 있습니다.</div>
  	</c:when>
	<c:when test="${startDate>today}">
		<div class="currentDetail">프로젝트 승인 완료, 펀딩 시작 날짜부터 펀딩을 시작합니다.</div>
  	</c:when>
	<c:when test="${startDate<=today && today<=finishDate}">
		<div class="currentDetail">펀딩 진행 중, 펀딩 종료일까지 펀딩을 진행합니다.</div>
  	</c:when>
	<c:otherwise>
		<c:choose>
			<c:when test="${rate<100 }">
				<div class="currentDetail">펀딩 종료, 펀딩이 종료되었으나, 목표 펀딩금액을 달성하지 못했습니다.</div>
		  	</c:when>
		  	<c:otherwise>
				<div class="currentDetail">펀딩 종료, 펀딩이 성공하였습니다. 스토어 오픈을 신청할 수 있습니다.</div>
	  		</c:otherwise>
	  	</c:choose>
  	</c:otherwise>	
	</c:choose>
	
	<div class="currentDetail"></div>
  	

	<br><br><br><br><br><br><br><br>

  	</div>

	</div>


	        
	    </div>
	</div>
	<!-- end main -->
</body>
<script>
console.log("${nowDate}");
console.log("${pro_start_date}");
console.log("${pro_finish_date}");
var startDateStr="${pro_start_date}";
</script>
</html>

