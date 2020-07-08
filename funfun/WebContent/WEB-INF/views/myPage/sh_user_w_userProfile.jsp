<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<%@ include file="/template/header.jsp" %>
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/sh_user_w_userProfile.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css">
<link rel="stylesheet" href="css/toastr.css">
<script src="js/jquery.js"></script>	
<script src="js/toastr.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
toastr.options = {
	    "closeButton": false,
	    "debug": false,
	    "newestOnTop": false,
	    "progressBar": false,
	    "positionClass": "toast-top-right",
	    "preventDuplicates": false,
	    "onclick": null,
	    "showDuration": 800,
	    "hideDuration": 800,
	    "timeOut": 1500,
	    "extendedTimeOut": 1500,
	    "showEasing": "swing",
	    "hideEasing": "linear",
	    "showMethod": "fadeIn",
	    "hideMethod": "fadeOut"
	  }
		var mlist = "${mlist}";
		if(mlist ===''){
			window.location = "${path}/login.do";
			alert("로그인해주세요");
		}
		
		function goPopup(){
			var pop = window.open("jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 	
		}

		function jusoCallBack(roadFullAddr,zipNo){
			$("[name=pay_zipcode]").val(zipNo);
			$("[name=pay_addr]").val(roadFullAddr);
			
			
		}
		function changeImg(){
			$("[name=profileImg]").trigger("click");

		}
		$(document).ready(function(){
			
			var memFavor = "${mlist.memFavor}";
			var memFavorArray = memFavor.split(',');
			for(let i=0; i<memFavorArray.length; i++){
				$('input:checkbox[value=\"'+$(memFavorArray)[i]+'\"]').prop("checked", true);
			}
			
			
			
			var fileName = "${mlist.memProfile}"
			$("[name=memProfile]").val(fileName);
			
			$("input[type=file]").change(function () {
            	var fileInput = document.getElementById("myImage");
	            var files = fileInput.files;
	            var file;
	            for (var i = 0; i < files.length; i++) { 
	                file = files[i];
	                fileName=file.name;
	            }
	            $("[name=memProfile]").val("z01_upload/"+fileName);
	        });
			function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function(e) {
                        $('#imgId').attr('src', e.target.result);
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }

            $("#myImage").change(function() {
                readURL(this);
            });
            $("#submitBtn").click(function(){
            	$("#profileEditForm").submit();
            })
            
            $("#deleteProfile").click(function(){
            	$('#imgId').attr('src', '${path}/z01_upload/basicimage.png')
            })
		})
</script>
</head>
<body>
	<div class="main">
	    <div class="container tim-container" style="max-width:1200px; padding-top:100px">
			<div class="row">
			<div class="col-md-3"></div>
	    	<div class="profile col-md-6">
		    	<!-- 타이틀 -->
		    	<p class="profile__title">프로필 정보 설정</p>
		    	<p class="profile__img--title">프로필 사진</p>
		    	
		    	<!-- 이미지 -->
		    	<form id="profileEditForm" style="width:80%;margin-left:10%;margin-bottom:30px;" action="/funfun/profileEdit.do/changeProfile.do" method="POST" enctype="multipart/form-data">
		    	<img src="${path}/${mlist.memProfile}" id="imgId" style="border:1px solid gray;padding:5px;width:130px;height:130px;border-radius:100px;margin-top:20px;margin-left: 157px;margin-bottom:8px" class="profile__img"/>
		    	<div style="text-align:center;margin-bottom:50px;">
		    	<span onclick="changeImg()" class="profile__img-edit">바꾸기</span>
		    	
		    	<input style="display:none" type="file" id="myImage" class="custom-file-input" name="profileImg"/>
		    	
		    	<span id="deleteProfile" class="profile__img-edit">삭제</span>
		    	</div>
		    	
		    	<!-- 정보 입력 -->
		    		<p class="profile__innertitle">이메일 주소</p>
		    		
		    		<div style="display:flex;margin-bottom:60px;" class="profile__input">
		    		<input style="width:100%;height:40px;padding-left:10px;" name="email" value="${mlist.memEmail}" disabled>
					</div>
		    		
		    		
		    		<p class="profile__innertitle">주소</p>
		    		<div style="width:100%;margin-bottom:60px;">
		    		<input class="profile__input" value="${mlist.pay_zipcode}" style="width:30%;margin-bottom:15px;padding-left:10px;" name="pay_zipcode" readonly>
		    		<input class="profile__input" value="${mlist.pay_addr}" style="margin-bottom:15px;padding-left:10px;" name="pay_addr" readonly>
		    		<button type="button" onclick="goPopup()" style="margin-top:15px;width:100%;margin:0;border-radius:5px;height:40px;"class="profile__btn">주소검색</button>
		    		</div>
		    		
		    		<p class="profile__innertitle">관심사</p>
		    		<p class="profile__innertitle--subtitle" style="margin-bottom:20px;">최소 1개 이상의 관심사를 선택해주세요</p>
		    		
		    		<div style="display:flex">
		    		<div>  

					<div class="pretty p-icon p-jelly p-round p-bigger">
				        <input name="favorChk" type="checkbox" value="교육·키즈"/>
					        <div class="state p-warning">
					            <i class="icon material-icons">done</i>
					            	<label>교육·키즈</label>
				        </div>
			    	</div>
			    	<div class="pretty p-icon p-jelly p-round p-bigger">
				        <input name="favorChk" type="checkbox" value="패션·잡화·뷰티"/>
					        <div class="state p-warning">
					            <i class="icon material-icons">done</i>
					            	<label>패션·잡화·뷰티</label>
				        </div>
			    	</div><div class="pretty p-icon p-jelly p-round p-bigger">
				        <input name="favorChk" type="checkbox" value="홈리빙·디자인소품"/>
					        <div class="state p-warning">
					            <i class="icon material-icons">done</i>
					            	<label>홈리빙·디자인소품</label>
				        </div>
			    	</div><div class="pretty p-icon p-jelly p-round p-bigger">
				        <input name="favorChk" type="checkbox" value="공연·컬쳐"/>
					        <div class="state p-warning">
					            <i class="icon material-icons">done</i>
					            	<label>공연·컬쳐</label>
				        </div>
			    	</div>
					
					</div>
					
					<div style="margin-left : 150px;">
					
					<div class="pretty p-icon p-jelly p-round p-bigger">
				        <input name="favorChk" type="checkbox" value="스포츠·모빌리티"/>
					        <div class="state p-warning">
					            <i class="icon material-icons">done</i>
					            	<label>스포츠·모빌리티</label>
				        </div>
			    	</div>
					
					<div class="pretty p-icon p-jelly p-round p-bigger">
				        <input name="favorChk" type="checkbox" value="출판"/>
					        <div class="state p-warning">
					            <i class="icon material-icons">done</i>
					            	<label>출판</label>
				        </div>
			    	</div>
					
					<div class="pretty p-icon p-jelly p-round p-bigger">
				        <input name="favorChk" type="checkbox" value="반려동물"/>
					        <div class="state p-warning">
					            <i class="icon material-icons">done</i>
					            	<label>반려동물</label>
				        </div>
			    	</div>
					
					<div class="pretty p-icon p-jelly p-round p-bigger">
				        <input name="favorChk" type="checkbox" value="테크·가전"/>
					        <div class="state p-warning">
					            <i class="icon material-icons">done</i>
					            	<label>테크·가전</label>
				        </div>
			    	</div>
					
					</div>
					</div>
					
					<div style="display:flex;margin-top:60px;margin-bottom:80px;">
						<button onclick="window.history.back()" type="button" class="profile__cancle">취소</button>
						<input style="display:none;" type="hidden" name="memProfile">
						<button id="submitBtn" class="profile__submit" type="button">수정</button>
		    		</div>
	    		  	
		    	</form>
	    	</div>
	    	</div>
	    	<div class="col-md-3"></div>
	    </div>
	</div>
	<script src="js/sh_user_w_myPage.js"></script>
	<!-- end main -->
</body>
</html>