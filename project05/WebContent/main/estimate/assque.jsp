<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, z01_vo.*, hsw.* "
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PC냥이:컴퓨터 맞춰보자냥</title>
<!-- <link rel="stylesheet" href="${path}/a00_com/a00_com.css" > -->
<style>
	body{margin:0 auto; padding:0; width:100%;}
	.ordR{text-align:right;}
	.ordL{text-align:left;}

	#content{min-height:750px;width:1080px;margin:30px auto;}
	
	#insAsq .bbslist {margin:30px auto 0; width:700px; }
	#insAsq .listback {margin-top: 20px; text-align: right;}
	#insAsq table {width:100%; border:0; border-spacing: 0; border-collapse: collapse;}
	#insAsq textarea {padding: 5px 6px; line-height: 1.5;height: 38px; width:99%; resize:none;}
	#insAsq .btn{color:#FFFFFF;background:#63145F;text-align:center;vertical-align:middle;
	outline:none; border:none; padding:10px;}
	
	#goAsq .bbstitle {margin-top: 30px;}
	#goAsq .bbsinfo {margin-top: 7px;font-size: 11px;color: #999;}
	#goAsq .bbslist {margin:30px auto 0; width:700px; }
	#goAsq .bbscontents {padding: 20px 0; border-bottom: 1px solid #ddd; font-size: 14px;font-weight: bold; margin-top:20px;}
	#goAsq .listback {margin-top: 20px; text-align: right;}
	#goAsq .commentbox {margin-top:20px;background: #e9e9e9;}
	#goAsq .admbox table {width:100%; border:0; border-spacing: 0; border-collapse: collapse;}
	#goAsq .admbox textarea {padding: 5px 6px; border: 1px solid #d5d5d5; line-height: 1.5;height: 38px;background: #fff;margin: 20px 0 20px 20px;
	width:100%; border:none;resize:none;}
	#goAsq .insAns-btn{margin-top:10px; cursor:pointer; width:150px; margin:0; height:37px !important;line-height:34px;display:inline-block;color:#FFFFFF;font-size:12px !important;background:#63145F;text-align:center;vertical-align:middle;
	outline:none; border:none;}
	#goAsq .goback-btn{width:93px; margin:0; height:34px !important;line-height:34px;display:inline-block;color:#FFFFFF;font-size:12px !important;background:#63145F;text-align:center;vertical-align:middle;
	outline:none; border:none;}
	#goAsq .comment-list{margin:20px auto;clear:both; border-bottom:1px dotted #666;}
	#goAsq .btn{background:#63145F; color:#fff; border:none; position:relative; height:60px; font-size:1.5em; padding:0 2em; cursor:pointer;
	transition:800ms ease all; outline:none;}
	
	fieldset{border:2px solid #63145F;}
	
</style>
<script src="${path}/a00_com/jquery-3.4.1.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
<%--

--%>
		$("h2").text("견적문의");
		$(".goback-btn").click(function(){
			location.href="${path}/assembly";
		});
		$(".regAsq-btn").click(function(){
			$("[name=regAsq]").submit();
		});
		
		$(".insAns-btn").click(function(){
			$("[name=insAns]").submit();
		});
		
	});
	
</script>
</head>

<body>
<jsp:include page="../top.jsp"/>
<div id="content">
	<c:choose>
		<c:when test="${param.proc eq 'insAsq'}">
			<div id="insAsq">
				<form method="post" name="regAsq">
					<input type="hidden" name="proc" value="regAsq"/>
					<fieldset>
						<table>
							<col width="20%">
							<col width="80%">
							<tr><th>제목</th>
								<td><input type="text" name="asq_name" style="width:100%"/></td></tr>
						</table>
					</fieldset>
					<div class="bbslist">
						<jsp:include page="ecart.jsp" />
					</div>
					<!-- 문의글 시작 -->
					<fieldset>			
						<table>
							<col width="20%">
							<col width="80%">
							<tr><th>내용</th>
								<td><textarea name="asq_detail" style="height:100px;"></textarea></td></tr>
						</table>
					</fieldset>
				</form>
				<div class="listback">
					<input class="regAsq-btn btn" type="button" value="등록"/>
					<input class="goback-btn btn" type="button" value="목록으로"/>
				</div>
			</div>
		</c:when>
		
		
		
		
		<c:when test="${param.proc eq 'goAsq'}">
			<div id="goAsq">
				<form method="post" name="insAns">
					<fieldset>
						<div class="bbstitle">
							<strong>${asq.asq_name}</strong>
						</div>
						<div class="bbsinfo">
							<span>작성일 : ${asq.asq_reqdate}</span> / <span>작성자 : ${asq.mem_id}</span>
						</div>
						<!-- 내용 시작 -->
						<div class="bbslist">
							<jsp:include page="ecart.jsp" />
						</div>
						<!-- 문의글 시작 -->
						<div class="bbscontents">
							${asq.asq_detail}
						</div>
					</fieldset>
					<div class="listback">
						<input class="goback-btn btn" type="button" value="목록으로"/>
					</div>
					
					<c:if test="${mem.mem_id eq 'admin'}">
						<!-- 관리자만 입력 -->
						<div class="admbox">	
							<table class="commentbox">
								<col width="80%">
								<col width="20%">
								<tr>
									<td>
										<textarea name="asq_comm"></textarea>
									</td>
									<td style="text-align:right; padding-right:26px;">
										<input class="insAns-btn btn" type="button" value="입력"/>
									</td>
								</tr>
							</table>
						</div>
					</c:if>
					<!-- 덧글출력 시작 -->
					<c:if test="${not empty asq.asq_comm}">
						<!-- 덧글출력 시작 -->
						<div class="comment-list" >
							<fieldset>
								<div style="padding-bottom:1px; font-weight:bold; font-size:13px; line-height:24px; color:#000;">
									관리자 <span style="margin-left:5px; font-weight:normal; font-size:11px; color:#999;">${asq.asq_comdate}</span>
					     		</div>
					     		<div style="line-height:120%; color:#666;">
					     			${asq.asq_comm}
					     		</div>
				     		</fieldset>
					     </div>
				    </c:if>
				</form>
			</div>		
		</c:when>
	</c:choose>
</div>
	
<jsp:include page="../bottom.jsp"/>

</body>
</html>