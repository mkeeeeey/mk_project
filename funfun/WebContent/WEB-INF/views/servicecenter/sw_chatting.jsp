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
<title>실시간 채팅 상담</title>
<link href="${path }/template/bootstrap3/css/bootstrap.css" rel="stylesheet" />
<link href="${path }/template/bootstrap3/css/font-awesome.css" rel="stylesheet" />
   
<link href="${path }/template/assets/css/gsdk.css" rel="stylesheet" />   
<link href="${path }/template/assets/css/demo.css" rel="stylesheet" /> 
  <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	  crossorigin="anonymous"></script>
	<script src="${path }/template/assets/js/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script>
	<script src="${path }/template/bootstrap3/js/bootstrap.js" type="text/javascript"></script>
	<script src="${path }/template/assets/js/gsdk-checkbox.js"></script>
	<script src="${path }/template/assets/js/gsdk-radio.js"></script>
	<script src="${path }/template/assets/js/gsdk-bootstrapswitch.js"></script>
	<script src="${path }/template/assets/js/get-shit-done-header.js"></script>
  <script src="${path }/template/assets/js/custom.js"></script>

<link href="${path }/css/sw_user_w_chat.css" rel="stylesheet" /> 
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>
		var wsocket;
		$("h2").text("채팅 시작");
		
		// 화면 크기 고정
		$(window).resize(function(){
			window.resizeTo(400,680);
		});
		
		
		// 채팅 데이터 호출
		var rtqna_code = "${rtqna.rtqna_code}";
		var mem_code = "${rtqna.mem_code}";
		var rtqna_writer = "${user.mem_code}";
		var mem_name = "${rtqna.mem_name}";
		if(rtqna_writer == "") rtqna_writer = "${manager.admin_code}"; 
		var rtqna_time = "";
		
		$.ajax({
			type:"post",
			url:"${path}/rtqna.do?method=ajaxdetail&mem_code="+mem_code,
			dataType:"json",
			success:function(data){
				var list = data.list;
				var show = "";
				$.each(list,function(idx,rtqna){
					console.log("rtqna_time:"+rtqna.rtqna_time)
					if(rtqna_time != rtqna.rtqna_time){
						rtqna_time = rtqna.rtqna_time;
						show += "<div class='sc-message text-center'>"
						show += "<p style='margin-left:60px'>------- "+rtqna_time+" -------</p></div>"
					}
					show += "<div class='sc-message'>";
					
					// 작성자가 회원인지? 관리자인지?
					if(rtqna_writer == mem_code){
						// 회원이면 회원이 sent, 관리자가 received
						if(mem_code == rtqna.rtqna_writer){
							show += "	<div class='sc-message--content sent'>";
						}else{
							show += "	<div class='sc-message--content received'>";
						}
					}else{
						// 관리자이면 회원이 received, 관리자가 sent
						if(mem_code  == rtqna.rtqna_writer){
							show += "	<div class='sc-message--content received'>";
						}else{
							show += "	<div class='sc-message--content sent'>";
						}
					}
					show += "		<div class='sc-message--avatar' ></div>";
					show += "		<div class='sc-message--text'>";
					show += "			<span class='Linkify'>"+rtqna.rtqna_detail+"</span>";
					show += "		</div></div></div>";
				});
				$(".sc-message-item").html(show);
				var mx = parseInt($(".sc-message-item").height());
				$(".sc-message-list").scrollTop(mx);
			},
			error:function(err){
				console.log(err);
			}
		});
		
		start();
		function start(){
			// (송우 PC:192.168.4.34) (선생님 PC:211.238.140.48) (민기 PC:192.168.4.20)
			wsocket = new WebSocket("ws://192.168.4.34:5080/${path}/chat-ws.do");
			wsocket.onopen=function(evt){
				console.log(evt);
			};
			wsocket.onmessage=function(evt){
				var data = evt.data;
				var content = data.split(':');
				if(content[0] == mem_code){
					//$(location).attr("href","");
					var show = $(".sc-message-item").html();
					var date = new Date();
					var yyyy = date.getFullYear()
					var mm = date.getMonth()+1; if(mm<10) mm = "0"+mm;
					var dd = date.getDate(); if(dd<10) dd = "0"+dd;
					var curDate = yyyy+"-"+mm+"-"+dd;
					if(rtqna_time != curDate){
						show += "<div class='sc-message text-center'>"
						show += "<p style='margin-left:60px'>------- "+curDate+" -------</p></div>"
					}
					show += "<div class='sc-message'>";
					if(content[1] == rtqna_writer){
						show += "	<div class='sc-message--content sent'>";
					}else{
						show += "	<div class='sc-message--content received'>";
					}
					show += "		<div class='sc-message--avatar' ></div>";
					show += "		<div class='sc-message--text'>";
					show += "			<span class='Linkify'>"+content[2]+"</span>";
					show += "		</div></div></div>";
					$(".sc-message-item").html(show);
					var mx = parseInt($(".sc-message-item").height());
					$(".sc-message-list").scrollTop(mx);
				}
			};
			wsocket.onclose=function(){
				recieveMsg("연결을 종료했습니다.");
			};
		};
		
		
		$("#sendBtn").click(function(){
			var textLength = $("#msg").text().length;
			if(maxLengthCheck(textLength,300)){
				sendMsg();
			}
		});
		$("#msg").keyup(function(e){
			var textLength = $("#msg").text().length;
			$(".textLengthCk").text(textLength);
			if(maxLengthCheck(textLength,300)){
				if(e.keyCode==13){
					sendMsg();
				}
			}
		});
		function sendMsg(){
			var text = ""+$("#msg").text();
			if(text != ""){
				$("[name=rtqna_writer]").val(rtqna_writer);
				$("[name=rtqna_detail]").val(text);
				
				$("form").attr("action","${path}/rtqna.do?method=insert");
				$("form").submit();
				
				wsocket.send(mem_code+":"+rtqna_writer+":"+text);
			}
		}
		
		// 입력 글자수 체크
		function maxLengthCheck(textLength, maxLength){
			if(textLength > Number(maxLength)) {
		    	alert("입력가능문자수를 초과하였습니다.");
		    	return false;
		    }else {
		    	return true;
		    }
		}
		
		
		$(".exitBtn").click(function(){
			self.opener = self;
			window.close();
		});
		
	});
	
	
	
	
	
</script>
</head>
<body>
<div class="sc-chat-window" style="z-index:10;">
	<div class="sc-header">
		<img class="sc-header--img" src="${user.mem_profile}" 
			onerror="this.src='https://stickershop.line-scdn.net/stickershop/v1/product/1629282/LINEStorePC/main.png;compress=true'"/>
		<div class="sc-header--team-name">${rtqna.mem_name}
		</div>
		<div class="sc-header--close-button exitBtn">
			<img src="img/close-icon.png">
		</div>
	</div>
	<div class="sc-message-list">
		<div class="sc-message-item">
		</div>
	</div>
	<div class="sc-user-input">
		<form method="post">
			<input type="hidden" name="rtqna_code" value="${rtqna.rtqna_code}" />
			<input type="hidden" name="mem_code" value="${rtqna.mem_code}" />
			<input type="hidden" name="mem_name" value="${rtqna.mem_name}"/>
			<input type="hidden" name="rtqna_writer" />
			<input type="hidden" name="rtqna_detail" />
		</form>
		<div role="button" tabindex="0" contenteditable="true" id="msg"
			placeholder="내용을 적어주세요." class="sc-user-input--text"></div>
		<div class="sc-user-input--button" style="margin-left:30px" id="sendBtn">
			<button class="sc-user-input--send-icon-wrapper">
				<img class="sc-user-input--send-icon" src="img/send-message.png" />
			</button>
		</div>
		<div>
			<p style="font-size: 12px;margin-top: 20px;margin-left: 13px;">
				<span class="textLengthCk">0</span> / 300</p>
		</div>
	</div>
</div>
</body>
</html>