<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/template/header.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path }/css/sw_user_w_notice.css" rel="stylesheet" />
<script>
	$(document).ready(function(){
		var mem_code = "${mem_code}";
		console.log(mem_code);
		$.ajax({
			type:"post",
			url:"${path}/rtqna.do?method=ajaxdetail&mem_code="+mem_code,
			dataType:"json",
			success:function(data){
				var list = data.list;
				$("h3").text("data.list.lenght:"+list.length);
				var show = $(".table").html();
				$.each(list,function(idx,rtqna){
					if(rtqna.rtqna_writer == mem_code){
						show += '<tr><td>'+rtqna.name+'</td>';
						show += '<td style="background-color:skyblue;" colspan="3">'+rtqna.rtqna_detail+'</td></tr>';
					}else{
						show += '<tr><td style="background-color:gray; text-align:right;" colspan="3">'+rtqna.rtqna_detail+'</td>';
						show += '<td>'+rtqna.name+'</td></tr>';
					}
				});
				$("h3").text(show);
				$(".table").html(show);
			},
			error:function(err){
				
			}
		});
	    
	})
	
	
</script>
</head>
<body>
	<div class="main">
	    <div class="container tim-container noticeList" style="max-width:1200px; padding-top:100px">
	        <div class="collapse navbar-collapse text-center">
	            <h2>실시간 채팅 상담</h2>
		    </div>
		    <div>
		    	<table class="table table-bordered">
		    		<col width="15%">
		    		<col width="35%">
		    		<col width="35%">
		    		<col width="15%">
		    		<tr><th>회원명</th><th colspan="2"></th><th>관리자명</th></tr>
		    	</table>
		    </div>
		    <form method="post">
			    <input type="hidden" name="" value=""/>
			    <input type="hidden" name="" value=""/>
			    <input type="hidden" name="" value=""/>
			    <div class="row">
			    	<div class="col-md-10" >
			    		<input type="text" style="width:100%; margin-top:6px;" name="rtqna_detail" placeholder="내용을 작성하세요." />
			    	</div>
			    	<div class="col-md-1">
			    		<input type="button" class="btn btn-fill btn-warning" value="등록">
			    	</div>
			    	<div class="col-md-1">
			    		<input type="button" class="btn btn-fill btn-warning" value="목록">
			    	</div>
			    </div>
	    	</form>
	    </div>
	</div>
	<!-- end main -->
</body>
</html>