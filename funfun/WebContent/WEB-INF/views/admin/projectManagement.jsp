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
<link rel="stylesheet" href="${path}/css/kb_w_admin_storeList.css">
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<link href="${path }/adminTemplate/css/styles.css" rel="stylesheet" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
    <script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/es6-promise@4/dist/es6-promise.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
 <script>
        $(document).ready(function(){
            $(".tr_btn").click(function(){
                $("#myModal").modal("show");
            })

            $("#appr_Btn").click(function(){
                $("#appr_modal").modal("show");
            })
            
            $("#Seach_Btn").click(function(){
            	$("#SearchForm").submit();
            })
        })
        
        function goPage(no){
			$("#curPage").val(no);
			$("#cntForm").submit();
		}
    </script>
</head>
<body class="sb-nav-fixed">
    <%@ include file="/adminTemplate/navi.jsp" %>
    <div id="layoutSidenav">
        <%@ include file="/adminTemplate/leftSidebar.jsp" %>
        <div id="layoutSidenav_content">
            <main style="width:1000px; margin-left:auto; margin-right:auto" id="store_main">
            <!-- 메인태그 안의 내용을 수정해서 작성하세요 -->
                <h1 id="list_Title">프로젝트 목록</h1>
        <div id="list_Div">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>상품명</th>
                        <th>메이커명</th>
                        <th>등록날짜</th>
                        <th>상태</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="project" items="${plist}">
	                    <tr class="tr_btn" data-target="#myModal" v-on:click="search('${project.pro_code}')">
	                        <td>${project.pro_code}</td>
	                        <td>${project.pro_title }</td>
	                        <td>${project.maker_name }</td>
	                        <td>${project.pro_reg_date}</td>
	                        <td>${project.pro_curr}</td>
	                    </tr>
                 	</c:forEach>
                </tbody>
            </table>
        </div>
		<form id="cntForm" method="post">
			<input type="hidden" id="curPage" name="curPage" value="${sch.curPage}">
         <div class="text-center" style="width:100%; text-align:center">
		        <ul class="pagination"> 
					<li><a href="javascript:goPage(${paging.startBlock-1})">&laquo;</a></li>
					<c:forEach var="cnt" begin="${paging.startBlock}" end="${paging.endBlock}">
						<li class="${paging.curPage==cnt?'active':'' }"><a href="javascript:goPage(${cnt})">${cnt}</a></li>
					</c:forEach>
					<li><a href="javascript:goPage(${paging.endBlock==paging.pageCount?paging.pageCount:paging.endBlock+1})">&raquo;</a></li>
				</ul>
	        </div>
			</form>
			
				<form method="post" id="SearchForm">
				     
	        		<div id="Serach_Div" style="width:100%; text-align:center">
                      <input type="text" value="" placeholder="프로젝트를 검색해주세요!" class="form-control" style="background-color: transparent; color:black;
                      margin:15px 3px; border:none; margin-top:-4px; margin-left:0px; width:200px; float:left;" name="pro_title"/>
                      <button type="submit" class="fa fa-search" style="border:none; background-color: transparent; color:black;
                      margin-top:5px; margin-right:30px;float:left" id="Seach_Btn"></button>
            		</div>
			</form>
       		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                 
                  <h4 class="modal-title" id="exampleModalLabel">프로젝트 미리보기</h4>
                   <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                      <label for="message-text" class="control-label">프로젝트 제목 : </label><br>
                      <label for="message-text" class="control-label">{{detail.pro_title}}</label>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="control-label">상품이미지</label><br>
                        <img :src="detail.pro_image" style="width:300px; height:120px">
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="control-label">내용</label><br>
                        <textarea class="form-control" id="message-text">{{detail.pro_story}}</textarea>
                    </div>

                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                  <button type="submit" class="btn btn-primary" id="appr_Btn">승인하기</button>
                </div>
              </div>
            </div>
          </div>
          <div class="modal fade" id="appr_modal" tabindex="-1" role="dialog" aria-labelleby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                    	 <h4 class="modal-title" id="exampleModalLabel">프로젝트 승인</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                       
                      </div>
                      <form method="post" action="project-update-curr.do">
                      <div class="modal-body">
                          
                          <div class="form-group" v-if="detail.pro_curr=='정지' || detail.pro_curr==''">
                                <label for="message-text" class="control-label">해당 프로젝트 을 승인하시겠습니까? </label><br><br>
                                <div style="text-align: center;">
                                    <input type="radio" class="form-data" value="정상" name="pro_curr">승인&nbsp;
                                    <input type="radio" class="form-data" value="정지" name="pro_curr">거절&nbsp;
                                    <input type="hidden" name="pro_code" :value="detail.pro_code">
                                </div>
                          </div>
                           <div class="form-group" v-else>
                          		<label for="message-text" calss="control-label">해당 상품은 이미 승인 처리 되었습니다</label>
                          </div>
                        
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <span v-if="detail.sto_curr=='정지' || sto_cur==''"><button type="submit" class="btn btn-primary" id="appr_Btn">승인</button></span>
                      </div>
                    </form>
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
<script>
	var vm = new Vue({
		el:"#store_main",
		data:{msg:"key이벤트로 검색!!",pro_code:"",
			 detail:""},
		methods:{
			search:function(pro_code){
				// e.keyCode : 입력한 코드값

					if(pro_code != null){
						// 현재 객체의 메서드명fetchContacts를 호출한다.
						this.fetchData(pro_code);
						
					}
				},
			
			fetchData:function(pro_code){
				// 모델데이터 초기화.
				this.contactlist=[];
				// 비동기로 처리할 url 주소..
				var url = "http://192.168.4.19:5080/funfun/project-detail.do?pro_code="+pro_code;
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
					vm.detail=json.detail;

					
				}).catch(function(err){
					console.log("## 에러 발생 ##");
					console.log(err);
				})
                }
			},
		});
	
</script>
</html>