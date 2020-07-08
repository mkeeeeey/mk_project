<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, z01_vo.*, hsw.* "
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PC냥이:컴퓨터 맞춰보자냥</title>
<style>
	body{margin:0 auto; padding:0; width:100%;}
    a{text-decoration:none;}
    ul li{list-style:none;}
	table{width:100%;}
	.ordR{text-align:right;}
	.ordL{text-align:left;}
	
	#e_root{margin:auto; width:1280px; padding:0px 20px;}
	#e_top{width:100%; margin-bottom:10px; }
	#e_mid{width:100%; height:500px;}
		#e_nav{width:50%; height:100%; float:left;}
			#e_nav_top td {margin:0px;}
			#e_nav_list {width:95%; height:360px; border-right:1px solid black; overflow:auto;}
			#e_nav_list td{border-bottom:1px solid black;}
		
	#e_bottom{width:100%; clear:both; margin-top:50px;}
	/*
	.all-wrap{margin-top:100px; margin-bottom:200px;}
	.wrap{width:1080px; margin:0 auto;}
	 */
	#e_bottom table{border-collapse:collapse; cursor:pointer; border-bottom:3px solid black;}
	#e_bottom table tr{border-top:1px solid gray;}
	#e_bottom table tr:first-child{visibility:visible; border-top:3px solid black; border-bottom:3px solid black;}
	#e_bottom table tr td,th {padding:10px 10px;} 
	#e_bottom .input-box{width:250px; height:45px; outline:none; padding:0; margin:0; cursor:pointer;}
	#e_bottom .search-btn{width:80px; height:40px; background-color:black; color:white; border:1px solid black; font-size:20px;
	          outline:none; padding:0; margin:0; cursor:pointer;}
	#e_bottom .reg-btn{width:80px; height:40px; background-color:black; color:white; border:1px solid black; font-size:20px;
	          outline:none; padding:0; margin:0; cursor:pointer;}
	          
	[type=button] {color:#FFFFFF;background:#63145F;text-align:center;vertical-align:middle;
			  outline:none; border:none; padding:10px;}          
	          
</style>
<script src="${path}/a00_com/jquery-3.4.1.js" type="text/javascript"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script type="text/javascript">
	var proc = "${param.proc}";
	var parts_mc = "${parts_mc}";
	var parts_com = "${parts_com}";
	var cartCnt = "${fn:length(ecart)}";
	$(document).ready(function(){
<%--

--%>
		$("h2").text("견적컴퓨터");
		$("[type=number]").width("100%");
		$("select").width("30%");
		$("img").width("60px");
		$("#e_nav_list [type=button]").val("카트담기");
		$("#title").append(parts_mc);
		
		if(parts_mc == "") parts_mc = "CPU";
		if(proc == ""||proc == "sch"){
			// 정상진행
		}else{
			// proc를 sch로 해서 다시 컨트롤로 보내기.
			$("[name=proc]").val("sch");
			$("[name=parts_mc]").val(parts_mc);
			$("form").submit();
		}
		
		// 카테고리 검색 버튼 클릭시
		$("#schBtn").click(function(){
			$("[name=proc]").val("sch");
			$("[name=parts_mc]").val(parts_mc);
			$("form").submit();
		});
		// 중분류 버튼 클릭시
		 $(".mcCho").click(function(){
			 var mc = $(this).text();
			 $("[name=proc]").val("sch");
			 $("[name=parts_mc]").val(mc);
			 $("form").submit();
			 
		 });
		
		
		
		
		
	});
	// regCart 버튼 클릭시 카트에 부품 등록
	function regCart(sno){
		$("[name=proc]").val("ins");
		$("[name=parts_mc]").val(parts_mc);
		$("[name=parts_no]").val(sno);
		$("form").submit();
	}
	// #delcart(idx) 버튼 클릭시 카트에서 부품 제거
	function delCart(sno){
		$("[name=proc]").val("del");
		$("[name=parts_mc]").val(parts_mc);
		$("[name=parts_no]").val(sno);
		$("form").submit();
	}
	
	// delAll 버튼 클릭시 카트에서 모든 부품 제거
	function delAll(){
		if(confirm("모든 부품을 삭제하시겠습니가?")){
			$("[name=proc]").val("delAll");
			$("[name=parts_mc]").val(parts_mc);
			$("form").submit();
		}
	}
	// 견적문의 버튼클릭시
	function insAsq(){
		if(confirm("견적문의로 이동하시겠습니까?")){
			$("[name=proc]").val("insAsq");
			$("[name=parts_mc]").val(parts_mc);
			$("form").submit();
		}
	}
	// 구매 버튼 클릭시
	function buy(){
		if(confirm("구매하시겠습니까?")){
			$("[name=proc]").val("buy");
			var parts_prices = $(".parts_price").text();;
			
			$("[name=com_price]").val();
			$("[name=parts_mc]").val(parts_mc);
			$("form").submit();
		}
	}
	function goAsq(no){
		$("[name=proc]").val("goAsq");
		$("[name=asq_no]").val(no);
		$("form").submit();
	}
	
</script>
</head>

<body>
<jsp:include page="../top.jsp" />
<!-- 중간 내용 시작 -->
<div id="e_root">
	<!-- 중간 내용 title -->
	<div id="e_top">
		<h2></h2>
	</div>
	<div id="e_mid">
		<!-- 견적표 -->
		<form method="post">
		<div id="e_nav" >
			<div id="e_nav_top">
				<h3 id="title">PC주요부품 > </h3>
				<input type="hidden" name="proc" />
				<input type="hidden" name="parts_mc"/>
				<input type="hidden" name="parts_no"/>
				<input type="hidden" name="asq_no"/>
				<input type="hidden" name="req_cnt" value="1"/>
				<table>
					<c:choose>
						<c:when test="${parts_mc=='CPU'}">
							<tr>
								<td>
									<select name="parts_sc1">
										<option value="">제조사</option>
										<option value="인텔">인텔</option>
										<option value="AMD">AMD</option>
									</select>
									<select name="parts_sc2">
										<option value="">설계 전력</option>
										<option value="65W">65W</option>
										<option value="95W">95W</option>
										<option value="105W">105W</option>
										<option value="165W">165W</option>
									</select>
									<select name="parts_sc3">
										<option value="">브랜드 분류</option>
										<option value="인텔(코어i3-9세대)">인텔(코어i3-9세대)</option>
										<option value="인텔(코어i5-9세대)">인텔(코어i5-9세대)</option>
										<option value="인텔(코어i7-9세대)">인텔(코어i7-9세대)</option>
										<option value="인텔(코어i9-9세대)">인텔(코어i9-9세대)</option>
										<option value="인텔(코어X-시리즈)">인텔(코어X-시리즈)</option>
										<option value="AMD(라이젠 3)">AMD(라이젠 3)</option>
										<option value="AMD(라이젠 5)">AMD(라이젠 5)</option>
										<option value="AMD(라이젠 8)">AMD(라이젠 8)</option>
										<option value="AMD(라이젠 9)">AMD(라이젠 9)</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<select name="parts_sc4">
										<option value="">코어형태</option>
										<option value="코어">4코어</option>
										<option value="코어">6코어</option>
										<option value="코어">8코어</option>
										<option value="코어">10코어</option>
										<option value="12">12코어</option>
									</select>
									<select name="parts_sc5">
										<option value="">동작속도</option>
										<option value="2.5~2.99 GHz">2.5~2.99 GHz</option>
										<option value="3.0~3.49 GHz">3.0~3.49 GHz</option>
										<option value="3.5~3.99 GHz">3.5~3.99 GHz</option>
									</select>
									<select name="parts_sc6">
										<option value="">패키지 형식</option>
										<option value="정품">정품</option>
										<option value="벌크">벌크</option>
									</select>
								</td>
							</tr>
						</c:when>
						<c:when test="${parts_mc=='메인보드'}">
							<tr>
								<td>
									<select name="parts_sc1">
										<option value="">제조사</option>
										<option value="ASRock">ASRock</option>
										<option value="ASUS">ASUS</option>
										<option value="BIOSTAR">BIOSTAR</option>
										<option value="GIGABYTE">GIGABYTE</option>
										<option value="MSI">MSI</option>
									</select>
									<select name="parts_sc2">
										<option value="">세부 칩셋</option>
										<option value="(AMD) A320">(AMD) A320</option>
										<option value="(AMD) B450">(AMD) B450</option>
										<option value="(AMD) B450">(AMD) B450</option>
										<option value="(AMD) X570">(AMD) X570</option>
										<option value="(인텔) B360">(인텔) B360</option>
										<option value="(인텔) B365">(인텔) B365</option>
										<option value="(인텔) H310">(인텔) H310</option>
										<option value="(인텔) H81">(인텔) H81</option>
										<option value="(인텔) Z390">(인텔) Z390</option>
									</select>
									<select name="parts_sc3">
										<option value="">메모리 종류</option>
										<option value="DDR4">DDR4</option>
										<option value="DDR3">DDR3</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<select name="parts_sc4">
										<option value="">메모리 슬롯</option>
										<option value="2">2</option>
										<option value="4">4</option>
									</select>
									<select name="parts_sc5">
										<option value="">M.2</option>
										<option value="0개">0개</option>
										<option value="1개">1개</option>
										<option value="2개">2개</option>
										<option value="3개">3개</option>
										<option value="4개">4개</option>
									</select>
									<input type="hidden" name="parts_sc6" value="">
								</td>
							</tr>
						</c:when>
						<c:when test="${parts_mc=='RAM'}">
							<tr>
								<td>
									<select name="parts_sc1">
										<option value="">제조사</option>
										<option value="ADATA">ADATA</option>
										<option value="GeIL">GeIL</option>
										<option value="TeamGroup">TeamGroup</option>
										<option value="마이크론">마이크론</option>
										<option value="삼성전자">삼성전자</option>
									</select>
									<select name="parts_sc2">
										<option value="">동작 클럭</option>
										<option value="1,600MHz">1,600MHz</option>
										<option value="2,400MHz">2,400MHz</option>
										<option value="2,666MHz">2,666MHz</option>
										<option value="3,000MHz">3,000MHz</option>
										<option value="3,200MHz">3,200MHz</option>
										<option value="3,600MHz">3,600MHz</option>
										<option value="4,133MHz">4,133MHz</option>
									</select>
									<select name="parts_sc3">
										<option value="">메모리 용량</option>
										<option value="4GB">4GB</option>
										<option value="8GB">8GB</option>
										<option value="16GB">16GB</option>
										<option value="32GB">32GB</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<select name="parts_sc4">
										<option value="">제품 분류</option>
										<option value="DDR3">DDR3</option>
										<option value="DDR4">DDR4</option>
									</select>
									<input type="hidden" name="parts_sc5" value="">
									<input type="hidden" name="parts_sc6" value="">
								</td>
							</tr>
						</c:when>
						<c:when test="${parts_mc=='그래픽카드'}">
							<tr>
								<td>
									<select name="parts_sc1">
										<option value="">제조사</option>
										<option value="ASRock">ASRock</option>
										<option value="ASUS">ASUS</option>
										<option value="EVGA">EVGA</option>
										<option value="GIGABYTE">GIGABYTE</option>
										<option value="MSI">MSI</option>
										<option value="SAPPHIRE">SAPPHIRE</option>
										<option value="ZOTAC">ZOTAC</option>
										<option value="이엠텍">이엠텍</option>
									</select>
									<select name="parts_sc2">
										<option value="">칩셋 제조사</option>
										<option value="AMD">AMD</option>
										<option value="NVIDIA">NVIDIA</option>
									</select>
									<input type="hidden" name="parts_sc3" value="">
								</td>
							</tr>
							<tr>
								<td>
									<select style="visibility:hidden"><option></option></select>
									<input type="hidden" name="parts_sc4" value="">
									<input type="hidden" name="parts_sc5" value="">
									<input type="hidden" name="parts_sc6" value="">
								</td>
							</tr>
						</c:when>
						<c:when test="${parts_mc=='SSD'}">
							<tr>
								<td>
									<select name="parts_sc1">
										<option value="">제조사</option>
										<option value="Seagate">Seagate</option>
										<option value="WD">WD</option>
										<option value="마이크론">마이크론</option>
										<option value="삼성전자">삼성전자</option>
									</select>
									<select name="parts_sc2">
										<option value="">디스크 용량</option>
										<option value="120GB">120GB</option>
										<option value="250GB">250GB</option>
										<option value="500GB">500GB</option>
										<option value="1TB">1TB</option>
										<option value="2TB">2TB</option>
									</select>
									<select name="parts_sc3">
										<option value="">디스크 타입</option>
										<option value="M.2">M.2</option>
										<option value="2.5'' SSD">2.5'' SSD</option>
										<option value="PCI-E 카드">PCI-E 카드</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<select style="visibility:hidden"><option></option></select>
									<input type="hidden" name="parts_sc4" value="">
									<input type="hidden" name="parts_sc5" value="">
									<input type="hidden" name="parts_sc6" value="">
								</td>
							</tr>
						</c:when>
						<c:when test="${parts_mc=='HDD'}">
							<tr>
								<td>
									<select name="parts_sc1">
										<option value="">제조사</option>
										<option value="Seagate">Seagate</option>
										<option value="Toshiva">Toshiva</option>
										<option value="WD">WD</option>
									</select>
									<select name="parts_sc2">
										<option value="">디스크 용량</option>
										<option value="1TB">1TB</option>
										<option value="2TB">2TB</option>
										<option value="3TB">3TB</option>
										<option value="4TB">4TB</option>
										<option value="8TB">8TB</option>
										<option value="10TB">10TB</option>
										<option value="12TB">12TB</option>
									</select>
									<select name="parts_sc3">
										<option value="">회전수</option>
										<option value="5,400 RPM">5,400 RPM</option>
										<option value="5,900 RPM">5,900 RPM</option>
										<option value="7,200 RPM">7,200 RPM</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<select style="visibility:hidden"><option></option></select>
									<input type="hidden" name="parts_sc4" value="">
									<input type="hidden" name="parts_sc5" value="">
									<input type="hidden" name="parts_sc6" value="">
								</td>
							</tr>
						</c:when>
						<c:when test="${parts_mc=='케이스'}">
							<tr>
								<td>
									<select name="parts_sc1">
										<option value="">제조사</option>
										<option value="ABKO">ABKO</option>
										<option value="COX">COX</option>
										<option value="DAVEN">DAVEN</option>
										<option value="대양케이스">대양케이스</option>
										<option value="아이구주">아이구주</option>
										<option value="잘만">잘만</option>
									</select>
									<select name="parts_sc2">
										<option value="">케이스 크기</option>
										<option value="미들타워">미들타워</option>
										<option value="빅타워">빅타워</option>
									</select>
									<select name="parts_sc3">
										<option value="">SSD 전용 베이</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="7">7</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<select style="visibility:hidden"><option></option></select>
									<input type="hidden" name="parts_sc4" value="">
									<input type="hidden" name="parts_sc5" value="">
									<input type="hidden" name="parts_sc6" value="">
								</td>
							</tr>
						</c:when>
						<c:when test="${parts_mc=='파워'}">
							<tr>
								<td>
									<select name="parts_sc1">
										<option value="">제조사</option>
										<option value="FSP">FSP</option>
										<option value="마이크로닉스">마이크로닉스</option>
										<option value="시소닉">시소닉</option>
										<option value="잘만">잘만</option>
										<option value="커세어">커세어</option>
									</select>
									<select name="parts_sc2">
										<option value="">정격 출력</option>
										<option value="500W 이상">500W 이상</option>
										<option value="600W 이상">600W 이상</option>
										<option value="700W 이상">700W 이상</option>
										<option value="800W 이상">800W 이상</option>
										<option value="900W 이상">900W 이상</option>
										<option value="1000W 이상">1000W 이상</option>
									</select>
									<select name="parts_sc3">
										<option value="">메인 전원커넥터</option>
										<option value="20핀">20핀</option>
										<option value="20핀+4핀">20핀+4핀</option>
										<option value="24핀 전용">24핀 전용</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<select name="parts_sc4">
										<option value="">인증사항</option>
										<option value="80 PLUS 티타늄">80 PLUS 티타늄</option>
										<option value="80 PLUS 플레티넘">80 PLUS 플레티넘</option>
										<option value="80 PLUS 골드">80 PLUS 골드</option>
										<option value="80 PLUS 실버">80 PLUS 실버</option>
										<option value="80 PLUS 브론즈">80 PLUS 브론즈</option>
										<option value="80 PLUS 스탠다드">80 PLUS 스탠다드</option>
										<option value="없음">없음</option>
									</select>
									<input type="hidden" name="parts_sc5" value="">
									<input type="hidden" name="parts_sc6" value="">
								</td>
							</tr>
						</c:when>
					</c:choose>
					<tr>
						<td class="ordR" style="padding-right:30px;" >
							<input type="button" id="schBtn" value="검색" />
						</td>
					</tr>
				</table>
			</div>
			<div id="e_nav_list">
				<table>
					<col width="20%">
					<col width="50%">
					<col width="20%">
					<col width="10%">
					
					<c:forEach var="prod" items="${plist}" varStatus="status">
					<tr>
						<td><img src="${path}/image/parts/${prod.parts_img}" style="width:60px;"/></td>
						<td>${prod.parts_name}</td>
						<td class="ordR"><fmt:formatNumber pattern="###,###" value="${prod.parts_price}"/>원</td>
						<td><input type="button" onclick="regCart(${prod.parts_no})" style="width:100%"/></td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<!-- 카트 -->
		<div id="e_cart">
			<h3>PC주요부품</h3>
			<jsp:include page="ecart.jsp" />
			<hr>
			<div style="text-align:center;">
				<input type="button" value="견적초기화" onclick="delAll()" style="width:30%"/>
				<input type="button" value="견적문의" onclick="insAsq()" style="width:30%"/>
				<input type="button" value="구매하기" onclick="buy()" style="width:30%"/>
			</div>
		</div>
		</form>
	</div>
	<!-- 견적 문의 리스트 -->
	<div id="e_bottom">
		<h3>견적 문의 목록</h3>
			<table align="center">
				<colgroup>
					<col style="width:100px;"/>
					<col style="width:600px;"/>
					<col style="width:200px;"/>
					<col style="width:180px;"/>
				</colgroup>
		<!-- 타이틀 -->
		<!-- 필요한 타이틀만큼 추가해서 사용 -->
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
				</tr>
		<!-- 글목록  -->	
				<c:forEach var="asq" items="${asqlist}" varStatus="status">
						<tr onclick="goAsq(${asq.asq_no})">
							<td style="text-align:center;">${fn:length(asqlist) - status.index}</td>
							<td>${asq.asq_name}</td>
							<td style="text-align:center;">${asq.mem_id}</td>
							<td style="text-align:center;">${asq.asq_reqdate}</td>
						</tr>
				</c:forEach>
			</table>
		<br>
		<br>
		<br>
		<br>
	</div>
	<br>
	<br>
	<br>
</div>
<!-- 중간 내용 끝 -->
<jsp:include page="../bottom.jsp" />
</body>
</html>