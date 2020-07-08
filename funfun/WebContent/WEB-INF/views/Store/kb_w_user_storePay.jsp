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
<link rel="stylesheet" href="${path}/css/kb_w_user_StorePay.css">
<title>Insert title here</title>
<script>
function goPopup(){
	var pop = window.open("jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 	
}

function jusoCallBack(roadFullAddr,zipNo){
	$("[name=pay_zipcode]").val(zipNo);
	$("[name=pay_addr]").val(roadFullAddr);
	
	
}

$(document).ready(function(){
	var mem_price = '${mem_balance}';
	var pay_price = '${param.sto_price}';
	var pay_name;
	var pay_addr;
	var pay_phone;
	var pay_ship_req;
	
	$("#pay_btn").click(function(){
		pay_name = $("[name=pay_name]").val();
		pay_addr = $("[name=pay_addr]").val();
		pay_phone = $("[name=pay_phone]").val();
		pay_ship_req = $("[name=pay_ship_req]").val();
		
		if(pay_name != null && pay_name!='' && pay_addr != null && pay_addr != '' && 
				pay_phone != null && pay_phone != '' && pay_ship_req != null && pay_ship_req != ''){
			if(parseInt(mem_price) >= parseInt(pay_price)){
				$("form").submit();
			} else {
				alert("예치금이 부족합니다.");
			}
		} else {
			alert("배송지 정보를 입력해주세요");
		}
	
	});
	
	
})
</script>
</head>
<body>
	<div class="main">
	    <div class="container tim-container" style="max-width:1200px; padding-top:100px">
	        <h2 class="store_pay_Title">주문/결제</h2>
		<form method="post" action="store.do?method=payOrder">
        <div class="user_info_div">
            <h3>구매자정보</h3>
            <div class="user_info">
                <table class="store_table">
                    <tr class="store_tr">
                        <th class="store_th">이름</th>
                        <td class="store_td">${user.mem_name}
                        <input type="hidden" name="mem_code" value="${user.mem_code }"></td>
                    </tr>
                    <tr class="store_tr">
                        <th class="store_th">이메일</th>
                        <td class="store_td">${user.mem_email}</td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="user_shipping_info_Div">
            <h3>배송지 정보</h3>
            <table class="store_table">
                <tr class="store_tr">
                    <th class="store_th">이름</th>
                    <td class="store_td"><input type="text" name="pay_name" class="inputs"></td>
                </tr>
                <tr class="store_tr">
                    <th class="store_th">배송지정보</th>
                    <td class="store_td"><input type="text" name="pay_zipcode"><button type="button" style="margin-left:10px;" onclick="goPopup()">우편번호찾기</button><br>
                    <input type="text" name="pay_addr" class="inputs" style="margin-top:10px;"></td>
                </tr>
                <tr class="store_tr">
                    <th class="store_th">연락처</th>
                    <td class="store_td"><input type="text" name="pay_phone" placeholder="-없이 입력하세요"></td>
                </tr>
                <tr class="store_tr">
                	<th class="store_th">배송 요청사항</th>
                	<td class="store_td"><input type="text" name="pay_ship_req" class="inputs">
                </td></tr> 
                
            </table>
        </div>

        <div class="pay_product_info">
            <h3>상품 정보</h3>
            <table class="store_table">
                <tr class="store_tr">
                    <th class="store_th">상품 이름</th>
                    <td class="store_td">${param.sto_title}</td>
                </tr>
                <tr class="store_tr">
                    <th class="store_th">상품 옵션</th>
                    <td class="store_td">${opt_title}
                    <input type="hidden" name="sto_opt_code" value="${param.sto_opt_code}"></td>
                </tr>
                <tr class="store_tr">
                    <th class="store_th">상품 수량</th>
                    <td class="store_td">${param.opt_cnt} 개
                    <input type="hidden" name="pay_cnt" value="${param.opt_cnt }"></td>
                </tr>

            </table>
        </div>
        <div class="pay_info_Div">
            <h3>결제 정보</h3>
            <table class="store_table">
                <tr class="store_tr">
                    <th class="store_th">상품가격</th>
                    <td class="store_td"> <fmt:formatNumber type="number" maxFractionDigits="3" value="${param.sto_price}"/>원
                    <input type="hidden" name="pay_price" value="${param.sto_price}"/></td>
                </tr>
                <tr class="store_tr">
                    <th class="store_th">보유 예치금</th>
                    <td class="store_td"><fmt:formatNumber type="number" maxFractionDigits="3" value="${mem_balance}"/>원</td>
                </tr>
                <tr class="store_tr">
                    <th class="store_th">결제후 잔액</th>
                    <td class="store_td"><fmt:formatNumber type="number" maxFractionDigits="3" value="${mem_balance - param.sto_price}"/>원</td>
                </tr>
            </table>
        </div>
        <div class="pay_btn_Div">
            <button type="button" id="pay_btn">결제하기</button>
        </div>
	     </form>   
	    </div>
	  
	</div>
	<!-- end main -->
</body>
</html>