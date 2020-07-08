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
	.cs-content{min-height:750px;}
	.as-context{width:1080px; margin:20px auto;}
	.apply-title{width:1080px; margin:0 auto;}
 
/* 상세보기 */
	.bbsbox {font-family: 'gulim';margin-top: 30px;}
	.bbsinfo {margin-top: 7px;font-size: 11px;color: #999;}
	.bbslist {margin-top: 10px;}
	.bbslist tbody td:nth-child(3) {text-align: left;font-size: 13px;}
	.bbscontents {padding: 20px 0; border-bottom: 1px solid #ddd; font-size: 14px;font-weight: bold;}
	.listback {margin-top: 20px; text-align: right;}
	.commentbox {margin-top:20px;background: #e9e9e9;}
	table {width:100%; border:0; border-spacing: 0; border-collapse: collapse;}
	textarea {padding: 5px 6px; border: 1px solid #d5d5d5; line-height: 1.5;height: 38px;background: #fff;margin: 20px 0 20px 20px;
	width:100%; border:none;resize:none;}
	.insAns{margin-top:10px; cursor:pointer; width:150px; margin:0; height:37px !important;line-height:34px;display:inline-block;color:#FFFFFF;font-size:12px !important;background:#63145F;text-align:center;vertical-align:middle;
	outline:none; border:none;}
	.commentbox tr{vertical-align:middle;}
	.comment-noti{font-size:12px; line-height:20px;padding:5px 26px;}
	.goback-btn{width:93px; margin:0; height:34px !important;line-height:34px;display:inline-block;color:#FFFFFF;font-size:12px !important;background:#63145F;text-align:center;vertical-align:middle;
	outline:none; border:none;}
	.comment-list{margin:20px auto;}
	
	.bbslist thead{border-top:2px solid cocoa; border-top:1px solid #cacaca;padding:12px 10px;}
	.bbslist thead th{ padding:12px 10px;}
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
		$("h2").text("공지상세");
		$("#uptNoti").click(function(){
			$("[name=proc]").val("writeNoti");
			$("form").submit();
		});
		$("#delNoti").click(function(){
			if(confirm("글을 삭제하시겠습니까?")){
				$("[name=proc]").val("delNoti");
				$("form").submit();
			}
		});
		$("#listNoti").click(function(){
			$("[name=proc]").val("notice");
			$("form").submit();
		});		
	});
</script>
</head>
<body>
	<jsp:include page="../top.jsp"/>
	<form method="post">
	<div class="cs-content">
	<header class="apply-title">
	</header>
	<input type="hidden" name="proc" />
	<input type="hidden" name="noti_no" value="${notice.noti_no}"/>
	<input type="hidden" name="noti_name" value="${notice.noti_name}"/>
	<input type="hidden" name="noti_detail" value="${notice.noti_detail}"/>
	<div class="as-context">
		<div id="cusestimateview">
			<div class="bbsbox">
				<div class="bbstitle">
					<strong>${notice.noti_name}</strong>
				</div>
				<div class="bbsinfo">
					<span class="writedate">작성일 : ${notice.noti_date}</span> / <span class="writer">작성자 : 관리자</span>
				</div>
				<!-- 내용 시작 -->
				<table summary="OrderList" class="bbslist">
						<colgroup>
							<col width="15%">
							<col width="10%">	
							<col width="auto">
							<col width="15%">
							<col width="7%">
							<col width="15%">
						</colgroup>
						
					</table>
					<!-- 문의글 시작 -->
					<div class="bbscontents">
						${notice.noti_detail}
					</div>
				<!-- 문의글 끝 -->
				</div>
				<div class="listback">
					<c:if test="${mem.mem_id == 'admin'}">
					<input id="uptNoti" class="goback-btn btn" type="button" value="수정"/>
					<input id="delNoti" class="goback-btn btn" type="button" value="삭제"/>
					</c:if>
					<input id="listNoti" class="goback-btn btn" type="button" value="목록"/>
				</div>
            </div>
		</div>
	</div>
	</form>
	<jsp:include page="../bottom.jsp"/>
	
</body>
</html>