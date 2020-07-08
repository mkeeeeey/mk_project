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
		var title = "${paging.title}";
		
		var article = (".faqList .faqshow");  
	    $(".faqList .item  td").click(function() {  
	    	var myArticle =$(this).parents().next("tr");  
	        if($(myArticle).hasClass('hide')) {  
	            $(article).removeClass('faqshow').addClass('hide');  
	            $(myArticle).removeClass('hide').addClass('faqshow');  
	        }  
	        else {  
	            $(myArticle).addClass('hide').removeClass('faqshow');  
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
		$("#curPage").val(no);
		$("form").submit();
	}
</script>
</head>
<body>
	<div class="main">
	    <div class="container tim-container faqList" style="max-width:1200px; padding-top:100px">
	        <div class="collapse navbar-collapse text-center" >
	        	<div class="btn-group btn-group-lg scnav" style="width:80%;">
					<button type="button" class="btn btn-warning" id="notice" style="width:50%;">공지사항</button>
					<button type="button" class="btn btn-fill btn-warning" id="faq" style="width:50%;">FAQ</button>
				</div>
	        </div>
	        <div class="sctitle">
		        <h2>FAQ</h2>
		    </div>
	        <form:form class="form" commandName="paging" method="post">
	        <form:hidden path="curPage" />
	        <div>
				<ul class="nav navbar-nav">
					<li style="margin-right:700px;">총건수 : ${paging.count}건</li>
					<li class="active">
						<div class="form-group">
							<form:input path="title" placeholder="문의내용을 검색해보세요." class="form-control"
								style="background-color:transparent; color:black; margin:-10px 0px -25px; border:none;"/>
						</div>
					</li>
					<li><button type="submit" class="fa fa-search" style="border:none; background-color: transparent;
									color:black; margin-right:15px;"></button></li>
					<li>페이지수 : 
						<form:select path="pageSize">
		        		<form:option value="5">5건</form:option>
		        		<form:option value="10">10건</form:option>
		        		<form:option value="20">20건</form:option>
		        	</form:select></li>
				</ul>
			</div>
			</form:form>
			<div>
		        <table class="table table-hover sctable">
		        	<col width="10%">
		        	<col width="70%">
		        	<col width="20%">
		        	<tr><th>번호</th>
		        		<th>제목</th>
		        		<th>작성자</th></tr>
		        	<c:forEach var="faq" items="${list}">
			        	<tr class="item" ><td>${faq.cnt}</td>
			        		<td>${faq.faq_title}</td>
			        		<td>${faq.admin_name}</td>
			        	<tr class="hide"><td></td><td colspan="3"><pre><c:out value="${faq.faq_detail}" /></pre></td></tr>
			        	
		        	</c:forEach>
		        	<tr><td colspan="3"></td></tr>
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