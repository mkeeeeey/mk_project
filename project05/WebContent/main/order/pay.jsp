<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="UTF-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PC냥이:컴퓨터 맞춰보자냥</title>
<style type="text/css">
/* 구매하기 */
	.pay-title{width:1050px; margin:0 auto;}
	.pay-thead tr th{padding:12px 10px; font-weight:700;}
	.pay-tbody tr td{padding:12px 10px; border-bottom:1px solid #cacaca; }
	.pay-wrap{width:1050px; margin:0 auto;}
	.pay-table-th{width:100%; border-top:3px solid #cacaca;}
	.pay-table-td{width:100%; border-top:1px solid #cacaca; border-collapse:collapse;}
	.pay-order{width:1050px; margin:20px auto;}
	.pay-delivery{width:1050px; margin:20px auto;}
	.pay-info{width:1050px; margin:20px auto;}
	.pay-price{width:1050px; margin:20px auto; text-align:right; padding:20px 10px;}
	.fmtnum{text-align:right;}
	.product-img {height: 60px; width: 60px; background-size: cover; background-position: center; background-repeat: no-repeat;}
	
	fieldset{border:2px solid #63145F;}
	legend{padding:5px 10px; font-weight:700; font-size:1.2em;}
	.pay-tit{heigth:35px;}
	.input-table{width:100%;}
	.input-wrap{width:220px; padding:7px 10px 9px;border:1px solid #dfdfdf;display:inline-block;vertical-align:middle;position:relative;}
	.input{width:100%;color:#3d4248;background:none; border:0;}
	.input-post{width:120px !important;}
	.input-btn{width:93px; margin:0;height:34px;line-height:34px;display:inline-block;color:#FFFFFF;font-size:12px;background:#63145F;text-align:center;vertical-align:middle;
	outline:none; border:none;}
	.input-addr{margin-top:4px; width:400px !important;line-height:1.4;padding:5px 10px 6px;border:1px solid #dfdfdf;display:block;vertical-align:middle;position:relative;}
	.request{width:400px !important; height:50px; padding:7px 10px 9px; border:1px solid #dfdfdf;vertical-align:middle;position:relative;}
	
/* 버튼 */
	.pay-btn{width:1050px; margin:20px auto 50px; text-align:center;}
	.btn{background:#63145F; color:#fff; border:none; position:relative; height:60px; font-size:1.5em; padding:0 2em; cursor:pointer;
	transition:800ms ease all; outline:none;}
	.btn:hover{background:#fff; color:#63145F;}
	.btn:before,.btn:after{content:''; position:absolute; top:0; right:0; height:2px; width:0; background: #63145F; transition:400ms ease all;}
	.btn:after{right:inherit; top:inherit; left:0; bottom:0;}
	.btn:hover:before,.btn:hover:after{width:100%; transition:800ms ease all;}
	
</style>
<script type="text/javascript" src="${path}/a00_com/jquery-3.4.1.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("결제하기");
		$("#usept").click(function(){
			var usePt = Number($("[name=point]").val());
			var usePtS = usePt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$("#discount").html("<input type='hidden' name='pay_point' value='"+usePt+"'/>"+usePtS);
			var tot = Number($("[name=totprice]").val());
			var last = tot - usePt;
			console.log("사용포인트"+usePt);
			var lastS = last.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			console.log("최종결제금액"+last);
			$("#lastPay").html("<input type='hidden' name='pay_price' value='"+last+"'/>"+lastS);
		});
		$("[name=payBtn]").click(function(){
			$("[name=proc]").val("pay");
			$("form").submit();
		});
<%--
		var cnt = Number($("#cnt"+no).val());
		var price = Number($("#price"+no).val());
		var totPay = Number($("[name=totalPay]").val());
--%>

		var ord_name = "${addr.ord_name}";
		var ord_tel = "${addr.ord_tel}";
		var ord_post = "${addr.ord_post}"
		var ord_addr1 = "${addr.ord_addr1}";
		var ord_addr2 = "${addr.ord_addr2}";
		
		$("[name=delivery]").eq(0).click(function(){
			$("[name=ord_name]").val(ord_name);
			$("[name=ord_tel]").val(ord_tel);
			$("[name=ord_post]").val(ord_post);
			$("[name=ord_addr1]").val(ord_addr1);
			$("[name=ord_addr2]").val(ord_addr2);
		});
		
		$("[name=delivery]").eq(1).click(function(){
			$("[name=ord_name]").val("");
			$("[name=ord_tel]").val("");
			$("[name=ord_post]").val("");
			$("[name=ord_addr1]").val("");
			$("[name=ord_addr2]").val("");
		});

		


	});
	function findpost() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zip').value = data.zonecode;
                document.getElementById("addr").value = roadAddr;
                
            }
        }).open();
    }
</script>
</head>
<body>
	<jsp:include page="../top.jsp"/>
	<header class="pay-title">
		<h2></h2>
	</header>
	
	<form method="post">
		<input type="hidden" name="proc" />
		<input type="hidden" name="mem_id" value="${mem.mem_id}"/>
		<div class="pay-wrap">
			<table class="pay-table-th">
				<colgroup>
					<col width="5%">
					<col width="55%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead class="pay-thead">
					<tr>
						<th></th><th>상품명</th><th>수량</th><th>가격</th><th>합계</th><th>포인트</th>
					</tr>
				</thead>
			</table>
			<table class="pay-table-td">
				<colgroup>
					<col width="5%">
					<col width="55%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<tbody class="pay-tbody">
					<c:forEach var="cart" varStatus="status" items="${buylist}">
					<input type="hidden" name="req_no" value="${cart.req_no}"/>
					<tr>
						<td></td>
						<td>
							<span><img class="product-img" src="image/parts/${cart.parts_img}"/></span><span style="vertical-align:middle;">${cart.parts_name}</span>
						</td>
						<td style="text-align:center;"><input type="hidden" name="req_cnt" value="${cart.req_cnt}"/>${cart.req_cnt}</td>
						<td class="fmtnum"><fmt:formatNumber type="number" value="${cart.parts_price}"/> 원</td>
						<td class="fmtnum"><fmt:formatNumber type="number" value="${cart.parts_price*cart.req_cnt}"/> 원</td>
						<td class="fmtnum">
							<fmt:formatNumber type="number" value="${(cart.req_cnt*cart.parts_price*0.01)+(((cart.req_cnt*cart.parts_price*0.01)%1>0.5)?(1-((cart.req_cnt*cart.parts_price*0.01)%1))%1:-((cart.req_cnt*cart.parts_price*0.01)%1))}"/> p
						</td>
					</tr>
					<c:set var="totPay" value="${totPay+cart.parts_price*cart.req_cnt}"/>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="pay-order">
			<fieldset>
				<legend>주문자 정보 확인</legend>
				<table class="input-table">
					<col width="17%">
					<col width="83%">
					<tr>
						<th>이름</th>
						<td>
							<div class="input-wrap"><input class="input" type="text" name="name" value="${mem.mem_id}"/></div>
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>
							<div class="input-wrap"><input class="input" type="text" name="tel" value="${mem.mem_tel}"/></div>
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<div class="input-wrap"><input class="input" type="email" name="email" value="${mem.mem_email}"/></div>
						</td>
					</tr>
				</table>
			</fieldset>
		</div>
		
		<div class="pay-delivery">
			<fieldset>
				<legend>배송정보입력</legend>
				<table class="input-table">
					<col width="17%">
					<col width="83%">
					<tr>
						<th class="pay-tit">배송지선택</th><td><input type="radio" name="delivery" value="old" checked/>최근 배송지<input type="radio" name="delivery" value="new"/>새 배송지</td>
					</tr>
					<tr>
						<th>수령인</th>
						<td>
							<div class="input-wrap"><input class="input" type="text" name="ord_name" value="${addr.ord_name}"/></div>
						</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>
							<div class="input-wrap"><input class="input" type="text" name="ord_tel" value="${addr.ord_tel}"/></div>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<div onclick="findpost()">
								<span class="input-wrap input-post">
									<input type="text" id="zip" class="input" name="ord_post" value="${addr.ord_post}" readonly/>
								</span>
								<input class="input-btn" type="button" value="우편번호찾기"/>
							</div>
							<div class="input-addr">
								<input type="text" id="addr" class="input" name="ord_addr1" value="${addr.ord_addr1}" readonly/>
							</div>
							<div class="input-addr">
								<input type="text" class="input" name="ord_addr2" value="${addr.ord_addr2}"/>
							</div>
						</td>
					</tr>
					<tr>
						<th>주문 요청사항</th>
						<td>
							<div class="request">
								<textarea name="ord_req" style="width:100%; border:none; height:100%; resize:none;" scrolling="yes"></textarea>
							</div>
						</td>
					</tr>
				</table>
			</fieldset>
		</div>
		
		<div class="pay-info">
			<fieldset>
				<legend>결제/할인 선택</legend>
				<table class="input-table">
					<col width="17%">
					<col width="83%">
					<tr>
						<th>결제 방법 선택</th>
						<td>
							<input type="radio" name="pay_method" value="무통장입금" checked/>무통장입금
							<input type="radio" name="pay_method" value="카드결제"/>카드결제
						</td>
					</tr>
					<tr>
						<th>포인트 사용</th>
						<td>
							<span class="input-wrap input-post">
								<input type="text" class="input" name="point"/>
							</span>
							<input class="input-btn" type="button" id="usept" value="사용"/>
							(<fmt:formatNumber type="number" value="${point}"/> p 사용가능)
						</td>
					</tr>
				</table>
			</fieldset>
		</div>
		
		<div class="pay-price">
			<fieldset>
				<h3>총 금액 : <span><input type="hidden" name="totprice" value="${totPay}"/><fmt:formatNumber type="number" value="${totPay}"/></span> 원</h3>
				<h3>할인금액 : <span id="discount"></span> 원</h3>
				<h1>최종결제금액 : <span id="lastPay"><fmt:formatNumber type="number" value="${totPay}"/></span> 원</h1>
			</fieldset>
		</div>
	</form>
	
	<div class="pay-btn">
		<input class="btn" type="button" name="payBtn" value="결제하기"/>
	</div>
	
	<jsp:include page="../bottom.jsp"/>
	
</body>
</html>