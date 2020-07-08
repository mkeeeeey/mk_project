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
<script src="ckeditor/ckeditor.js"></script>
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
				
	var ckeditor_config = {
			resize_enaleb : false,
			enterMode : CKEDITOR.ENTER_BR,
			shiftEnterMode : CKEDITOR.ENTER_P,
			filebrowserUploadUrl : "${path}/ProjectReg.do?method=storyImgUpload"
	};			
			
		
	CKEDITOR.replace("pro_story", ckeditor_config);
	
	
	})
	$("#subBtn").click(function(){
		$("#StorySubmitForm").submit();
	})	

</script>
</head>
<body>
	<div class="main">
	    <div class="container tim-container" style="max-width:1200px; padding-top:100px">

	<div class="row">

 	<jsp:include page="ht_user_w_MS_projectReg_menu.jsp"/>


  	<div class="col-sm-10" style="padding-left:30px;">
  	
  	<h3 style="font-weight:bolder">스토리 작성</h3>

  	<br><br>
  	
  	<span style="color:#787878;font-weight:bold;">메이커님의 프로젝트를 소개해보세요 :)</span>

  	<br><br><br><br>

	<div class="form-group">

	<c:set var="projectInfo" value="${projectInfo }"/>

	<form id="StorySubmitForm" method="post" action="${path}/ProjectReg.do">
	<input type="hidden" name="method" value="storyReg"/>
	<input type="hidden" name="pro_code" value="${projectInfo.pro_code}"/>
	
	<span class="reg_content_title">프로젝트 스토리 *</span><br><br>

	<textarea class="form-control" id="pro_story" name="pro_story">${projectInfo.pro_story }</textarea>

	<br><br><br><br>
	
  	<button class="btn btn-warning btn_custom" style="width:40%" id="subBtn">저장하기</button>

	</form>

	<br><br><br><br><br><br><br><br>

	</div>

  	
  	</div>


	</div>
	        
	    </div>
	</div>
	<!-- end main -->
</body>
</html>