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
<script src="js/sh_user_w_myPage.js"></script>	
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
		var memEmail = "${memEmail}";
		var isNumCheck = 0;
		if(memEmail ===''){
			window.location = "${path}/login.do";
			alert("로그인해주세요");
		}

		 function openConfirm(){
			 if($("input:checkbox[name=favorChk]").is(":checked")){	 
				 $(".openConfirm").css('display','block')
				 Command: toastr["warning"]("인증번호가 메일로 발송되었습니다. 메일함을 확인해주세요");
				 setTimeout(sendMail, 1000);
			 }else{
				 Command: toastr["warning"]("탈퇴 전 유의사항을 확인해주세요");
			 }
		 }

		 function secessionFinal(memEmail){
			 if($("input:checkbox[name=favorChk]").is(":checked")){
				if(isNumCheck==1){
					var result = confirm('회원 탈퇴시 동일 이메일로 재가입 할수 없습니다. 정말 탈퇴하시겠습니까?'); 
					if(result) { 
						$("[name=memEmail]").val(memEmail)
						 $("form").submit();
						alert("탈퇴가 완료 되었습니다")
					} else {
						Command: toastr["warning"]("인증번호가 일치하지 않습니다");
					}
				}else{
					Command: toastr["warning"]("인증번호가 일치하지 않습니다");
				}
				  
			 
			 }else{
				 Command: toastr["warning"]("탈퇴 전 유의사항을 확인해주세요");
			 }
		 }
		 
		 //메일 발송 ajax
		 function sendMail(){	
				
				$.ajax({
					type:"post",
					url:"${path}/sendEmail.do",
					dataType:"json",
					async : false,
					success:function(data){
						$("#checkNum").click(function(){
							var num = $("#numInput").val()
							if(num==data.no){
								isNumCheck = 1;
								Command: toastr["warning"]("인증번호가 확인 되었습니다");
							}
						})

					},
					error:function(error){
						console.log("에러:"+error);
						
					}
				});
			}
			 
</script>
</head>
<body>
<form style="display:none;" action="/funfun/secession.do/finalPrc.do" method="POST">
<input type="hidden" name="memEmail">
</form>
	<div class="main">
	    <div class="container tim-container" style="max-width:1200px; padding-top:100px">
			<div class="row">
			<div class="col-md-3"></div>
	    	<div class="profile col-md-6">
	    	
	    	<p class="profile__title">회원탈퇴</p>
		    
		    <p class="profile__innertitle" style="color:black;font-size:15px;margin-top:40px;font-size:18px">탈퇴전, 꼭 확인하세요!</p>
		    <p class="profile__innertitle" style="font-size:14px;margin-top:5px;color:tomato">탈퇴 전 반드시 아래 유의사항을 확인하시기 바랍니다</p>
		    <hr>
		    
		    <p class="profile__innertitle" style="font-size:15px">탈퇴후 동일 이메일로 재가입 불가</p>
		    <hr>
		    
		    <p class="profile__innertitle" style="font-size:15px">탈퇴전 작성한 게시물은 삭제 불가</p>
		    <p class="profile__img--title" style="font-size:14px">문의글, 오픈한 프로젝트에 남겨진 이름 등 삭제 불가</p>
		    <hr>
		    
		    <p class="profile__innertitle" style="font-size:15px">미환급 투자금 불이익 감수</p>
		    <p class="profile__img--title" style="font-size:14px">아직 환급되지 않은 투자금이 있을때, 투자금을 돌려받지 못할 불이익과 위험 감수</p>
		    <hr>
		    
		    <p class="profile__innertitle" style="font-size:15px">탈퇴 후 재가입 시 신규 회원혜택 제한</p>
		    <p class="profile__img--title" style="font-size:14px">재가입 후 신규 회원혜택 및 제휴 프로모션 관련 혜택 지급 불가</p>
		    <hr>
		    
		    <p class="profile__innertitle" style="font-size:15px">예치금 불이익 감수</p>
		    <p class="profile__img--title" style="font-size:14px">계좌에 예치금이 남았을 경우 탈퇴시 돌려 받지 못할 위험 존재</p>
		    <hr>

		    <div class="pretty p-icon p-jelly p-round p-bigger">
		        <input name="favorChk" type="checkbox" value="secessionAgreement"/>
			        <div class="state p-warning">
			            <i class="icon material-icons">done</i>
			            	<label style="font-size:14px">상기 펀펀 탈퇴시 유의사항을 확인 했습니다</label>
		        </div>
			</div>
	    	
	    	<p class="profile__innertitle" style="margin-top:50px;font-size:18px;">본인확인</p>
		    <p class="profile__img--title" style="font-size:14px">안전한 탈퇴를 위해 본인 인증 절차를 진행합니다. 본인확인하기 버튼을 클릭해주세요</p>
	    	<button onclick="openConfirm()" type="button" id="personCheck" class="profile__submit" style="width:30%;margin:0;background-color:orange;color:white;margin-top:20px;font-size:14px;">본인 확인하기</button>
	    	<div class="openConfirm" style="display:none;">
		    	<div class="confirmInputDiv" style="display:flex;background-color:#f2f2f2;margin-top:20px;margin-bottom:10px;">
		    		<p class="mailInput" style="border:none;position:relative;top:14px;left:8px;padding-bottom:-5px;">${memEmail}</p>
		    		<button onclick="openConfirm()" type="button" style="height:35px;position:relative;top:7px;margin-left:84px;background-color:white;padding-left:8px;padding-right:8px;border:1px solid gray;border-radius:3px;color:gray;">재전송</button>
		    	</div>
		    	<div class="confirmInputDiv" style="display:flex;">
		    		<input id="numInput" style="height:35px;position:relative;top:7px;" class="confirmInput" placeholder="인증번호입력">
		    		<button id="checkNum" style="height:35px;position:relative;top:7px;margin-left:72px;background-color:gray;color:white;padding-left:8px;padding-right:8px;border:1px solid gray;border-radius:3px;" type="button">인증확인</button>
		    	</div>
	    	</div>
	    	<hr style="color:gray;">
	    	<button onclick="secessionFinal('${memEmail}')"type="button" class="profile__submit" style="width:30%;margin:0;background-color:red;color:white;border:red;font-size:14px;margin-bottom:30px;">회원탈퇴</button>
	    	
	    	</div>
	    	<div class="col-md-3"></div>
	    	</div>
	    </div>
	</div>
	
	<!-- end main -->
	
	
</body>
</html>