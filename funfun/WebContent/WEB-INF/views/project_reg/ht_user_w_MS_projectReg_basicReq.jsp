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
		

		$("#proCreateBtn").click(function(){
			if($('input[name=Q1]:checked').val()===undefined){
				alert("체크해주세요");
			} else {
				if($('input[name=Q1]:checked').val()==='option1'&&
						$('input[name=Q2]:checked').val()==='option1'&&
						$('input[name=Q3]:checked').val()==='option1'){	
						$(location).attr("href", "${path}/ProjectReg.do?method=proCreate")
				} else {
					alert("필수 동의 사항(*)에 모두 동의해야 합니다");
				}
			}
		})
			
				
	})
	
	$( function() {
		$( "#startDate" ).datepicker();
	} );	
	$( function() {
		$( "#finishDate" ).datepicker();
	} );	
	$( function() {
		$( ".widget input[type=submit], .widget a, .widget button" ).button();
		$( "button, input, a" ).click( function( event ) {
			event.preventDefault();
		} );
	} );	
</script>
</head>
<body>
	<div class="main">
	    <div class="container tim-container" style="max-width:1200px; padding-top:100px">

	<div class="row">

 	<jsp:include page="ht_user_w_MS_projectReg_menu.jsp"/>


  	<div class="col-sm-10" style="padding-left:30px;">
  	
  	<h3 style="font-weight:bolder">기본 요건 동의</h3>
  	
  	<br><br>
  	
  	<span class="sub_gray_font">
  		펀딩 진행을 위한 기본 요건을 확인하고자 합니다. 요건에 동의 하셔야 <br>
  		다음 신청 절차를 진행할 수 있습니다.<br>
  		답변 내용이 사실과 다른경우, 약정 위반에 따른 불이익일 발생할 수 있습니다.<br>
  	</span>

  	<br><br><br><br>

	<div class="form-group">
	
	
	<span class="reg_content_title">Q1.</span>
	<span class="sub_gray_font">
		리워드가 타 크라우드펀딩사 및 온라인 커머스, 자사 홈페이지 등 다른 판매처에서<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;유통된 적이 있거나 현재 유통중인가요?
	</span>

	<label class="radio">
	<input type="radio" name="Q1" data-toggle="radio"  value="option1">
	<i></i>아니요, 다른 곳에서 유통한 적이 없으며 펀펀을 통해 처음 선보이는 제품입니다(*).
	</label>
	<label class="radio">
	<input type="radio" name="Q1" data-toggle="radio"  value="option2">
	<i></i>예, 다른 곳에서 유통한 적이 있습니다. 또는 현재 유통 중입니다.
	</label>

	
	
	<br><br>

	
	<span class="reg_content_title">Q2.</span>
	<span class="sub_gray_font">리워드 관련 문제 발생 시 펀펀과는 무관한 내용에 대한 공지를 숙지하셨습니까?</span>

	<label class="radio">
	<input type="radio" name="Q2" data-toggle="radio"  value="option1">
	<i></i>예, 숙지 했습니다(*).
	</label>
	<label class="radio">
	<input type="radio" name="Q2" data-toggle="radio"  value="option2">
	<i></i>아니요, 숙지하지 않았습니다.
	</label>
	
	
	<br><br>

	
	<span class="reg_content_title">Q3.</span>
	<span class="sub_gray_font">펀펀의 수수료 정책에 동의하십니까?</span>

	<label class="radio">
	<input type="radio" name="Q3" data-toggle="radio"  value="option1">
	<i></i>예, 동의합니다(*).
	</label>
	<label class="radio">
	<input type="radio" name="Q3" data-toggle="radio"  value="option2">
	<i></i>아니요, 동의하지 않습니다.
	</label>
	
	
	<br><br>

	

	<br><br><br><br>
	
  	<button class="btn btn-warning btn_custom" id="proCreateBtn" style="width:40%">저장하기</button>
	
	</div>




  	
  	</div>




	</div>
	        
	    </div>
	</div>
	<!-- end main -->
</body>
</html>