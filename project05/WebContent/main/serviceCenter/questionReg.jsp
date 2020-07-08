<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.* "%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="UTF-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PC냥이:컴퓨터 맞춰보자냥</title>
<style type="text/css">
	header{width:1080px; margin:0 auto;}
	.cs-content{min-height:750px;}
/* 신청 */
	.apply-cont{width:1080px; margin:20px auto;}
	.apply-table{width:100%;}
	.apply-schon{width:93px; margin:0;height:34px !important;line-height:34px;display:inline-block;color:#FFFFFF;font-size:12px !important;background:#63145F;text-align:center;vertical-align:middle;
	outline:none; border:none;}
	select{height:34px;width:93px;}
	input[type=text]{width:90%;padding:5px;}
	textarea {padding: 5px 6px; border: 1px solid #d5d5d5; line-height: 1.5;height:500px;background: #fff; width:90%; resize:none;}

/* 버튼 */
	.apply-btn{width:1050px; margin:20px auto 50px; text-align:center;}
	.btn{background:#63145F; color:#fff; border:none; position:relative; height:60px; font-size:1.5em; padding:0 2em; cursor:pointer;
	transition:800ms ease all; outline:none;}
	.btn:hover{background:#fff; color:#63145F;}
	.btn:before,.btn:after{content:''; position:absolute; top:0; right:0; height:2px; width:0; background: #63145F; transition:400ms ease all;}
	.btn:after{right:inherit; top:inherit; left:0; bottom:0;}
	.btn:hover:before,.btn:hover:after{width:100%; transition:800ms ease all;}

</style>
<script type="text/javascript" src="${path}/a00_com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("문의사항 작성");
		var que_detailp="${param.que_detail}";
		if(que_detailp != null){
			que_detailp = que_detailp.replace(/<br>/g, '\n');
			$("textarea").text(que_detailp);
		}
		
		$("[name=uptQue]").click(function(){
			if(confirm("작성하시겠습니까?")){
				$("[name=proc]").val("uptQue");
				var que_detail = $("[name=que_detail]").val();
				que_detail = que_detail.replace(/(?:\r\n|\r|\n)/g, '<br>');
				$("[name=que_detail]").val(que_detail);
				$("form").submit();
			}
		});
		
		$("[name=insQue]").click(function(){
			if(confirm("작성하시겠습니까?")){
				$("[name=proc]").val("insQue");
				var que_detail = $("[name=que_detail]").val();
				que_detail = que_detail.replace(/(?:\r\n|\r|\n)/g, '<br>');
				$("[name=que_detail]").val(que_detail);
				$("form").submit();
			}
		});
		
		$("[name=applyBtn]").click(function(){
			if(confirm("작성을 취소하시겠습니까?")){
				$("[name=proc]").val("question");
				$("form").submit();
			}
		});
	});
</script>
</head>
<body>
	<jsp:include page="../top.jsp"/>
	<form method="post">
	<div class="cs-content">
		<header>
			<h2></h2>
		</header>
		<input type="hidden" name="proc" />
		<input type="hidden" name="mem_id" value="${mem.mem_id}" />
		<c:if test="${not empty param.que_no}">
		<input type="hidden" name="que_no" value="${param.que_no}"/>		
		</c:if>
		<div class="apply-cont">
			<table class="apply-table">
				<col width="10%">
				<col width="90%">
				<tr><th>제목</th>
				<td>
				<c:choose>
					<c:when test="${not empty param.que_name}">
					<input type="text" name="que_name" placeholder="제목을 입력해주세요" value="${param.que_name}"/>
					</c:when>
					<c:otherwise>
					<input type="text" name="que_name" placeholder="제목을 입력해주세요"/>
					</c:otherwise>
				</c:choose>
				</td></tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="que_detail" placeholder="내용을 입력해주세요"></textarea>
					</td>
				</tr>
			</table>
		</div>
		
		<div class="apply-btn">
			<c:choose>
				<c:when test="${not empty param.que_name}">
				<input class="btn" type="button" name="uptQue" value="수정"/>
				</c:when>
				<c:otherwise>
				<input class="btn" type="button" name="insQue" value="등록"/>
				</c:otherwise>
			</c:choose>
			<input class="btn" type="button" name="applyBtn" value="취소"/>
		</div>
	</div>
	</form>
	<jsp:include page="../bottom.jsp"/>
	
</body>
</html>