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
	.admtable td {cursor:pointer;}
	.text-right{text-align:right;}
	.text-left{text-align:left;}
	.text-center{text-align:center;}
	
	.pagination {
	  display: inline-block;
	  padding-left: 0;
	  margin: 20px 0;
	  border-radius: 4px; }

	.pagination > li {
	  display: inline;	}

	.pagination > li > a,
	.pagination > li > span {
	  position: relative;
	  float: left;
	  padding: 6px 12px;
	  margin-left: -1px;
	  line-height: 1.428571429;
	  text-decoration: none;
	  background-color: #ffffff;
	  border: 1px solid #dddddd; }
	
	.pagination > li:first-child > a,
	.pagination > li:first-child > span {
	  margin-left: 0;
	  border-bottom-left-radius: 4px;
	  border-top-left-radius: 4px;	}
	
	.pagination > li:last-child > a,
	.pagination > li:last-child > span {
	  border-top-right-radius: 4px;
	  border-bottom-right-radius: 4px;	}
	
	.pagination > li > a:hover,
	.pagination > li > span:hover,
	.pagination > li > a:focus,
	.pagination > li > span:focus {
	  background-color: #eeeeee; }
	
	.pagination.pagination-no-border > li > a,
	.pagination.pagination-no-border > li > span {
	  border: 0; }
	
	.pagination > li > a, .pagination > li > span, .pagination > li:first-child > a, .pagination > li:first-child > span, .pagination > li:last-child > a, .pagination > li:last-child > span {
	  border-radius: 50%;
	  margin: 0 2px;
	  color: #777777; }
	
	.pagination > li.active > a, .pagination > li.active > span, .pagination > li.active > a:hover, .pagination > li.active > span:hover, .pagination > li.active > a:focus, .pagination > li.active > span:focus {
	  background-color: #ffc107;
	  border: 0;
	  color: #FFFFFF;
	  padding: 7px 13px; }
	
</style>
</head>
<body class="sb-nav-fixed">
    <%@ include file="/adminTemplate/navi.jsp" %>
    <div id="layoutSidenav">
        <%@ include file="/adminTemplate/leftSidebar.jsp" %>
        <div id="layoutSidenav_content">
            <main>
            <div class="main">
			    <div class="container tim-container AdminList" style="max-width:1200px;">
			        <div class="admtitle" style="margin:150px 0 30px;">
				        <h2>관리자 목록</h2>
				    </div>
			    	<form method="post" id="pagingForm">
				    	<input type="hidden" name="curPage" value="${paging.curPage}"/>
				    	<div class="row">
				        	<div class="text-left col-sm-3 ">총건수 : ${paging.count}건</div> 
				        	<div class="text-right col-sm-9">
				        		페이지수 : 
					        	<select name="pageSize">
					        		<option value="5">5건</option>
					        		<option value="10">10건</option>
					        		<option value="20">20건</option>
					        	</select></div>
						</div>
					</form>
					<div class="admList">
				        <table class="table table-hover admtable">
				        	<col width="25%">
				        	<col width="25%">
				        	<col width="25%">
				        	<col width="25%">
				        	<tr><th class="text-center">번호</th>
				        		<th>관리자번호</th>
				        		<th>이름</th>
				        		<th>권한</th></tr>
				        	<c:forEach var="adm" items="${list}">
				        	<tr class="goDetail"><td class="text-center">${adm.cnt}</td>
								<td>${adm.admin_code}</td>
								<td>${adm.admin_name}</td>
								<td>${adm.admin_auth}</td>
								<td style="display:none">${adm.admin_pw}</td></tr>
				        	</c:forEach>
								<tr><td colspan='4'></td></tr>
				        </table>
					</div>
			        <div class="text-center">
				        <ul class="pagination ct-orange"> 
							<li><a href="javascript:goPage(${paging.startBlock-1})">&laquo;</a></li>
							<c:forEach var="cnt" begin="${paging.startBlock}" end="${paging.endBlock}">
								<li class="${paging.curPage==cnt?'active':'' }"><a href="javascript:goPage(${cnt})">${cnt}</a></li>
							</c:forEach>
							<li><a href="javascript:goPage(${paging.endBlock==paging.pageCount?paging.pageCount:paging.endBlock+1})">&raquo;</a></li>
						</ul>
			        </div>
			        <c:if test="${manager.admin_auth == '마스터'}">
			        <div class="text-right">
						<button class="btn btn-warning insertModalBtn">등록</button>
					</div>
					</c:if>
			    </div>
			    <!-- 모달창 -->
			    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="display: none;">
					<div class="modal-dialog">
						<div class="modal-content" style="width:600px;">
							<div class="modal-header">
								<h4 class="modal-title" id="exampleModalLabel">관리자 등록</h4>
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							</div>
							<div class="modal-body">
								<form method="post" id="insReport">
									<div class="form-group">
										<label for="message-text" class="control-label">관리자 번호 : </label>
										<input class="form" name="admin_code" placeholder="관리자 번호를 입력하세요." />
									</div>
									<div class="form-group">
										<label for="message-text" class="control-label">관리자 이름 : </label>
										<input class="form" name="admin_name" placeholder="관리자 이름을 입력하세요." />
									</div>
									<div class="form-group">
										<label for="message-text" class="control-label">관리자 권한 : </label>
										<label><input type="radio" class="form-data" value="마스터" name="admin_auth">&nbsp;마스터&nbsp;</label>
										<label><input type="radio" class="form-data" value="서브" name="admin_auth" checked>&nbsp;서브&nbsp;</label>
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default btn-simple" data-dismiss="modal">Close</button>
								<div class="divider"></div>
								<button type="button" id="insBtn" class="btn btn-info btn-simple">등록</button>
							</div>
						</div>
					</div>
				</div>
				
				<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="display: none;">
					<div class="modal-dialog">
						<div class="modal-content" style="width:600px;">
							<div class="modal-header">
								<h4 class="modal-title" id="exampleModalLabel">관리자 수정</h4>
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							</div>
							<div class="modal-body">
								<form method="post" id="uptReport">
									<div class="form-group">
										<label for="message-text" class="control-label">관리자 번호 : </label>
										<input class="form" name="admin_code" readonly />
									</div>
									<div class="form-group">
										<label for="message-text" class="control-label">관리자 이름 : </label>
										<input class="form" name="admin_name" placeholder="관리자 이름을 입력하세요." />
									</div>
									<div class="form-group" id="pwDiv" style="display:none;">
										<label for="message-text" class="control-label">관리자 비밀번호 : </label><br>
										<input class="form" type="password" name="admin_pw" placeholder="비밀번호을 입력." /><br>
										<input class="form" type="password" name="admin_pw2" placeholder="비밀번호을 재입력." />
									</div>
									<div class="form-group">
										<label for="message-text" class="control-label">관리자 권한 : </label>
										<label><input type="radio" class="form-data" value="마스터" name="admin_auth">&nbsp;마스터&nbsp;</label>
										<label><input type="radio" class="form-data" value="서브" name="admin_auth">&nbsp;서브&nbsp;</label>
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default btn-simple" data-dismiss="modal">Close</button>
								<div class="divider"></div>
								<c:if test="${manager.admin_auth == '마스터'}">
								<button type="button" id="uptBtn" class="btn btn-info btn-simple">수정</button>
								<button type="button" id="delBtn" class="btn btn-info btn-simple">삭제</button>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
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
<script type="text/javascript">
	$(document).ready(function(){
		$("[name=pageSize]").val("${paging.pageSize}");
		
		$("[name=pageSize]").change(function(){
	    	$("[name=curPage]").val(1);	// 페이지크기를 바꾸면 초기 첫페이지가 나오도록 처리
			$("form").submit();
		});
		console.log("권한 : ${manager.admin_auth}");
		// 모달로 해보자.
		$(".insertModalBtn").click(function(){
            $("#myModal").modal("show");
        });
		
		$(".goDetail").click(function(){
			var myArticle2 =$(this).children().next().html();
			var myArticle3 =$(this).children().next().next().html();
			var myArticle4 =$(this).children().next().next().next().html();
			var myArticle5 =$(this).children().next().next().next().next().html();
			
			var admin_code="${manager.admin_code}";
			if(admin_code == myArticle2){
				$("#pwDiv").css("display","block");
			}else{
				$("#pwDiv").css("display","none");
			}
			
			$("#myModal2 [name=admin_code]").val(myArticle2);
			$("#myModal2 [name=admin_name]").val(myArticle3);
			$("#myModal2 [name=admin_auth]").attr("checked",false);
			if(myArticle4 == "마스터"){
				$("#myModal2 [name=admin_auth]").eq(0).attr("checked",true);
			}else{
				$("#myModal2 [name=admin_auth]").eq(1).attr("checked",true);
			}
			$("#myModal2 [name=admin_pw]").val(myArticle5);
			$("#myModal2 [name=admin_pw2]").val(myArticle5);
			
			$("#myModal2").modal("show");
		});
		// 입력시 초과하는 경우
		$("[name=admin_code]").keyup(function(e){
			var textLength = $("[name=admin_code]").val().length;
			if(!maxLengthCheck($("[name=admin_code]"),8)){
				console.log("글자수 초과");
			}
		});
		$("[name=admin_name]").keyup(function(e){
			var textLength = $("[name=admin_name]").val().length;
			if(!maxLengthCheck($("[name=admin_name]"),6)){
				console.log("글자수 초과");
			}
		});
		// 입력 글자수 체크
		function maxLengthCheck(obj, maxLength){
			var textLength = obj.val().length;
			if(textLength > Number(maxLength)) {
		    	alert("입력가능문자수를 초과하였습니다.");
		    	obj.val(obj.val().substring(0,maxLength));
		    	return false;
		    }else {
		    	return true;
		    }
		}
		
		
		$("#insBtn").click(function(){
			var code = $("#myModal [name=admin_code]");
			var name = $("#myModal [name=admin_name]");
			// code 8자 이내, name 6자	
			// 숫자형식 체크 처리. 숫자==> isNaN(code) false
			if(maxLengthCheck(code,8) && maxLengthCheck(name,6)){
				if(confirm("등록하시겠습니까?")){
					if(!isNaN(code.val()) && code.val().length != 0 && name.val().length != 0){
						$("form").attr("action","${path}/admin-management-insert.do");
						$("#insReport").submit();
					}else{
						alert("번호 및 이름을 확인하세요.");
					}
				}
			}
		});
		
		$("#uptBtn").click(function(){
			var name = $("#myModal2 [name=admin_name]");
			if(maxLengthCheck(name,6)){
				if(confirm("수정하시겠습니까?")){
					if(name.val().length != 0){
						var pw1 = $("#myModal2 [name=admin_pw]").val();
						var pw2 = $("#myModal2 [name=admin_pw2]").val();
						if(pw1.length != 0 && pw1==pw2){
							$("#uptReport").attr("action","${path}/admin-management-update.do");
							$("#uptReport").submit();
						}else{
							alert("비밀번호를 다시 입력하세요.");
						}
					}else{
						alert("번호 및 이름을 확인하세요.");
					}
				}
			}
		});
		
		$("#delBtn").click(function(){
			if(confirm("삭제하시겠습니까?")){
				$("#uptReport").attr("action","${path}/admin-management-delete.do");
				$("#uptReport").submit();
			}
		});
		
	});
	
	function goPage(no){
		$("[name=curPage]").val(no);
		$("#pagingForm").submit();
	}
</script>
</html>