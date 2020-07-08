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
			        <div class="memtitle" style="margin:150px 0 30px;">
				        <h2>회원 상세정보</h2>
				    </div>
			        <div>
				    	<form class="form-group" method="post" action="${path}/AdminMember.do?method=update">
					    	<input type="hidden" name="mem_opt" />
					    	<table class="table table-bordered">
					        	<col style="width:20%">
					        	<col style="width:30%">
					        	<col style="width:20%">
					        	<col style="width:30%">
					        	<tr><th>회원번호</th>
					        		<td><input type="hidden" name="mem_code" value="${AdminMember.mem_code}"/>${AdminMember.mem_code}</td>
					        		<th>이메일</th>
					        		<td>${AdminMember.mem_email}</td></tr>
					        	<tr><th>이름</th>
					        		<td>${AdminMember.mem_name}</td>
					        		<th>휴대폰번호</th>
					        		<td>${not empty AdminMember.mem_phoneno?AdminMember.mem_phoneno:"없음"}</td></tr>
					        	<tr><th rowspan="2">프로필</th>
					        		<td rowspan="2"><img src="${AdminMember.mem_profile}" style="width:90px; height:90px;"
					        				onerror="this.src='https://stickershop.line-scdn.net/stickershop/v1/product/1629282/LINEStorePC/main.png;compress=true'" /></td>
					        		<th>관심 카테고리</th>
					        		<td>${AdminMember.mem_favor}</td></tr>
					        	<tr><th>회원상태</th>
					        		<td><c:if test="${not empty AdminMember.mem_curr}">제재 회원<br>(${AdminMember.mem_curr})</c:if>
					        			<c:if test="${empty AdminMember.mem_curr}" >서포터 회원</c:if></td></tr>
					        	<tr><th>계좌은행</th>
					        		<td>${not empty AdminMember.mem_bank?AdminMember.mem_bank:"없음"}</td>
					        		<th>계좌번호</th>
					        		<td>${not empty AdminMember.mem_account?AdminMember.mem_account:"없음"}</td></tr>
					        	<tr><th>보유 예치금</th>
					        		<td><fmt:formatNumber pattern="###,###" value="${AdminMember.mem_balance}"/> 원</td>
					        		<th>메이커유무</th>
					        		<td>${AdminMember.maker_code == 0?"서포터회원":"메이커회원"}</td></tr>
					        </table>
				        </form>
				    </div>
				    <div class="text-right">
				    	<button class="btn btn-fill btn-warning appr_Btn">회원 관리</button>
				    	<button class="btn btn-fill btn-warning goList">목록</button>
				    </div>
				    <div>
				    	<h3>펀딩 내역</h3>
				    	
						<!-- 참여한 펀딩 -->
						<div class="funding_display">
							<c:if test="${empty plist}">
							   <div class="emptyMsg">참여한 펀딩이 존재하지 않습니다</div>
							</c:if>
						<c:forEach var="list" items="${plist}" begin="0" end="5" step="1">
							<div class="row rowposition" >
						    	<div class="col-xs-1 col-md-1 "></div>
						        	<c:if test="${list.fundState eq '펀딩성공' || list.fundState eq '펀딩중'}">
						            	<div class="col-xs-10 col-md-10" class="fundingDiv" style="margin-bottom:50px;margin-top: 10px;">
								  			<span style="font-size:14px;color:gray;padding-bottom:10px;">펀딩번호 : ${list.fundingCode}</span>
						          			<div class="funding" style="margin-top:5px">
						            			<table class="col-xs-12 col-md-12">
						              				<col width="15%">
						              				<col width="85%">
						              				<tr><td class="funding__state">
											            <c:choose>
															<c:when test="${list.proLeftDate<0 and list.percent>=0.8}">펀딩성공 </c:when>	
															<c:when test="${list.proLeftDate>=0}"><span style="color:orange">펀딩중 </span></c:when>
														</c:choose>
						              					</td>
						              					<td class="funding__fund-date">참여일 : ${list.fundDate}</td></tr>
									                <tr><td class="funding__name" colspan="2">[ ${list.cateTitle} ] ${list.proTitle}</td></tr>
									                <tr><td class="funding__company">by ${list.makerName}</td><td></td></tr>
									                <tr><td colspan="2"><hr class="funding--hr"></td></tr>
									                <tr><td class="funding__detail">펀딩금액</td>
									                	<td class="funding__detail--text">
											            <fmt:formatNumber value="${list.fundPrice}" pattern="#,###,###원"/></td></tr>
										            <tr><td class="funding__detail">상품옵션</td><td class="funding__detail--text">${list.optTitle} -  ${list.optDetail} -  ${list.optCondition}</td></tr>
										                <fmt:parseDate var="optDeliverDate" value="${list.optDeliverDate}" pattern="yyyy-MM-dd HH:mm:ss" />  
										            <tr><td class="funding__detail">배송예정일</td>
										            	<td class="funding__detail--text">
						              					<fmt:formatDate value="${optDeliverDate}" pattern="yyyy-MM-dd"/></td></tr>
										            <tr><td class="funding__detail">배송상태</td><td class="funding__detail--text">${list.fundState}</td></tr>
										            <tr><td class="funding__detail">주소지정보</td><td class="funding__detail--text">${list.fundAddress}</td></tr>
						            			</table>
						        		 	</div>
						        		</div>
							       	</c:if>
							       	<c:if test="${list.fundState eq '펀딩취소' || list.fundState eq '펀딩실패' || list.fundState eq '배송중' || list.fundState eq '배송완료'}">
							       		<div class="col-xs-10 col-md-10" class="fundingDiv" style="margin-bottom:50px;margin-top: 10px;">
						          			<span style="font-size:14px;color:gray;padding-bottom:10px;">펀딩번호 : ${list.fundingCode}</span>
						          			<div class="funding" style="margin-top:5px">
						            			<table class="col-xs-12 col-md-12">
										              <col width="15%">
						              				  <col width="85%">
										              <tr><td class="funding__state">
										              <c:choose>
										             	<c:when test="${list.fundState eq '펀딩취소'}"><span style="color:gray">펀딩취소</span></c:when>
														<c:when test="${list.proLeftDate<0 and list.percent<0.8}"><span style="color:rgb(247,0,0)">펀딩실패 </span></c:when>
														<c:when test="${list.fundState eq '배송중'}"><span style="color:rgb(9,54,135)">배송중</span></c:when>
														<c:when test="${list.fundState eq '배송완료'}"><span style="color:rgb(9,54,135)">배송완료</span></c:when>
													  </c:choose>
										              </td><td class="funding__fund-date">참여일 : ${list.fundDate}</td></tr>
										              <tr><td class="funding__name" colspan="2">[ ${list.cateTitle} ] ${list.proTitle}</td></tr>
										              <tr><td class="funding__company">by ${list.makerName}</td><td></td></tr>
										              <tr><td colspan="2"><hr class="funding--hr"></td></tr>
										              <tr><td class="funding__detail">펀딩금액</td><td class="funding__detail--text">
										              <fmt:formatNumber value="${list.fundPrice}" pattern="#,###,###원"/>
										              </td></tr>
										              <tr><td class="funding__detail">상품옵션</td><td class="funding__detail--text">${list.optTitle} -  ${list.optDetail} -  ${list.optCondition}</td></tr>
										              <fmt:parseDate var="optDeliverDate" value="${list.optDeliverDate}" pattern="yyyy-MM-dd HH:mm:ss" />  
										              <tr><td class="funding__detail">배송예정일</td><td class="funding__detail--text">
										              <fmt:formatDate value="${optDeliverDate}" pattern="yyyy-MM-dd"/>
										              </td></tr>
										              <tr><td class="funding__detail">배송상태</td><td class="funding__detail--text">${list.fundState}</td></tr>
										              <tr><td class="funding__detail">주소지정보</td><td class="funding__detail--text">${list.fundAddress}</td></tr>
										        </table>
						         			</div>
						        		</div>	
							       	</c:if>
						        </div>
							</c:forEach>
						</div>
						<!-- 참여한 펀딩 끝 -->

				    	<h3>구매 내역</h3>
				    	
						<!-- 주문 및 배송조회 -->
						<div class="trans_display">
							<c:if test="${empty tlist}">
						    	<div class="emptyMsg">주문 및 배송내역이 존재하지 않습니다</div>
							</c:if>
							<c:if test="${!empty tlist}">
								<c:forEach var="list" items="${tlist}">
							        <div class="row rowposition" >
							        	<div class="col-xs-1 col-md-1 "></div>
							        	<c:choose>
										<c:when test="${list.orderCurr eq '주문취소' or list.orderCurr eq '배송완료' or list.orderCurr eq '배송중'}">
											<div class="col-xs-10 col-md-10 orderDiv" style="margin-bottom:50px;margin-top: 10px;">
												<span style="font-size:14px;color:gray;padding-bottom:10px;">주문번호 : ${list.orderCode}</span>
												<div class="funding" style="margin-top:5px">
													<table class="col-xs-12 col-md-12">
														<col width="15%">
						              					<col width="85%">
														<tr><td class="funding__state">
															<c:choose>
															<c:when test="${list.orderCurr eq '주문취소'}"><span style="color:gray">주문취소</span></c:when>
															<c:when test="${list.orderCurr eq '배송완료'}">배송완료 </c:when>	
															<c:when test="${list.orderCurr eq '배송중'}"><span style="color:orange">배송중 </span></c:when>
															<c:when test="${list.orderCurr eq '주문완료'}"><span style="color:orange">주문완료 </span></c:when>
															</c:choose>              
															</td><td class="funding__fund-date">주문일 : ${list.orderDate}</td></tr>
														<tr><td class="funding__name" colspan="2">${list.stoTitle}</td></tr>
														<tr><td class="funding__company">by ${list.makerName}</td><td></td></tr>
														<tr><td colspan="2"><hr class="funding--hr"></td></tr>
														<tr><td class="funding__detail">주문금액</td><td class="funding__detail--text">
															<fmt:formatNumber value="${list.orderPrice}" pattern="#,###,###원"/>
															</td></tr>
														<tr><td class="funding__detail">상품옵션</td><td class="funding__detail--text">${list.optDetail}</td></tr>
														<tr><td class="funding__detail">배송예정일</td><td class="funding__detail--text">
															<fmt:parseDate var="receivDate" value="${list.receivDate}" pattern="yyyy-MM-dd HH:mm:ss" />
															<fmt:formatDate value="${receivDate}" pattern="M월 dd일"/>에 배송 예정
															</td></tr>
														<tr><td class="funding__detail">주소지정보</td><td class="funding__detail--text">${list.orderAddress}</td></tr>
													</table>
												</div>
											</div>
										</c:when>
										<c:when test="${list.orderCurr eq '주문완료'}">
											<div class="col-xs-10 col-md-10 orderDiv" style="margin-bottom:50px;margin-top: 10px;">
												<span style="font-size:14px;color:gray;padding-bottom:10px;">주문번호 : ${list.orderCode}</span>
												<div class="funding" style="margin-top:5px">
													<table class="col-xs-12 col-md-12">
														<col width="15%">
						              					<col width="85%">
														<tr><td class="funding__state">
															<c:choose>
															<c:when test="${list.orderCurr eq '주문취소'}"><span style="color:gray">주문취소</span></c:when>
															<c:when test="${list.orderCurr eq '배송완료'}">배송완료 </c:when>	
															<c:when test="${list.orderCurr eq '배송중'}"><span style="color:orange">배송중 </span></c:when>
															<c:when test="${list.orderCurr eq '주문완료'}"><span style="color:orange">주문완료 </span></c:when>
															</c:choose>              
															</td><td class="funding__fund-date">주문일 : ${list.orderDate}</td></tr>
														<tr><td class="funding__name" colspan="2">${list.stoTitle}</td></tr>
														<tr><td class="funding__company">by ${list.makerName}</td><td></td></tr>
														<tr><td colspan="2"><hr class="funding--hr"></td></tr>
														<tr><td class="funding__detail">주문금액</td><td class="funding__detail--text">
															<fmt:formatNumber value="${list.orderPrice}" pattern="#,###,###원"/>
															</td></tr>
														<tr><td class="funding__detail">상품옵션</td><td class="funding__detail--text">${list.optDetail}</td></tr>
														<tr><td class="funding__detail">배송예정일</td><td class="funding__detail--text">
															<fmt:parseDate var="receivDate" value="${list.receivDate}" pattern="yyyy-MM-dd HH:mm:ss" />
															<fmt:formatDate value="${receivDate}" pattern="M월 dd일"/>에 배송 예정
															</td></tr>
														<tr><td class="funding__detail">주소지정보</td><td class="funding__detail--text">${list.orderAddress}</td></tr>
											        </table>
												</div>
											</div>
										</c:when>
								  		</c:choose>
						        	</div>
								</c:forEach>
							</c:if>
						</div>
						<br><br>
					<!-- 주문 및 배송 조회 끝 -->
				    </div>
			    </div>
			</div>


			<div class="modal fade" id="appr_modal" tabindex="-1" role="dialog" aria-labelleby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="exampleModalLabel">회원 관리</h4>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						</div>
						<div class="modal-body">
							<button type="button" class="btn btn-fill btn-warning text-left restrictionBtn" style="width:100%;">회원 제재 : 3개월 정지</button>
							<br><br>
							<button type="button" class="btn btn-fill btn-warning text-left dropBtn" style="width:100%;">회원 제명 : 10년 정지</button>
							<br><br>
							<button type="button" class="btn btn-fill btn-warning text-left clearBtn" style="width:100%;">회원 복귀</button>
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
				$("[name=mem_opt]").val(dateStr);
				$("form").submit();
			}
			
		});
		$(".dropBtn").click(function(){
			if(confirm("제명 조치하시겠습니까?")){
				date.setFullYear(date.getFullYear()+10);
				var dateStr = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDay();
				$("[name=mem_opt]").val(dateStr);
				$("form").submit();
			}
		});
		$(".clearBtn").click(function(){
			if(confirm("회원 복귀 하시겠습니까?")){
				$("[name=mem_opt]").val("");
				$("form").submit();
			}
		});
		$(".goList").click(function(){
			$(location).attr("href","${path}/AdminMember.do?method=list");
		});
		
	})
	
</script>
</html>