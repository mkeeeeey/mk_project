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
		var proc = "${param.proc}";
		
		if(proc== 'insAs'){
			$("h2").text("AS신청");
			$("[name=proc]").val("ins");
		}
		
		
		if(proc=='uptAs'){
			$("h2").text("AS수정");
			var as_no = "${as.as_no}";
			var as_cate = "${as.as_cate}";
			var ord_no = "${as.ord_no}";
			var as_detail = "${as.as_detail}";
			$("[name=proc]").val("uptAsBtn");
			$("[name=as_no]").val(as_no);
			$("[name=as_cate]").val(as_cate);
			$("[name=ord_no]").html("<option value='"+ord_no+"'>"+ord_no+"</option>");
			$("[name=as_detail]").text(as_detail);
			$("[name=applyBtn]").val("수정");
		}
		
		if(proc == 'ins'){
			$("[name=proc]").val("as");
			$("form").submit();
		}
		
		$("[name=applyBtn]").click(function(){
			if(proc=='uptAs'){
				if(confirm("수정하시겠습니까?")){
					$("form").submit();
				}
			}else if(proc=='insAs'){
				var ord_no = $("[name=ord_no]").val();
				if(ord_no != ""){
					if(confirm("등록하시겠습니까?")){
						$("form").submit();
					}	
				}else{
					alert("주문번호를 선택하세요.")
				}
			}
		});
		
		
		
	});
</script>
</head>
<body>
	<jsp:include page="../top.jsp"/>
	
	<div class="cs-content">
		<header>
			<h2></h2>
		</header>
		<form method="post">
		<input type="hidden" name="proc" value="ins" />
		<input type="hidden" name="as_no"  />
		<div class="apply-cont">
			<table class="apply-table">
				<col width="10%">
				<col width="90%">
				<tr>
					<th>분류</th>
					<td>
						<select name="as_cate">
							<option value="AS">AS</option>
							<option value="교환">교환</option>
							<option value="반품">반품</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>주문번호</th>
					<td>
						<select name="ord_no">
							<option value="">주문번호</option>
							<c:forEach var="ord" items="${ordlist}">
							<option value="${ord.ord_no}">${ord.ord_no}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="as_detail"></textarea></td>
				</tr>
			</table>
		</div>
		
		<div class="apply-btn">
			<input class="btn" type="button" name="applyBtn" value="신청하기"/>
		</div>
		</form>
	</div>
	
	<jsp:include page="../bottom.jsp"/>
	
</body>
</html>