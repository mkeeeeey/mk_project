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
            });
            $("#uptBtn").click(function(){
            	$("#uptReport").attr("action", "${path}/project-report-update.do");
            	$("#uptReport").submit();
            });
        });
        
        function goPage(no){
        	$("[name=curPage]").val(no);
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
				<h1 id="list_Title">프로젝트 신고목록</h1>
		        <div id="list_Div">
		            <table class="table table-hover">
		                <thead>
		                    <tr>
		                        <th>번호</th>
		                        <th>프로젝트명</th>
		                        <th>신고자</th>
		                        <th>신고날짜</th>
		                        <th>상태</th>
		                    </tr>
		                </thead>
		                <tbody>
		                	<c:forEach var="report" items="${report}">
								<tr class="tr_btn" data-target="#myModal" v-on:click="search('${report.report_code}')">
									<td>${report.report_code}</td>
									<td>${report.pro_title}</td>
									<td>${report.mem_name}</td>
									<td>${report.report_date}</td>
									<td>${report.report_curr}</td>
								</tr>
							</c:forEach>
		                </tbody>
		            </table>
		        </div>
				<form id="cntForm" method="post">
					<input type="hidden" name="curPage" value="${paging.curPage}"/>
				</form>
				<div class="text-center" style="width:100%; text-align:center">
					<ul class="pagination ct-orange"> 
						<li><a href="javascript:goPage(${paging.startBlock-1})">&laquo;</a></li>
						<c:forEach var="cnt" begin="${paging.startBlock}" end="${paging.endBlock}">
							<li class="${paging.curPage==cnt?'active':''}"><a href="javascript:goPage(${cnt})">${cnt}</a></li>
						</c:forEach>
						<li><a href="javascript:goPage(${paging.endBlock==paging.pageCount?paging.pageCount:paging.endBlock+1})">&raquo;</a></li>
					</ul>
				</div>
		
			    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="display: none;">
					<div class="modal-dialog">
						<div class="modal-content" style="width:1000px;">
							<div class="modal-header">
								<h4 class="modal-title" id="exampleModalLabel">신고 내역 상세보기</h4>
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							</div>
							<div class="modal-body">
								<div class="form-group">
									<label for="message-text" class="control-label">프로젝트 제목 : </label><br>
									<label for="message-text" class="control-label">{{detail.pro_title}}</label>
								</div>
								<div class="form-group">
									<label for="message-text" class="control-label">신고 내역</label><br>
									<textarea class="form-control" id="message-text" style="resize: none;">{{detail.report_detail}}</textarea>
								</div>
								<div class="form-group">
									<label for="message-text" class="control-label">첨부 자료</label><br>
									<img :src="detail.report_img" style="width: 500px;height: 400px;">
								</div>
							<form method="post" id="uptReport">
								<div class="form-group">
									<label for="message-text" class="control-label">신고 내역 확인</label><br>
									<div>
										<input type="radio" class="form-data" value="승인" name="report_curr">&nbsp;승인&nbsp;
										<input type="radio" class="form-data" value="기각" name="report_curr">&nbsp;기각&nbsp;
										<input type="hidden" name="report_code" :value="detail.report_code">
									</div>
								</div>
							</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default btn-simple" data-dismiss="modal">Close</button>
								<div class="divider"></div>
								<button type="button" id="uptBtn" class="btn btn-info btn-simple">Save</button>
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
<script>
	var vm = new Vue({
		el:"#store_main",
		data:{msg:"key이벤트로 검색!!",report_code:"",
			 detail:""},
		methods:{
			search:function(report_code){
				if(report_code != null){
					this.fetchData(report_code);
				}
			},
		fetchData:function(report_code){
			// 모델데이터 초기화.
			this.contactlist=[];
			// 비동기로 처리할 url 주소..
			var url = "http://192.168.4.19:5080/funfun/project-report.do?report_code="+report_code;
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