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
<script src="ckeditor/ckeditor.js"></script>
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
		
		
	var ckeditor_config = {
			resize_enaleb : false,
			enterMode : CKEDITOR.ENTER_BR,
			shiftEnterMode : CKEDITOR.ENTER_P,
			filebrowserUploadUrl : "${path}/Store.do?method=storeStoryImgUpload"
	};			
			
		
	CKEDITOR.replace("sto_detai", ckeditor_config);
	
	$("#subBtn").click(function(){
		$("#basicInfoForm").submit();
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
  	
  	<h3 style="font-weight:bolder">스토어 기본 사항 등록</h3>
  	
  	<br><br>
  	
  	<span class="sub_gray_font">등록할 스토어의 기본 사항을 입력해 주세요</span>

  	<br><br><br><br>
  	
  	<c:set var="sto" value="${storeInfo}"/>

	<form method="post" enctype="multipart/form-data" id="basicInfoForm" action="${path}/Store.do">

	<input type="hidden" name="method" value="storeBasicInfoReg"/>

	<div class="form-group">
	
	
	<span class="reg_content_title">스토어 이름 *</span><br><br>

    <input type="text" name="sto_title" value="${sto.sto_title}" placeholder="스토어  이름을 입력하세요" class="form-control" style="width:60%;" />
	
	
	<br><br>

	<span class="reg_content_title">스토어 이미지 *</span><br><br>

	<div class="btn btn-warning btn_custom"> 
		<c:if test="${sto.sto_image!=null }">
		<img src="${path}/${sto.sto_image}/">
		</c:if>
	    <label for="storeImg">스토어 이미지 업로드</label>
	    <input type="file" id="storeImg" name="storeImg" accept=".gif, .jpg, .png" style="display:hidden;">
	</div>	
		
	<br><br><br>

	<span class="reg_content_title">스토어 상세 설명 *</span><br><br>

	<textarea class="form-control" id="sto_detai" name="sto_detai">${sto.sto_detai}</textarea>
	

	<br><br>

	
	<span class="reg_content_title">카테고리 *</span><br><br>

	<select class="form-control" id="sel1" style="width:60%;" name="sto_cate">
		<option>교육·키즈</option>
		<option>패션·잡화·뷰티</option>
		<option>홈리빙·디자인소품</option>
		<option>공연·컬쳐</option>
		<option>스포츠·모빌리티</option>
		<option>출판</option>
		<option>반려동물</option>
		<option>테크·가전</option>
	</select>
	<br><br>
	
	
	<span class="reg_content_title">스토어 물품 최저 가격*</span><br><br>

    <input type="text" name="sto_price" value="${sto.sto_price}" placeholder="가격을 입력하세요" class="form-control" style="width:800px;" />
	

	<br><br><br><br>
	
  	<button class="btn btn-warning btn_custom" style="width:40%" id="subBtn">저장하기</button>
	
	</div>
	
	</form>
	
	</div>

	</div>
	        
	    </div>
	</div>
	<!-- end main -->
</body>
</html>