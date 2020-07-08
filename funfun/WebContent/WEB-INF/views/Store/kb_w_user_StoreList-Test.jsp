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
<title>Insert title here</title>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/es6-promise@4/dist/es6-promise.min.js" type="text/javascript"></script>
<script>
		
		$(document).ready(function(){
			
			var test = '${list}';
			console.log(test);
			$("#cate_all").click(function(){
				$("[name=cate_title]").val("");
				$("#cate_form").submit();

			});

			$("#cate_edu").click(function(){
				$("[name=cate_title]").val("교육");
				$("#cate_form").submit();

			});
			$("#cate_fashion").click(function(){
				$("[name=cate_title]").val("패션");
				$("#cate_form").submit();

			});
			$("#cate_homeliving").click(function(){
				$("[name=cate_title]").val("홈리빙");
				$("#cate_form").submit();

			});
			$("#cate_culture").click(function(){
				$("[name=cate_title]").val("공연");
				$("#cate_form").submit();

			});
			$("#cate_sports").click(function(){
				$("[name=cate_title]").val("스포츠");
				$("#cate_form").submit();

			});
			$("#cate_book").click(function(){
				$("[name=cate_title]").val("출판");
				$("#cate_form").submit();

			});
			$("#cate_animal").click(function(){
				$("[name=cate_title]").val("반려동물");
				$("#cate_form").submit();

			});
			$("#cate_tech").click(function(){
				$("[name=cate_title]").val("테크");
				$("#cate_form").submit();

			});
			
			$("#sort_select").change(function(){
				var sort = $("#sort_select  option:selected").val();
				$("#store_sort").val(sort);
				$("#sort_form").submit();
				
			})
			
		});
		
		function go(code){
			$(location).attr("href", "store.do?method=detail&sto_code="+code);
		}
		
	
</script>
<link rel="stylesheet" href="css/kb_w_user_StoreList.css"/>
<script src="js/kb_w_user_StoreList.js"></script>
</head>
<body>
	
	<div class="main">
	    <div class="container tim-container" style="max-width:1200px; padding-top:100px">
	    <div id="store_title">리워드 스토어</div>
	    <form method="post" id="cate_form">
	    <div class="row" style="text-align:center; margin-top:50px;">
				<div class="" style="text-align:center; width:120px; display:inline-block; cursor:pointer" id="cate_all">
					<img src="${path}/img/all.png" alt="Circle Image" class="img-circle" style="width:100px;">
					<h6>전체보기</h6>
				</div>
				<div class="" style="text-align:center; width:120px; display:inline-block; cursor:pointer"  id="cate_edu">
					<img src="${path}/img/edu.PNG" alt="Circle Image" class="img-circle" style="width:100px;">
					<h6>교육·키즈</h6>
				</div>
				<div class="" style="text-align:center; width:120px; display:inline-block; cursor:pointer"  id="cate_fashion">
					<img src="${path}/img/beauty.PNG" alt="Circle Image" class="img-circle" style="width:100px;">
					<h6>패션·잡화·뷰티</h6>
				</div>
				<div class="" style="text-align:center; width:120px; display:inline-block; cursor:pointer"  id="cate_homeliving">
					<img src="${path}/img/homeLiving.png" alt="Circle Image" class="img-circle" style="width:100px;">
					<h6>홈리빙·디자인소품</h6>
				</div>
				<div class="" style="text-align:center; width:120px; display:inline-block; cursor:pointer"   id="cate_culture">
					<img src="${path}/img/culture.PNG" alt="Circle Image" class="img-circle" style="width:100px;">
					<h6>공연·컬쳐</h6>
				</div>
				<div class="" style="text-align:center; width:120px; display:inline-block; cursor:pointer"  id="cate_sports">
					<img src="${path}/img/sports.png" alt="Circle Image" class="img-circle" style="width:100px;">
					<h6>스포츠·모빌리티</h6>
				</div>
				<div class="" style="text-align:center; width:120px; display:inline-block; cursor:pointer"  id="cate_book">
					<img src="${path}/img/book.png" alt="Circle Image" class="img-circle" style="width:100px;">
					<h6>출판</h6>
				</div>
				<div class="" style="text-align:center; width:120px; display:inline-block; cursor:pointer"  id="cate_animal">
					<img src="${path}/img/dog.PNG" alt="Circle Image" class="img-circle" style="width:100px;">
					<h6>반려동물</h6>
				</div>
				<div class="" style="text-align:center; width:120px; display:inline-block; cursor:pointer"  id="cate_tech">
					<img src="${path}/img/electro.PNG" alt="Circle Image" class="img-circle" style="width:100px;">
					<h6>테크·가전</h6>
				</div>
            </div>
            <input type="hidden" name="cate_title">
            </form>
			 <div id="Product_Search_Div">
        <span id="Cate_Search_Span">${cateTitle}</span>
        <div id="Search_Div">
        	<form method="post" id="search_form">
                <ul class="nav navbar-nav">
                  <li class="active">
                    <div class="form-group">
                      <input type="text" value="" placeholder="상품을 검색해주세요!" class="form-control" style="background-color: transparent; color:black;
                      margin:15px 3px; border:none; margin-top:-4px; margin-left:0px" name="sto_title"/>
                    </div>
                  </li>
                  <li><button type="submit" class="fa fa-search" style="border:none; background-color: transparent; color:black;
                    margin: 26px 3px; margin-top:12px; margin-right:30px"></button></li>
                    <li><select class="form-control" id="sort_select" style="width:150px">
                	<option value=""></option>
                	<option value="up">낮은가격순</option>
                	<option value="down">높은가격순</option>
                </select></li>
                </ul>
              
              </form>
        	  <form method="post" id="sort_form">
        	  	 <input type="hidden" id="store_sort" name="store_sort">
        	  </form>
        </div>

    </div><br>
    
	    <div style="background-color: rgb(245, 247, 250); margin:30px auto 0;">
	    <div class="row" style="padding-bottom:100px;">
	    	<form id="cntForm" method="get">
			<input type="hidden" id="curPage" name="curPage" value="${sch.curPage}">
			<input type="hidden" name="method" value="detail">
	          <c:forEach items="${slist}" var="store">
	        	<div class="col-xs-12 col-md-3 item" onclick="go(${store.sto_code})">
	            <div class="thumbnail storeList-item">
	              <img src="img/${store.sto_image}" alt="..." style="height:180px; width:320px">
	              <div class="caption store-info">
	                
	                <p class="item__title">${store.sto_title }</p>
	                <span class="item__category">${store.cate_title}</span><span class="item__money"><span id="price">
	                <fmt:formatNumber type="number" maxFractionDigits="3" value="${store.sto_price}"/></span>원</span>
	              </div>
	            </div>
	          </div>
	          </c:forEach>
	          
	      </div>	
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
	  </form>
	</div>
	
	<!-- end main -->
</body>
<script>
	var vm = new Vue({
		el:"#show",
		data:{msg:"key이벤트로 검색!!",name:"",
			  contactlist:[]},
		methods:{
			search:function(e){
				// e.keyCode : 입력한 코드값
				if(e.keyCode == 13){
					// enter를 입력했을 때, 해당 객체의 입력값..
					console.log("검색된 값:"+e.target.value);
					console.log("모델의 name 값:"+this.name);
					// 입력한 글자가 2자이상일 때,
					if(this.name.length>=2){
						// 현재 객체의 메서드명fetchContacts를 호출한다.
						this.fetchContacts();
					}
				}
			},
			fetchContacts:function(){
				// 모델데이터 초기화.
				this.contactlist=[];
				// 비동기로 처리할 url 주소..
				var url = "http://sample.bmaster.kro.kr/contacts/search/"+this.name;
				/*
				# fetch api를 통한 비동기 통신 처리..
				1. 기본 형식.
					fetch(url).then(함수1).then(함수2).catch(함수3);
					1) url : 요청할 주소
					2) 함수1: 서버에서 받은 response
						function(response){   
							return response.json()
						}
					3) 함수2 : 함수1의 return값을 매개값을 받아서 처리.
						function(json){
							받은 json데이터 객체로 vue화면 구성처리
						}
					3) 함수3 : 위에 내용을 처리했을 때, 예외에 대한 함수
						처리..
				*/
				var vm = this; // 현재 Vue객체를 fetch api
				// 함수 안에 쓰기위해 이름을 지정..
				fetch(url).then(function(response){
					console.log("## 서버에서 온 response 값 ##");
					console.log(response);
					return response.json();
				}).then(function(json){
					console.log("## 서버에서 온 json데이터 ##");
					console.log(json);
					// 서버에서 온 json 데이터 model데이터로 mapping
					// this: fetch 구분..
					// 모델데이터에 mapping 처리.
					// ajax로 온 json데이터를 model데이터에 mapping
					vm.contactlist=json;
					
				}).catch(function(err){
					console.log("## 에러 발생 ##");
					console.log(err);
				});
			}
		}
	});
</script>
</html>
</html>