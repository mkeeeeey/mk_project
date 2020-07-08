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
	.table td {cursor:pointer;}
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
	
	.dropColor {background-color:lightcoral}
</style>
</head>
<body class="sb-nav-fixed">
    <%@ include file="/adminTemplate/navi.jsp" %>
    <div id="layoutSidenav">
        <%@ include file="/adminTemplate/leftSidebar.jsp" %>
        <div id="layoutSidenav_content">
            <div class="main">
			    <div class="container tim-container AdminMemberList" style="max-width:1200px;">
			        <div class="memtitle" style="margin:150px 0 30px;">
				        <h2>회원 목록</h2>
				    </div>
			    	<form method="post">
				    	<input type="hidden" name="curPage" value="${paging.curPage}"/>
				    	<input type="hidden" name="mem_code"/>
				    	<div class="row">
				        	<div class="text-left col-sm-3 ">총건수 : ${paging.count}건</div> 
				        	<div class="text-right col-sm-9">
				        		제재회원:<span class="dropColor">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
				        		페이지수 : 
					        	<select name="pageSize">
					        		<option value="5">5건</option>
					        		<option value="10">10건</option>
					        		<option value="20">20건</option>
					        	</select></div>
						</div>
					</form>
					<div class="memList">
				        <table class="table table-hover memtable">
				        	<col width="10%">
				        	<col width="12%">
				        	<col width="13%">
				        	<col width="25%">
				        	<col width="15%">
				        	<col width="15%">
				        	<tr><th class="text-center">번호</th>
				        		<th>회원번호</th>
				        		<th>이름</th>
				        		<th>이메일</th>
				        		<th>휴대폰</th>
				        		<th>관심카테고리</th></tr>
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
			        <div class="text-right">
						<button class="btn btn-warning excelBtn">Excel 다운</button>
					</div>
			    </div>
			</div>    
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
		
		// ajax
		$.ajax({
			type:"post",
			url:"${path}/AdminMember.do?method=ajaxlist&curPage=${paging.curPage}&pageSize=${paging.pageSize}",
			dataType:"json",
			success:function(data){
				var list = data.list;
				var show = $(".memtable").html();
				$.each(list,function(idx,AdminMember){
					show += "<tr onclick='javascript:go("+AdminMember.mem_code+")'";
					if(AdminMember.mem_curr != null ){
						show += "class='dropColor'"
					}
					show += ">";
					show += "	<td class='text-center'>"+AdminMember.cnt+"</td>";
					show += "	<td>"+AdminMember.mem_code+"</td>";
					show += "	<td>"+AdminMember.mem_name+"</td>";
					show += "	<td>"+AdminMember.mem_email+"</td>";
					var phone = ""+AdminMember.mem_phoneno;
					if(phone == "null") phone="없음";
					show += "	<td>"+phone+"</td>";
					show += "	<td>"+AdminMember.mem_favor+"</td></tr>";
				});
				show += "<tr><td colspan='6'></td></tr>"
				$(".memtable").html(show);
			},
			error:function(err){
				console.log("에러:"+err);
			}
		});
		
		
		$(".excelBtn").click(function(){
			if(confirm("모든 회원의 정보를 excel로 다운받습니다.")){
				$(location).attr("href","${path}/AdminMember.do?method=excel");
			}
		});
		
	})
	function go(mem_code){
		$("[name=mem_code]").val(mem_code);
		$("form").attr("action","${path}/AdminMember.do?method=detail");
		$("form").submit();
	}
	function goPage(no){
		$("[name=curPage]").val(no);
		$("form").submit();
	}
</script>
</html>