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
<script>

	$("#makerReg").click(function(){
		console.log("이거 찍힘???")
		$("form").submit();
	})

	$(':checkbox').checkbox('check');

</script>
</head>
<body>
	<div class="main">
	    <div class="container tim-container" style="max-width:1200px; padding-top:100px; height:1500px;">
	        
	        
	<h3>메이커 등록</h3>
	
	<br><br><br>

	<form method="post" action="${path}/MakerStudio.do">
	 
	<input type="hidden" name="method" value="makerReg_done" />

	<div class="form-group">
	
	<h5>메이커(기업)명 *</h5>

    <input type="text" name="maker_name" value="" placeholder="기업명을 입력하세요" class="form-control" style="width:800px;" />
	
	<br><br>
	
	<h5>개인/사업자 구분 *</h5>
	
	<select class="form-control" id="sel1" style="width:800px;" name="maker_type">
		<option>법인 사업자</option>
		<option>개인 사업자</option>
		<option>개인 </option>
	</select>
			
	<br><br>
	
	<h5>관리자 휴대폰 번호 *</h5>
    <input style="width:800px;display:inline-block;" type="text" value="" placeholder="휴대폰 번호를 입력하세요" class="form-control" name="mem_phoneno" />


	<br><br>
	

	<label class="checkbox" for="checkbox1">
	<input type="checkbox" value="" id="checkbox1" data-toggle="checkbox">(필수) 개인 정보 수집 동의<br>
	</label>
	<label class="checkbox" for="checkbox2">
	<input type="checkbox" value="" id="checkbox2" data-toggle="checkbox">(선택) 펀펀 메이커를 위한 뉴스레터 받기
	</label>
	        
	<br><br>
	
	<button class="btn btn-warning btn_custom" style="width:40%;" id="makerReg">시작하기</button>

	</div>
	</form>


	    </div>
	</div>
	<!-- end main -->
</body>
</html>