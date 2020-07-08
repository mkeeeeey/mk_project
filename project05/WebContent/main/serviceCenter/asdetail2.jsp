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
	.ordR{text-align:right;}
	.ordL{text-align:left;}

	.cs-content{min-height:750px; margin-top:200px;}
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
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%-- ${fn:length(plist)} : ${plist}의 크기 --%>
<script type="text/javascript">
	$(document).ready(function(){		
		var as_no = "${param.as_no}";
		alert(as_no);
		$("h1").append(" - "+as_no);
		
		var tot = "${fn:length(asdetail)}";
		for(var idx=0;idx<tot;idx++){
			var num = $(".num").eq(idx).text();
			var numS = num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$(".num").eq(idx).text(numS+" 원");
		}
		
		$(".goback-btn").click(function(){
			$("[name=proc]").val("as");
			$("form").submit();
		});
		
	});
</script>
</head>
<body>
	<jsp:include page="../top.jsp"/>
	
	<div class="cs-content">
		<header class="apply-title">
			<h1>AS목록</h1>
		</header>
		<div class="as-context">
			<div id="cusestimateview">
			<form method="post">
				<input type="hidden" name="as_no" value="${as.as_no}"/>
				<input type="hidden" name="proc" />
				<div class="bbsbox">
					<div class="bbstitle">
						<strong>AS신청합니다</strong>
						<span class="">[${as.as_cate}]</span> <!-- AS, 교환, 반품 -->
					</div>
					<div class="bbsinfo">
						<span class="writedate">작성일 : ${as.as_date}</span> / <span class="writer">작성자 : ${as.mem_id}</span>
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
						<thead>
							<tr>
								<th>주문번호</th>
								<th></th>
								<th>상품명</th>
								<th>금액</th>
								<th>수량</th>
								<th>구매날짜</th>
							</tr>
						</thead>
						<tbody>
						<!-- 리스트 시작 -->
						<c:forEach var="ord" items="${asdetail}" >
							<tr style="text-align:center;">
								<td>${ord.ord_no}</td>
                    			<td><img src="${path}/image/parts/${ord.parts_img}" style="width:60px;"/></td>
	                   			<td style="background:none; text-align:left;">
	                   				<div class="cart_name">${ord.parts_name}</div>
	                    		</td>
	                    		<td class="ordR num">${ord.parts_price}</td>
	                    		<td>${ord.req_cnt} 개</td>
	                    		<td>${ord.ord_date}</td>
                			</tr>
                		</c:forEach>	
                		<!-- 리스트 끝 -->
                		</tbody>
					</table>
					<!-- 문의글 시작 -->
					<div class="bbscontents">
						${as.as_detail}as_detail
					</div>
				<!-- 문의글 끝 -->
				</div>
				<div class="listback">
					<input class="goback-btn btn" type="button" value="목록으로"/>
				</div>
				<!-- 덧글 시작 -->
				<c:if test="${as.mem_id == 'admin'}">
				<table class="commentbox">
					<col width="80%">
					<col width="20%">
					<!-- 덧글입력 시작 -->
					<tbody>
						<tr>
							<td>
								<textarea id="online_comment" class=""></textarea>
							</td>
							<td style="text-align:right; padding-right:26px;">
								<input class="insAns btn" type="button" name="insAns" value="입력"/>
							</td>
						</tr>
					</tbody>
				</table>
				</c:if>
				<!-- 덧글출력 시작 -->
				<c:if test="${not empty as.as_comm}">
				<div class="comment-list" id="online_lines">
					<div class="r_list online_line" id="799229" style="clear:both; padding:10px; border-bottom:1px dotted #666;">
						<div style="padding-bottom:1px; font-weight:bold; font-size:13px; line-height:24px; color:#000;">
							관리자 <span style="margin-left:5px; font-weight:normal; font-size:11px; color:#999;">${as.as_comdate}</span>
            			</div>
            			<div style="line-height:120%; color:#666;">
            				${as.as_comm}
            			</div>
            		</div>
            	</div>
            	</c:if>
            </form>
            </div>
		</div>
	</div>
	
	<jsp:include page="../bottom.jsp"/>
	
</body>
</html>