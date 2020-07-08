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
<link rel="stylesheet" href="${path }/css/shakeAndBounce.css" />
<script>
$(document).ready(function(){
	$('.main').addClass('bounce');
	setTimeout(()=>{
		$('.tim-container').removeClass('bounce');
	},500);
})
</script>
</head>
<body>
	<div class="main">
	    <div class="container tim-container" style="max-width:1200px; padding-top:100px">
	        <h1 class="text-center">회원가입</h1>
	        <h6 class="text-center">(*)는 필수정보 입니다.</h6>
	        <br><br><br>
	        <form action="${path }/insertMember.do">
	        <div class="row">
		        <div class="col-md-3"></div>
		        <div class="col-md-6">
		        	<div class="form-group">
					  <label for="email">이메일(*):</label>
					  <input type="text" class="form-control" id="email" name="mem_email">
					</div>
		        </div>
    		</div>
    		
    		<div id="emailCheck" class="row">
    			<div class="col-md-3"></div>
    			<div v-bind:style="{color:fontColor}" class="col-md-6" v-bind:class="{shaking:isShaking}">
    				{{msg}}
    			</div>
    		</div>
    		
    		<br>
    		<div class="row">
		        <div class="col-md-3"></div>
		        <div class="col-md-6">
		        	<div class="form-group">
					  <label for="name">이름(*):</label>
					  <input type="text" class="form-control" name="mem_name">
					</div>
		        </div>
    		</div>
    		<div id="nameChk" class="row">
    			<div class="col-md-3"></div>
    			<div style="color:red;" class="col-md-6" v-bind:class="{shaking:isShaking}">
    				{{msg}}
    			</div>
    		</div>
    		
    		<br>
	        <div class="row">
        		<div class="col-md-3"></div>
        		<div class="col-md-6">
        			<div class="form-group">
					  <label for="pwd">비밀번호(*):</label>
 					<input type="password" class="form-control" name="mem_pw">
					</div>
        		</div>
        	</div>
        	
        	<div class="row">
        		<div class="col-md-3"></div>
        		<div class="col-md-6">
        			<div class="form-group">
					  <label for="pwd">비밀번호확인(*):</label>
 					<input type="password" class="form-control" id="pwd">
					</div>
        		</div>
        	</div>
        	<div id="pwCheck" class="row">
    			<div class="col-md-3"></div>
    			<div v-bind:style="{color:fontColor}" class="col-md-6" v-bind:class="{shaking:isShaking}">
    				{{msg}}
    			</div>
    		</div>
        	<br>
        	
        	<div class="row">
        		<div class="col-md-3"></div>
        		<div class="col-md-6">
        			<div class="form-group">
				      <label for="sel1">관심 카테고리 설정(*):</label>
				      <select class="form-control" id="cate" name="mem_favor">
				        <option>교육·키즈</option>
				        <option>패션·잡화·뷰티</option>
				        <option>홈리빙·디자인소품</option>
				        <option>공연·컬쳐</option>
				        <option>스포츠·모빌리티</option>
				        <option>출판</option>
				        <option>반려동물</option>
				        <option>테크·가전</option>
				      </select>
 				     </div>
        		</div>
        	</div>
        	
        	<div id="emailAuth" v-if="isAuth">
        	<div class="row bounce" style="margin-top:10px;">
        		<div class="col-md-3"></div>
        		<div class="col-md-6">
        			<div class="form-group">
						<p style="color:green;">해당 이메일로 인증코드를 발송하였습니다.</p>
						<span>인증코드를 입력하여 회원가입을 완료해주세요.({{minutes}}:{{sec}})</span>
					</div>
        		</div>
        	</div>
        	<div class="row bounce">
        		<div class="col-md-3"></div>
        		<div class="col-md-6">
        			<div class="form-group">
					  <label for="auth">인증코드(*):</label>
 					<input type="text" v-model="myCode" class="form-control" id="auth">
					</div>
        		</div>
        	</div>
        	<div class="row bounce">
        		<div class="col-md-3"></div>
        		<div class="col-md-6">
        			<span v-if="msgOn" v-bind:class="{bounce:isBounce}" style="color:red;" class="bounce">인증번호를 다시 확인해주세요</span>
        		</div>
        	</div>
        	</div>
        	
        	<br>
        	<div class="row">
        		<div class="col-md-3"></div>
        		<div class="col-md-6">
        			<button type="button" class="btn btn-warning btn-lg" style="width:100%; background-color:rgb(255,150,0); color:white;">회원가입</button>
        		</div>
        	</div>
        	</form>
     	 </div>
	    </div>
	</div>
	<!-- end main -->
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script>
		//이메일 정규표현식
		function isEmail(asValue) {
	
			var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
			return regExp.test(asValue); // 형식에 맞는 경우 true 리턴	
	
		}
		
		//비밀번호 8자이상 영문숫자조합 정규표현식
		function isPassword(asValue) {

			var regExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^~*+=-])(?=.*[0-9]).{8,20}$/; //  8 ~ 20자 영문, 숫자, 특수문자 조합

			return regExp.test(asValue); // 형식에 맞는 경우 true 리턴

		}


		var vm=new Vue({
			el:'#emailCheck',
			data:{
				msg:"",
				isShaking:false,
				fontColor:"red"
			}
		});
		
		//이메일 검증
		$('input[name=mem_email]').on('focusout', (event)=>{
			if(event.target.value===''){
				vm.msg="이메일을 입력해주세요";
				vm.fontColor="red";
				vm.isShaking=true;
				setTimeout(()=>{
					vm.isShaking=false;
				},500);
			} else if(!isEmail(event.target.value)){
				event.target.value="";
				vm.msg="올바른 이메일 형식이 아닙니다.";
				vm.fontColor="red";
				vm.isShaking=true;
				setTimeout(()=>{
					vm.isShaking=false;
				},500);
			} else {
				$.ajax({
					type:"post",
					url:"${path}/signupIdCheck.do",
					data:$("input[name=mem_email]").serialize(),
					dataType:"json",
					success:function(data){
						if(data.verification===false){
							vm.msg="이미 등록된 이메일입니다.";
							vm.fontColor="red";
							vm.isShaking=true;
							setTimeout(()=>{
								vm.isShaking=false;
							}, 500);
							$("input[name=mem_email]").val("");
						} else {
							vm.msg="사용 가능한 이메일입니다.";
							vm.fontColor="green";
						}
					},
					error:function(err){
						console.log("ajax처리 에러");
						console.log(err);
					}
				});
			}
		});
		
		
		var vm2=new Vue({
			el:"#pwCheck",
			data:{
				isShaking:false,
				fontColor:"red",
				msg:""
			}
		});
		
		//패스워드 정규표현식 검증
		$('input[name=mem_pw]').on('focusout', (event)=>{
			if(!isPassword(event.target.value)){
				vm2.msg="비밀번호는 8~20자 영문과 숫자, 특수문자가 조합되어야 합니다.";
				event.target.value="";
				vm2.fontColor="red";
				vm2.isShaking=true;
				setTimeout(()=>{
					vm2.isShaking=false;
				}, 500);
			}
		});
		
		//패스워드 일치 체크
		$('#pwd').on('focusout', (event)=>{
			if($('input[name=mem_pw]').val()!==event.target.value){
				vm2.msg="비밀번호를 다시 확인해주세요";
				event.target.value="";
				vm2.fontColor="red";
				vm2.isShaking=true;
				setTimeout(()=>{
					vm2.isShaking=false;
				}, 500);
			} else if($('input[name=mem_pw]').val()===''){
				vm2.msg="";
			} else {
				vm2.msg="비밀번호가 일치합니다.";
				vm2.fontColor="green";
			}
		});
		
		var vm3 = new Vue({
			el:"#nameChk",
			data:{
				msg:"",
				isShaking:false,
			}
		});
		//회원 가입 서밋
		$('button').on('click', event=>{
			event.preventDefault();
			//이메일이 채워졌는가?
			if($('input[name=mem_email]').val()===''){
				vm.msg="이메일을 입력해주세요";
				vm.fontColor="red";
				vm.isShaking=true;
				setTimeout(()=>{
					vm.isShaking=false;
				},500);
			} else if($('input[name=mem_name]').val()===''){
				//이름이 빈칸인가?
				vm3.msg="이름을 입력해주세요";
				vm3.isShaking=true;
				setTimeout(()=>{
					vm3.isShaking=false;
				},500);
			} else if($('input[name=mem_pw]').val()===''){
				//비밀번호가 안채워져있는가?
				vm2.msg="비밀번호를 입력해주세요";
				vm2.isShaking=true;
				setTimeout(()=>{
					vm2.isShaking=false;
				},500);
			} else if($('#pwd').val()===''){
				//비밀번호가 확인 안채워져있는가?
				vm2.msg="비밀번호를 확인해주세요";
				vm2.isShaking=true;
				setTimeout(()=>{
					vm2.isShaking=false;
				},500);
			} else if($('select[name=mem_favor]').val()===''){
				alert("카테고리를 선택해주세요.");
			} else {
				//모든 조건 충족
				if(confirm('회원가입을 완료하시겠습니까?')){
					//이메일 인증
					if(!vm4.isAuth){
						//인증폼 on
						vm4.isAuth=true;
						//이메일 발송
						let _email=$('input[name=mem_email]').val();
						$.ajax({
							type:"post",
							url:"${path}/Mail.do?email="+_email,
							dataType:"text",
							success:function(data){
								console.log("이메일전송");
							},
							error:function(err){
								console.log("ajax처리 에러");
								console.log(err);
							}
						});
						
						
						
					} else {
						//이메일로 보낸 코드와 입력한 코드가 일치하는지 검증
						let _email=$('input[name=mem_email]').val();
						$.ajax({
							type:"post",
							url:"${path}/getMailCode.do?email="+_email,
							dataType:"json",
							success:function(data){
								console.log(data.code);
								console.log(vm4.myCode);
								if(Number(vm4.myCode)===data.code){
									alert("회원가입이 완료되었습니다.");
									$('form').submit();
								} else {
									vm4.msgOn=true;
									vm4.isBounce=true;
									setTimeout(()=>{
										vm4.isBounce=false;
									},1000);
								}
							},
							error:function(err){
								console.log("ajax처리 에러");
								console.log(err);
							}
						});
					}
				}
			}
		});
		
		//이름 작성하고 나오면 알림창 없앰
		$('input[name=mem_name]').on('focusout', ()=>{
			vm3.msg="";
		})
		
		//이메일인증
		var vm4= new Vue({
			el:"#emailAuth",
			data:{
				isAuth:false,
				count:180,
				counter:null,
				minutes:0,
				sec:0,
				myCode:null,
				isBounce:false,
				msgOn:false
			},
			watch:{
				isAuth:function(val){
					if(val===true){
						this.count=180;
						this.counter=setInterval(()=>{
							this.count=this.count-1;
						}, 1000);
					}
				},
				count:function(val){
					this.minutes=Math.floor(val/60);
					this.sec=val-this.minutes*60;
					if(this.count===0){
						alert("timeout!");
						this.isAuth=false;
						clearInterval(this.counter);
					}
				}
			},
		});
		
		
	</script>
</body>
</html>