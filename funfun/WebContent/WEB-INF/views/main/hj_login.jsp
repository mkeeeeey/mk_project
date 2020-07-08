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
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
		
</script>
<style>
.shaking {
  /* Start the shake animation and make the animation last for 0.5 seconds */
  animation: shake 0.5s;

  /* When the animation is finished, start again */
  animation-iteration-count: infinite;
}

@keyframes shake {
  0% { transform: translate(1px, 1px) rotate(0deg); }
  10% { transform: translate(-1px, -2px) rotate(-1deg); }
  20% { transform: translate(-3px, 0px) rotate(1deg); }
  30% { transform: translate(3px, 2px) rotate(0deg); }
  40% { transform: translate(1px, -1px) rotate(1deg); }
  50% { transform: translate(-1px, 2px) rotate(-1deg); }
  60% { transform: translate(-3px, 1px) rotate(0deg); }
  70% { transform: translate(3px, 1px) rotate(-1deg); }
  80% { transform: translate(-1px, -1px) rotate(1deg); }
  90% { transform: translate(1px, 2px) rotate(0deg); }
  100% { transform: translate(1px, -2px) rotate(-1deg); }
}
.bounce{
	animation:BounceIn 500ms;
}

@keyframes BounceIn{
	0%{
		transform:scale(1.1);
		opacity:0.3;
	}
	100%{
		transform:scale(1);
		opacity:1;
	}
}
</style>

<script>
	$(document).ready(function(){
		$('.main').addClass('bounce');
		setTimeout(()=>{
			$('.main').removeClass('bounce');
		},500);
	})
</script>
</head>
<body>
	<div class="main">
	    <div class="container tim-container" style="max-width:1200px; padding-top:100px">
	        <h1 class="text-center">로그인</h1>
	        <br><br><br>
	        <form>
	        <input type="hidden" name="redirectAddress">
	        <div class="row">
		        <div class="col-md-4"></div>
		        <div class="col-md-4">
		        	<div class="form-group">
					  <label for="usr">이메일:</label>
					  <input type="text" name="mem_email" class="form-control" id="usr">
					</div>
		        </div>
    		</div>
	        <div class="row">
        		<div class="col-md-4"></div>
        		<div class="col-md-4">
        			<div class="form-group">
					  <label for="pwd">Password:</label>
 					<input type="password" name="mem_pw" class="form-control" id="pwd">
					</div>
        		</div>
        	</div>
        	<div class="row">
        		<div class="col-md-4"></div>
        		<div class="col-md-4">
        			<div id="resultMsg" v-bind:class="{shaking:isShaking}" style="width:100%; color:red;">{{msg}}</div>
        		</div>
        	</div>
        	<br>
        	<div class="row">
        		<div class="col-md-4"></div>
        		<div class="col-md-4">
        			<a href="${path}/findaccount.do" style="font-decoration:none; color:black;">아이디/비밀번호 찾기</a>
        			<a href="${path }/signup.do" class="navbar-right" style="font-decoration:none; color:black;">회원가입</a>
        		</div>
        	</div>
        	<br>
        	<div class="row">
        		<div class="col-md-4"></div>
        		<div class="col-md-4">
        			<button id="loginBtn" type="button" class="btn btn-warning btn-lg" style="width:100%; background-color:rgb(255,150,0); color:white;">로그인</button>
        		</div>
        	</div>
        	</form>
     	 </div>
	    </div>
	</div>
	<!-- end main -->
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script>
		var vm = new Vue({
			el:'#resultMsg',
			data:{
				msg:"",
				isShaking:false
			}
		});
		
		function loginTry(){
			if($('input[name=mem_email]').val()===''){
				vm.msg="아이디를 입력해주세요";
				vm.isShaking=true;
				setTimeout(()=>{
					vm.isShaking=false;
				}, 500);
			} else if($('input[name=mem_pw]').val()===''){
				vm.msg="비밀번호를 입력해주세요";
				vm.isShaking=true;
				setTimeout(()=>{
					vm.isShaking=false;
				}, 500);
			} else {
				$.ajax({
					type:"post",
					url:"${path}/verification.do",
					data:$("form").serialize(),
					dataType:"json",
					success:function(data){
						if(data.verification===0){
							vm.msg="올바른 아이디/비밀번호를 입력해주세요.";
							vm.isShaking=true;
							setTimeout(()=>{
								vm.isShaking=false;
							}, 500);
						} else if(data.verification===-1){
							vm.msg="사용이 중지된 계정입니다.";
							vm.isShaking=true;
							setTimeout(()=>{
								vm.isShaking=false;
							}, 500);
						} else{
							$('[name=redirectAddress]').val(document.referrer);
							window.location="${path}/loginSuccess.do?"+$("form").serialize();
						}
					},
					error:function(err){
						console.log("ajax처리 에러");
						console.log(err);
					}
				});
			}
		}
		$('#loginBtn').on('click', loginTry);
		$('input[name=mem_email]').on('keyup', event=>{
			if(event.keyCode===13){
				loginTry();
			}
		});
		$('#pwd').on('keyup', event=>{
			if(event.keyCode===13){
				loginTry();
			}
		});
		
	</script>
</body>
</html>