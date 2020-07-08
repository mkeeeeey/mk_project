<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>FunFun - 관리자</title>
<link href="${path }/adminTemplate/css/styles.css" rel="stylesheet" />
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
<style type="text/css">
	div {cursor:default;}
</style>
</head>
<body class="sb-nav-fixed">
    <%@ include file="/adminTemplate/navi.jsp" %>
    <div id="layoutSidenav">
        <%@ include file="/adminTemplate/leftSidebar.jsp" %>
        <div id="layoutSidenav_content">
            <main>
			<div class="main">
			    <div class="container tim-container" style="max-width:1200px; padding-top:100px">
			        <div class="protitle" style="margin:150px 0 30px;">
				        <h2>메이커 상세정보</h2>
				    </div>
			        <div>
				    	<form class="form-group" method="post" action="${path}/AdminMaker.do?method=update">
					    	<input type="hidden" name="maker_opt" />
					    	<table class="table table-bordered">
					        	<col style="width:20%">
					        	<col style="width:30%">
					        	<col style="width:20%">
					        	<col style="width:30%">
					        	<!-- 메이커번호, 메이커명, 이메일, 메이커상태,  -->
					        	<!-- 메이커프로필, 메이커구분, 메이커 통장사본이미지, 회원명 -->
					        	
					        	<tr><th>메이커 번호</th>
					        		<td><input type="hidden" name="maker_code" value="${AdminMaker.maker_code}"/>${AdminMaker.maker_code}</td>
					        		<th>메이커 상태</th>
					        		<td><c:if test="${not empty AdminMaker.maker_curr}">제재 메이커<br>(${AdminMaker.maker_curr})</c:if>
					        			<c:if test="${empty AdminMaker.maker_curr}" >일반 메이커</c:if></td></tr>
					        	<tr><th>메이커명</th>
					        		<td>${AdminMaker.maker_name }</td>
					        		<th>메이커 구분</th>
					        		<td>${AdminMaker.maker_type }</td></tr>
					        	<tr><th>회원명</th>
					        		<td>${AdminMaker.mem_name }</td>
					        		<th></th>
					        		<td></td></tr>
					        	<tr><th>메이커프로필</th>
					        		<td><img src="${AdminMaker.maker_profile}" style="width:90px; height:90px;"
					        			onerror="this.src='https://stickershop.line-scdn.net/stickershop/v1/product/1629282/LINEStorePC/main.png;compress=true'"/></td>
					        		<th>통장사본</th>
					        		<td><img src="${AdminMaker.maker_bankbook}" style="width:90px; height:90px;"
					        			onerror="this.src='https://stickershop.line-scdn.net/stickershop/v1/product/1629282/LINEStorePC/main.png;compress=true'"/></td></tr>
					        </table>
				        </form>
				    </div>
				    <div class="text-right">
				    	<button class="btn btn-fill btn-warning appr_Btn">메이커 관리</button>
				    	<button class="btn btn-fill btn-warning goList">목록</button>
				    </div>
			    </div>
			</div>
			
			
			<div class="modal fade" id="appr_modal" tabindex="-1" role="dialog" aria-labelleby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="exampleModalLabel">메이커 관리</h4>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						</div>
						<div class="modal-body">
							<button type="button" class="btn btn-fill btn-warning text-left restrictionBtn" style="width:100%;">메이커 제재 : 3개월 정지</button>
							<br><br>
							<button type="button" class="btn btn-fill btn-warning text-left dropBtn" style="width:100%;">메이커 제명 : 10년 정지</button>
							<br><br>
							<button type="button" class="btn btn-fill btn-warning text-left clearBtn" style="width:100%;">메이커 복귀</button>
							<br><br>
							<button type="button" class="btn btn-fill btn-warning" style="width:100%;" data-dismiss="modal">닫기</button>
							<br><br>
						</div>
					</div>
				</div>
			</div>
			
			<!-- end main -->
			</main>
            <%@ include file="/adminTemplate/footer.jsp" %>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="${path }/adminTemplate/js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="${path }/adminTemplate/assets/demo/chart-area-demo.js"></script>
    <script src="${path }/adminTemplate/assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
    <script src="${path }/adminTemplate/assets/demo/datatables-demo.js"></script>
</body>
<script>
	$(document).ready(function(){
		$(".appr_Btn").click(function(){
			$("#appr_modal").modal("show");
		});
		
		
		
		
		var date = new Date();
		$(".restrictionBtn").click(function(){
			if(confirm("제재 조치하시겠습니까?")){
				date.setMonth(date.getMonth()+3);
				var dateStr = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDay();
				$("[name=maker_opt]").val(dateStr);
				$("form").submit();
			}
			
		});
		$(".dropBtn").click(function(){
			if(confirm("제명 조치하시겠습니까?")){
				date.setFullYear(date.getFullYear()+10);
				var dateStr = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDay();
				$("[name=maker_opt]").val(dateStr);
				console.log("dateStr : "+dateStr);
				$("form").submit();
			}
		});
		$(".clearBtn").click(function(){
			if(confirm("메이커 복귀 하시겠습니까?")){
				$("[name=maker_opt]").val("");
				$("form").submit();
			}
		});
		$(".goList").click(function(){
			//alert("목록으로 이동");
			$(location).attr("href","${path}/AdminMaker.do?method=list");
		});
		
	})
</script>
</html>