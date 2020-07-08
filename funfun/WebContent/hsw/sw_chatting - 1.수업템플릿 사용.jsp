<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path }/template/bootstrap3/css/bootstrap.css" rel="stylesheet" />
<link href="${path }/template/bootstrap3/css/font-awesome.css" rel="stylesheet" />
   
<link href="${path }/template/assets/css/gsdk.css" rel="stylesheet" />   
<link href="${path }/template/assets/css/demo.css" rel="stylesheet" /> 
<style type="text/css">
	#chatArea{
		height:200px; border: 1px solid green;
		overflow-y:auto; text-align:left;
	}
	
</style>
  <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	  crossorigin="anonymous"></script>
	<script src="${path }/template/assets/js/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script>
	<script src="${path }/template/bootstrap3/js/bootstrap.js" type="text/javascript"></script>
	<script src="${path }/template/assets/js/gsdk-checkbox.js"></script>
	<script src="${path }/template/assets/js/gsdk-radio.js"></script>
	<script src="${path }/template/assets/js/gsdk-bootstrapswitch.js"></script>
	<script src="${path }/template/assets/js/get-shit-done-header.js"></script>
  <script src="${path }/template/assets/js/custom.js"></script>


<link href="${path }/css/sw_user_w_notice.css" rel="stylesheet" />
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>
		var wsocket;
		$("h2").text("채팅 시작");
		
		// 화면 크기 고정
		$(window).resize(function(){
			//window.resizeTo(800,700);
		});
		
		
		
		$("#sendBtn").click(function(){
			sendMsg();
		});
		$("#msg").keyup(function(e){
			if(e.keyCode==13){
				sendMsg();
			}
		});
		function sendMsg(){
			alert("전송");
			var id = $("#id").val();	// 보내는 사람 id
			var msg = $("#msg").val();	// 보내는 메시지
			wsocket.send("msg:"+id+": "+msg);
			$("#msg").val("");
			$("#msg").focus();
		}
		
		$("#enterBtn").click(function(){
			if(confirm("채팅창 접속합니다!!")){
				// (내 PC:192.168.4.34) (선생님 PC:211.238.140.48) (민기 PC:192.168.4.20)
				// 0. 접속
				wsocket = new WebSocket("ws://192.168.4.34:5080/${path}/chat-ws.do");
				// 1. 접속 처리 후, 처리할 메서드.
				wsocket.onopen=function(evt){
					console.log(evt);
					recieveMsg("연결되었습니다.");
				};
				// 2. 메세지를 전송해주고, 전송 받을 때 처리 내용.
				wsocket.onmessage=function(evt){
					var data = evt.data;
					if(data.substring(0,4) == "msg:"){
						revMsg = data.substring(4);
						recieveMsg(revMsg);
					}
				};
				// 3. 접속 종료 후, 처리할 메서드.
				wsocket.onclose=function(){
					recieveMsg("연결을 종료했습니다.");
				};
				
			}
		});
		// 메시지 처리 메소드(전송 온 메시지를 화면에서 추가 처리)
		function recieveMsg(revMsg){
			$("#chatMessageArea").append(revMsg+"<br>");
		}
		
		$("#exitBtn").click(function(){
			alert("나가기");
		});
		
	});
</script>
</head>
<body>
	<div class="main">
		<div class="jumbotron text-center">
			<h2></h2>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-1">
					<span>아이디</span>
				</div>
				<div class="col-md-8">
					<input id="id" class="form-control" placeholder="접속할 아이디를 입력하세요" />
				</div>
				<div class="col-md-3">
					<input type="button" class="btn btn-info"
						value="채팅입장" id="enterBtn"/>
					<input type="button" class="btn btn-success"
						value="나가기" id="exitBtn"/>
				</div>	
			</div>
			<div class="row">	
				<div class="col-md-1">
					<span>메시지</span>
				</div>
				<div  class="col-md-8">
					<input id="msg" class="form-control" 
					placeholder="보낼 메시지 입력하세요." />	
				</div>
				<div  class="col-md-3">
					<input type="button" class="btn btn-info"
					value="전송" id="sendBtn"/>
				</div>
			</div>
			<div class="row">	
				<div class="col-md-1">
					<span>내 용</span>
				</div>
				<div id="chatArea" class="input-group-append col-md-11">
					<div id="chatMessageArea">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end main -->
</body>
</html>