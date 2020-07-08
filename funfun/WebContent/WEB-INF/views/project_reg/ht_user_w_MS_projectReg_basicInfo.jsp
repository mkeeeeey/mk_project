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
<script src="js/bootstrap-datepicker.js"></script>
<!-- <script src="js/datepicker-ko.js"></script>  -->
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
		
		
		$("#subBtn").click(function(){
			$("#basicInfoForm").submit();
		});
		
		
		$( "#startDate" ).datepicker({format:'yyyy/mm/dd',minDate:'+7'});
		$( "#finishDate" ).datepicker({format:'yyyy/mm/dd'});

	})
	
		
	$( function() {
		$( ".widget input[type=submit], .widget a, .widget button" ).button();
		$( "button, input, a" ).click( function( event ) {
		} );
	} );	
	
</script>
</head>
<body>
	<div class="main">
	    <div class="container tim-container" style="max-width:1200px; padding-top:100px">

	<div class="row">

 
 	<jsp:include page="ht_user_w_MS_projectReg_menu.jsp"/>
 
 
	<form method="post" id="basicInfoForm" enctype="multipart/form-data" action="${path}/ProjectReg.do">

	<input type="hidden" name="method" value="basicInfoReg"/>
	
  	<div class="col-sm-10" style="padding-left:30px;">
  	
  	<h3 style="font-weight:bolder">기본 정보</h3>
  	
  	<br><br>
  	
  	<span class="sub_gray_font">프로젝트를 대표할 주요 기본 정보를 입력하세요</span>

  	<br><br><br><br>



	<div class="form-group">
	
	<c:set var="projectInfo" value="${projectInfo }"/>

	<c:choose>

	<c:when test="${projectInfo!=null }"> 
	
	<span class="reg_content_title">프로젝트 제목 *</span><br><br>

    <input type="text" name="pro_title" value="${projectInfo.pro_title}" placeholder="프로젝트 제목을 입력하세요" class="form-control" style="width:60%;" required/>
	
	
	<br><br>

	<span class="reg_content_title">목표 금액 *</span><br><br>

 
    <input type="text" name="pro_target" value="${projectInfo.pro_target}" placeholder="목표 금액을 숫자로 입력하세요" class="form-control" style="width:60%;" required/>
    

	<br><br>	
	
	<span class="reg_content_title">대표 이미지 *</span><br><br>
	
	<c:if test="${projectInfo.pro_image!=null and projectInfo.pro_image!=''}">
	<img src="${path}/${projectInfo.pro_image}"/>
	<br><br>
	</c:if>
	
	<div class="btn btn-warning btn_custom"> 
	    <label for="projectImg">스토어 이미지 수정</label>
	    <input type="file" id="projectImg" name="projectImg" accept=".gif, .jpg, .png" style="display:hidden;">
	</div>	 
	
	<br>
	
	<span class="sub_gray_font">&nbsp&nbsp&nbsp GIF, JPG, PNG 파일만 등록 가능합니다.</span>
	
	<br><br><br>
	
	<span class="reg_content_title">카테고리 *</span><br><br>

	<select class="form-control" id="sel1" style="width:60%;" name="cate_title">
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
	
	<span class="reg_content_title">프로젝트 시작 예정일 *</span><br><br>

	<input type="text" placeholder="날짜를 선택하세요" name="pro_start_date" value="${projectInfo.pro_start_date}" id="startDate" class="form-control" style="width:60%;" required >
	
	<br><br>
	
	<span class="reg_content_title">프로젝트 종료일 *</span><br><br>

	
	<input type="text" placeholder="날짜를 선택하세요" name="pro_finish_date" value="${projectInfo.pro_finish_date}" id="finishDate" class="form-control" style="width:60%;" required >
	
    	
	<br><br>
	
	<span class="reg_content_title">검색용 태그 *</span><br><br>

    <input type="text" name="pro_keyword" value="${projectInfo.pro_keyword}" placeholder="기업명을 입력하세요" class="form-control" style="width:800px;" required />
	

	</c:when>




	<c:otherwise>


	<span class="reg_content_title">프로젝트 제목 *</span><br><br>

    <input type="text" name="pro_title" value="" placeholder="프로젝트 제목을 입력하세요" class="form-control" style="width:60%;" required/>
	
	
	<br><br>

	<span class="reg_content_title">목표 금액 *</span><br><br>

 
    <input type="text" name="pro_target" value="" placeholder="목표 금액을 숫자로 입력하세요" class="form-control" style="width:60%;" required/>

	<br><br>	
	
	<span class="reg_content_title">대표 이미지 *</span><br><br>

	<div class="btn btn-warning btn_custom"> 
	    <label for="projectImg">스토어 이미지 업로드</label>
	    <input type="file" id="projectImg" name="projectImg" accept=".gif, .jpg, .png" style="display:hidden;">
	</div>	 
	
	<br><br>
	
	<span class="sub_gray_font">&nbsp&nbsp&nbsp&nbsp&nbsp GIF, JPG, PNG 파일만 등록 가능합니다.</span>
	
	<br><br><br>
	
	<span class="reg_content_title">카테고리 *</span><br><br>

	<select class="form-control" id="sel1" style="width:60%;" name="cate_title">
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
	
	<span class="reg_content_title">프로젝트 시작 예정일 *</span><br><br>

	<input type="text" placeholder="날짜를 선택하세요" name="pro_start_date" id="startDate" class="form-control" style="width:60%;" autocomplete="off" required >
	
	<br><br>
	
	<span class="reg_content_title">프로젝트 종료일 *</span><br><br>

	<input type="text" placeholder="날짜를 선택하세요" name="pro_finish_date" id="finishDate" class="form-control" style="width:60%;" autocomplete="off" required >

    	
	<br><br>
	
	<span class="reg_content_title">검색용 태그 *</span><br><br>

    <input type="text" name="pro_keyword" value="" placeholder="기업명을 입력하세요" class="form-control" style="width:800px;" required />
	


	</c:otherwise>


	</c:choose>



	<br><br><br><br>
	
  	<button class="btn btn-warning btn_custom" style="width:40%" id="subBtn">저장하기</button>
	
	</div>

	
	<br><br><br><br>

  	
  	</div>

	</form>

	</div>
	        
	    </div>
	</div>
	<!-- end main -->
</body>
</html>