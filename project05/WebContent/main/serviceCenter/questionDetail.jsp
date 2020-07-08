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
		
		$("#uptQue").click(function(){
			$("[name=proc]").val("writeQue");
			$("form").submit();
		});
		$("#delQue").click(function(){
			if(confirm("글을 삭제하시겠습니까?")){
				$("[name=proc]").val("delQue");
				$("form").submit();
			}
		});
		$("#listQue").click(function(){
			$("[name=proc]").val("question");
			$("form").submit();
		});
		//댓글
		$("#insQuec").click(function(){
			if(confirm("작성하시겠습니까?")){
				$("[name=proc]").val("insQuec");
				var quec_detail = $("[name=quec_detail]").val();
				quec_detail = quec_detail.replace(/(?:\r\n|\r|\n)/g, '<br>');
				$("[name=quec_detail]").val(quec_detail);
				$("form").submit();
			}
		});
		
		//댓글 삭제 기능
		$("[name=delQuec]").click(function(){
			if(confirm("삭제하시겠습니까?")){
				$("[name=proc]").val("delQuec");
				var quec_detail = $("[name=quec_detail]").val();
				quec_detail = quec_detail.replace(/(?:\r\n|\r|\n)/g, '<br>');
				$("[name=quec_detail]").val(quec_detail);
				$("form").submit();
			}
		});
	});
	//문의댓글 수정
	function uptQuec(num){
		if(confirm("댓글수정하시겠습니까?")){
			$("[name=proc]").val("uptQuec");
			var quec_detail = $("[name=quec_detail"+num+"]").val();
			quec_detail = quec_detail.replace(/(?:\r\n|\r|\n)/g, '<br>');
			$("[name=quec_detail]").val(quec_detail);
			$("[name=quec_no]").val(num);
			$("form").submit();
		}
	}
	//문의댓글 삭제
	function delQuec(num){
		if(confirm("댓글을 삭제하시겠습니까?")){
			$("[name=proc]").val("delQuec");
			$("[name=quec_no]").val(num);
			$("form").submit();
		}
	}
	function viewUptcomm(num){
				
		var quec_detailp=$("[name=quec_detail"+num+"]").val();
		quec_detailp = quec_detailp.replace(/<br>/g, '\n');
		$("[name=quec_detail"+num+"]").text(quec_detailp);
		
		var commentbox = '#commentbox'+num;
		console.log(commentbox);
	    if($(commentbox).css("display") == "none"){   
	    	$(commentbox).css("display", "block");   
	    } else {  
	    	$(commentbox).css("display", "none");   
	    }  
	}
</script>
</head>
<body>
	<jsp:include page="../top.jsp"/>
	<form method="post">
	<div class="cs-content">
	<header class="apply-title">
	</header>
	<input type="hidden" name="proc" />
	<input type="hidden" name="mem_id" value="${mem.mem_id}"/>
	<input type="hidden" name="que_no" value="${question.que_no}"/>
	<input type="hidden" name="que_name" value="${question.que_name}"/>
	<input type="hidden" name="que_detail" value="${question.que_detail}"/>
	<input type="hidden" name="quec_no" />
	<div class="as-context">
		<div id="cusestimateview">
			<div class="bbsbox">
				<div class="bbstitle">
					<strong>${question.que_name}</strong>
				</div>
				<div class="bbsinfo">
					<span class="writedate">작성일 : ${question.que_date}</span> / <span class="writer">작성자 : ${question.mem_id}</span>
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
						${question.que_detail}
					</div>
				<!-- 문의글 끝 -->
				</div>
				<div class="listback">
					<c:if test="${question.mem_id == mem.mem_id}">
					<input id="uptQue" class="goback-btn btn" type="button" value="수정"/>
					<input id="delQue" class="goback-btn btn" type="button" value="삭제"/>
					</c:if>
					<input id="listQue" class="goback-btn btn" type="button" value="목록"/>
				</div>
				<!-- 덧글 시작 -->
				<table class="commentbox">
					<col width="80%">
					<col width="20%">
					<!-- 덧글입력 시작 -->
					<tbody>
						<tr>
							<td>
								<textarea id="online_comment" name="quec_detail"></textarea>
							</td>
							<td style="text-align:right; padding-right:26px;">
								<input class="insAns btn" type="button" id="insQuec" value="입력"/>
							</td>
						</tr>
					</tbody>
				</table>
				
				<!-- 덧글출력 시작 -->
				<div class="comment-list" id="online_lines">
					<c:forEach var="quecomm" items="${qclist}">
					<div class="r_list online_line" id="799229" style="clear:both; padding:10px; border-bottom:1px dotted #666;">
						<div style="padding-bottom:1px; font-weight:bold; font-size:13px; line-height:24px; color:#000;">
							${quecomm.mem_id} <span style="margin-left:5px; font-weight:normal; font-size:11px; color:#999;">${quecomm.quec_date}</span>
							<c:if test="${quecomm.mem_id==mem.mem_id}">
							<span style="margin-left:5px; font-weight:normal; font-size:11px; color:#999; cursor:pointer;" onclick="javascript:viewUptcomm(${quecomm.quec_no})">수정</span>
							<span style="margin-left:5px; font-weight:normal; font-size:11px; color:#999; cursor:pointer;" onclick="javascript:delQuec(${quecomm.quec_no})">삭제</span>
							</c:if>
            			</div>
            			<div style="line-height:120%; color:#666;">
            				${quecomm.quec_detail}<br><br>
            				
            			</div>
            		</div>
            		<table id="commentbox${quecomm.quec_no}" class="commentbox" style="display:none;">
					<!-- 덧글입력 시작 -->
					<col width="120%">
					<col width="20%">
					<tbody>
						<tr>
							<td>
								<textarea id="online_comment" name="quec_detail${quecomm.quec_no}">${quecomm.quec_detail}</textarea>
							</td>
							<td style="text-align:right; padding-left:40px; padding-right:26px;">
								<input class="insAns btn" type="button" id="uptQuec${quecomm.quec_no}" onclick="javascript:uptQuec(${quecomm.quec_no})" value="수정"/>
							</td>
						</tr>
					</tbody>
					</table>
            		</c:forEach>
            	</div>
            </div>
		</div>
	</div>
	</form>
	<jsp:include page="../bottom.jsp"/>
	
</body>
</html>