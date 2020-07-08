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
		
		var article = (".noticeList .notishow");  
	    $(".noticeList .item  td").click(function() {  
	    	var myArticle =$(this).parents().next("tr");  
	        if($(myArticle).hasClass('hide')) {  
	            $(article).removeClass('notishow').addClass('hide');  
	            $(myArticle).removeClass('hide').addClass('notishow');  
	        }  
	        else {  
	            $(myArticle).addClass('hide').removeClass('notishow');  
	        }  
	    });
	    
	    
	    
	    
	    $("#pageSize").change(function(){
	    	$("#curPage").val(1);	// 페이지크기를 바꾸면 초기 첫페이지가 나오도록 처리
			$("form").submit();
			
		});
	    
	    $("#notice").click(function(){
	    	$(location).attr("href","${path}/notice.do?method=list");
	    });
	    $("#faq").click(function(){
	    	$(location).attr("href","${path}/faq.do?method=list");
	    });
	})
	
	function goPage(no){
		// submit되는 페이지가 왜?? notice.do? ???
		$("#curPage").val(no);
		$("form").submit();
	}
	
</script>
</head>
<body>
	<div class="main">
	    <div class="container tim-container noticeList" style="max-width:1200px; padding-top:100px">
	        <div class="collapse navbar-collapse text-center">
	        	<div class="btn-group btn-group-lg scnav" style="width:80%;">
					<button type="button" class="btn btn-fill btn-warning" id="notice" style="width:50%;">공지사항</button>
					<button type="button" class="btn btn-warning" id="faq" style="width:50%;">FAQ</button>
				</div>
	        </div>
	        <div class="sctitle">
		        <h2>공지사항</h2>
		    </div>
	    	<form:form class="form" commandName="paging" method="post">
	    	<form:hidden path="curPage" />
	    	<div class="row">
	        	<div class="col-sm-3 text-left">총건수 : ${paging.count}건</div> 
	        	<div class="col-sm-9 text-right" >페이지수 :
	        	<form:select path="pageSize">
	        		<form:option value="5">5건</form:option>
	        		<form:option value="10">10건</form:option>
	        		<form:option value="20">20건</form:option>
	        	</form:select></div>
			</div>
			</form:form>
			<div>
		        <table class="table table-hover sctable">
		        	<col width="10%">
		        	<col width="50%">
		        	<col width="20%">
		        	<col width="20%">
		        	<tr><th>번호</th>
		        		<th>제목</th>
		        		<th>작성자</th>
		        		<th>등록일</th></tr>
		        	<c:forEach var="noti" items="${toplist}">
			        	<tr class="item" ><td>중요</td>
			        		<td>${noti.noti_title}</td>
			        		<td>${noti.admin_name}</td>
			        		<td>${noti.noti_reg_date}</td></tr>
			        	<tr class="hide"><td></td><td colspan="3"><pre><c:out value="${noti.noti_detail}" /></pre></td></tr>	
		        	</c:forEach>
		        	<c:forEach var="noti" items="${list}">
			        	<tr class="item"><td>${noti.cnt}</td>
			        		<td>${noti.noti_title}</td>
			        		<td>${noti.admin_name}</td>
			        		<td>${noti.noti_reg_date}</td></tr>
			        		<!-- style="white-space:pre;" -->
			        	<tr class="hide"><td></td><td colspan="3" ><pre><c:out value="${noti.noti_detail}" /></pre></td></tr>
		        	</c:forEach>
		        	<tr><td colspan="4"></td></tr>
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
	    </div>
	</div>
	<!-- end main -->
</body>
</html>