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
<title>FunFun - 템플릿</title>
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
			        <div class="sctitle">
				        <h2>FAQ 등록</h2>
				    </div>
			        <div>
				    	<form class="form-group" method="post">
					    	<input type="hidden" name="admin_code" value="${manager.admin_code}" />
					    	<table class="table table-bordered">
					        	<col style="width:15%">
					        	<col style="width:85%">
					        	<tr><th>제목<p style="font-size:1px;"><span class="titleLengthCk">0</span> / 30</p></th>
					        		<td colspan="3"><input type="text" class="form-control faq_title" name="faq_title" placeholder="FAQ 제목" /></td></tr>
					        	<tr><th>내용<p style="font-size:1px;"><span class="detailLengthCk">0</span> / 600</p></th>
					        		<td colspan="3">
					        			<textarea class="form-control faq_detail" name="faq_detail" placeholder="FAQ 내용" style="resize: none;" rows="20"></textarea></td></tr>
					        </table>
				        </form>
				    </div>
				    <div class="text-right">
				    	<button class="btn btn-fill btn-warning insertFaq">등록</button>
				    	<button class="btn btn-fill btn-warning goList">목록</button>
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
		var faq_title = "${faq.faq_title}";
		if(faq_title != ""){
			if(!confirm("추가로 등록하시겠습니까?")){
				$(location).attr("href","${path}/faq.do?method=admList");
			}
		}
		
		
		$(".faq_title").keyup(function(e){
			var textLength = $(".faq_title").val().length;
			$(".titleLengthCk").text(textLength);
			if(!maxLengthCheck($(".faq_title"),30)){
				textLength = $(".faq_title").val().length;
				$(".titleLengthCk").text(textLength);
			}
		});
		
		$(".faq_detail").keyup(function(e){
			var textLength = $(".faq_detail").val().length;
			$(".detailLengthCk").text(textLength);
			if(!maxLengthCheck($(".faq_detail"),600)){
				textLength = $(".faq_detail").val().length;
				$(".detailLengthCk").text(textLength);
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
		
		
		
		
		$(".insertFaq").click(function(){
			var title = ""+$("[name=faq_title]").val();
			var detail = ""+$("[name=faq_detail]").val();
			
			if(confirm("등록하시겠습니까?")){
				if(title != "" && detail != ""){
					$("form").attr("action","${path}/faq.do?method=insert");
					$("form").submit();
				}else{
					alert("제목 및 내용을 입력하세요.");
				}
			}
		});
		
		$(".goList").click(function(){
			//alert("목록으로 이동");
			$(location).attr("href","${path}/faq.do?method=admList");
		});
		
	})
</script>
</html>

