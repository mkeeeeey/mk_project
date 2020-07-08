<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/template/header.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="css/mk_user_w_projectList.css">
<style type="text/css">
a{cursor:pointer;}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		var proDay="${style}";
		console.log(proDay);
		var lists=document.querySelectorAll('.pro');
		if(proDay==='end'){
			lists[2].classList.add('active');
		} else  if(proDay==='come'){
			lists[1].classList.add('active');
		} else {
			lists[0].classList.add('active');
		}
		console.log("카테고리:"+$("[name=cate_title]").val());
		// 카테고리
		$("#all").click(function(){
			$("[name=cate_title]").val("");
			$("[name=projectsch]").val("");
			$("form").submit();
		});
		$("#edu").click(function(){
			$("[name=cate_title]").val("교육");
			$("[name=projectsch]").val("");
			$("form").submit();
		});
		$("#beauty").click(function(){
			$("[name=cate_title]").val("패션");
			$("[name=projectsch]").val("");
			$("form").submit();
		});
		$("#homeLiving").click(function(){
			$("[name=cate_title]").val("홈리빙");
			$("[name=projectsch]").val("");
			$("form").submit();
		});
		$("#culture").click(function(){
			$("[name=cate_title]").val("공연");
			$("[name=projectsch]").val("");
			$("form").submit();
		});
		$("#sports").click(function(){
			$("[name=cate_title]").val("스포츠");
			$("[name=projectsch]").val("");
			$("form").submit();
		});
		$("#book").click(function(){
			$("[name=cate_title]").val("출판");
			$("[name=projectsch]").val("");
			$("form").submit();
		});
		$("#dog").click(function(){
			$("[name=cate_title]").val("반려동물");
			$("[name=projectsch]").val("");
			$("form").submit();
		});
		$("#electro").click(function(){
			$("[name=cate_title]").val("테크");
			$("[name=projectsch]").val("");
			$("form").submit();
		});
		$("[name=prosort]").on("change", function(){
			$("[name=sort]").val($("[name=prosort]").val());
			$("form").submit();
		});
		$("#come").click(function(){
			$("[name=proday]").val("come");
			$("form").submit();
		});
		$("#end").click(function(){
			$("[name=proday]").val("end");
			$("form").submit();
		});
		$("#ing").click(function(){
			$("[name=proday]").val("ing");
			$("form").submit();
		});
		
		var sort = "${param.prosort}";
		$("[name=prosort]").val(sort);
		
	});
	function go_detail(no){
		$(location).attr("href", "funding.do?method=detail&pro_code="+no);
	}
	function goPage(no){
		$("[name=curPage]").val(no);
		$("form").submit();
	}

</script>
</head>
<body>
	<div class="main">
		<div class="container tim-container" style="max-width:1200px; padding-top:100px">
		<h2>펀딩하기</h2>
			
		<!-- 카테고리 -->
			<div class="row project-category" >
				<div class="categoryList" id="all">
					<img src="${path}/img/all.png" alt="Circle Image" class="img-circle" style="width:100px;">
					<h6>전체보기</h6>
				</div>
				<div class="categoryList" id="edu">
					<img src="${path}/img/edu.PNG" alt="Circle Image" class="img-circle" style="width:100px;">
					<h6>교육·키즈</h6>
				</div>
				<div class="categoryList" id="beauty">
					<img src="${path}/img/beauty.PNG" alt="Circle Image" class="img-circle" style="width:100px;">
					<h6>패션·잡화·뷰티</h6>
				</div>
				<div class="categoryList" id="homeLiving">
					<img src="${path}/img/homeLiving.png" alt="Circle Image" class="img-circle" style="width:100px;">
					<h6>홈리빙·디자인소품</h6>
				</div>
				<div class="categoryList" id="culture">
					<img src="${path}/img/culture.PNG" alt="Circle Image" class="img-circle" style="width:100px;">
					<h6>공연·컬쳐</h6>
				</div>
				<div class="categoryList" id="sports">
					<img src="${path}/img/sports.png" alt="Circle Image" class="img-circle" style="width:100px;">
					<h6>스포츠·모빌리티</h6>
				</div>
				<div class="categoryList" id="book">
					<img src="${path}/img/book.png" alt="Circle Image" class="img-circle" style="width:100px;">
					<h6>출판</h6>
				</div>
				<div class="categoryList" id="dog">
					<img src="${path}/img/dog.PNG" alt="Circle Image" class="img-circle" style="width:100px;">
					<h6>반려동물</h6>
				</div>
				<div class="categoryList" id="electro">
					<img src="${path}/img/electro.PNG" alt="Circle Image" class="img-circle" style="width:100px;">
					<h6>테크·가전</h6>
				</div>
            </div>
			<div class="ProjectListHead_bar">
				<h3 class="ProjectListHead_title">${category}</h3>
			</div>
		<!-- 분류 -->
	    	<div class="ProjectListHead_bar">
	    		
		  		<ul class="nav nav-tabs ">
		  		
					<li id="ing" class="pro" style="font-weight:700;"><a>진행중인 프로젝트</a></li>
					<li id="come" class="pro" style="font-weight:700;"><a>오픈예정 프로젝트</a></li>
					<li id="end" class="pro"  style="font-weight:700;"><a>종료된 프로젝트</a></li>
					<li style="right:0px; position:absolute;">	
					<form class="ProjectListHead_search" method="post" action="${path}/funding.do?method=list">
						<div>
							<input type="hidden" name="cate_title" value="${projSch.cate_title}"/>
							<input type="hidden" name="curPage" value="1"/>
							<input type="hidden" name="sort" value="${projSch.sort}"/>
							<input type="hidden" name="proday" value="${projSch.proday}"/>
							<label for="search-keyword">
								<input class="form-control" id="search-keyword" type="text" placeholder="검색어를 입력하세요" name="projectsch" value="${param.projectsch}">
								<button type="submit" style="border:none; background-color: transparent; color:black;" class="fa fa-search" aria-label="검색"></button>
							</label>
							<div class="select-sort ProjectListHead_sort">
								<select name="prosort" class="">
									<option value="popluar">인기순</option>
									<option value="recent">최신순</option>
									<option value="amount">펀딩액순</option>
									<option value="closing">마감임박순</option>
								</select>
							</div>
						</div>
						
				</form>
					</li>
				</ul>
			</div>
		
		<!-- 리스트 -->
			<div style="background-color: rgb(245, 247, 250); margin:30px auto 0;">
					<div class="row">
					
				<c:forEach var="proj" items="${plist}">
						<div class="col-xs-12 col-md-3 item" onclick="javascript:go_detail('${proj.pro_code}')">
							<div class="thumbnail projectList-item">
								<img alt="..." src="${proj.pro_image}">
								<div class="caption proj-info">
									<p class="ProjectList-title">${proj.pro_title}</p>
									<div class="maker-info">
										<span class="ProjectList-maker">${proj.cate_title} | ${proj.maker_name}</span>
									</div>
									<div>
									<fmt:parseDate var="pro_start" value="${proj.pro_start_date}" pattern="yyyy-MM-dd HH:mm:ss" />
									<jsp:useBean id="today" class="java.util.Date" />
									<c:choose>
										<c:when test="${pro_start>today}">
											
										</c:when>
										<c:otherwise>
											<span class="ProjectList-rate">펀딩률 : ${proj.percent}%</span>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${pro_start>today}">
											<span class="ProjectList-date" style="color: #ff9500;font-size: 15px;"><fmt:formatDate value="${pro_start}" pattern="MM월dd일"/> 오픈예정</span>
										</c:when>
										<c:when test="${proj.dday>0}">
											<span class="ProjectList-date">${proj.dday}일 남음</span>
										</c:when>
										<c:when test="${proj.dday<0}">
											<span class="ProjectList-date">펀딩 종료</span>
										</c:when>
										<c:when test="${proj.dday==0}">
											<span class="ProjectList-date">오늘 마감</span>
										</c:when>
									</c:choose>
									</div>
								</div>
							</div>
						</div>
				</c:forEach>
					</div>
		
			</div>
		<!-- 페이징 -->
			<div class="text-center">
		        <ul class="pagination ct-orange"> 
					<li><a href="javascript:goPage(${projSch.startBlock-1})">&laquo;</a></li>
					<c:forEach var="cnt" begin="${projSch.startBlock}" end="${projSch.endBlock}">
						<li class="${projSch.curPage==cnt?'active':''}"><a href="javascript:goPage(${cnt})">${cnt}</a></li>
					</c:forEach>
					<li><a href="javascript:goPage(${projSch.endBlock==projSch.pageCount?projSch.pageCount:projSch.endBlock+1})">&raquo;</a></li>
				</ul>
	        </div>
		
		</div>
	</div>
	<!-- end main -->
</body>
</html>