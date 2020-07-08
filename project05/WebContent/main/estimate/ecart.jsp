<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.* "
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="utf-8"/>
<style>
	#e_cart {width:50%;height:100%; float:left;}
	#ecart table{border-collapse:collapse;}
	#ecart table td{padding:3px 3px;} 
	#ecart tr td:first-child{background-color:black;color:white;}

</style>
<script>
	
	
	
	
	
	

</script>
<body>
<c:choose>
	<c:when test="${param.proc == 'insAsq'}">
		<div id="ecart"style="height:400px; overflow:auto; margin:0 auto;">
			<table>
				<col width="15%">
				<col width="60%">
				<col width="10%">
				<col width="15%">
				<tr>
					<td class="mcCho">CPU</td>
					<td></td> 
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="prod" items="${ecart}">
					<c:if test="${prod.parts_mc == 'CPU'}" >
						<tr>
							<td></td>
							<td>${prod.parts_name}</td> 
							<td>${prod.parts_cnt}개</td>
							<td class="ordR"><fmt:formatNumber pattern="###,###" value="${prod.parts_price * prod.parts_cnt}"/>원</td>
						</tr>
					</c:if>
				</c:forEach>
				<tr>
					<td class="mcCho">메인보드</td>
					<td></td> 
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="prod" items="${ecart}">
					<c:if test="${prod.parts_mc == '메인보드'}" >
						<tr>
							<td></td>
							<td>${prod.parts_name}</td> 
							<td>${prod.parts_cnt}개</td>
							<td class="ordR"><fmt:formatNumber pattern="###,###" value="${prod.parts_price * prod.parts_cnt}"/>원</td>
						</tr>
					</c:if>
				</c:forEach>
				<tr>
					<td class="mcCho">RAM</td>
					<td></td> 
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="prod" items="${ecart}">
					<c:if test="${prod.parts_mc == 'RAM'}" >
						<tr>
							<td></td>
							<td>${prod.parts_name}</td> 
							<td>${prod.parts_cnt}개</td>
							<td class="ordR"><fmt:formatNumber pattern="###,###" value="${prod.parts_price * prod.parts_cnt}"/>원</td>
						</tr>
					</c:if>
				</c:forEach>
				<tr>
					<td class="mcCho">그래픽카드</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="prod" items="${ecart}">
					<c:if test="${prod.parts_mc == '그래픽카드'}" >
						<tr>
							<td></td>
							<td>${prod.parts_name}</td> 
							<td>${prod.parts_cnt}개</td>
							<td class="ordR"><fmt:formatNumber pattern="###,###" value="${prod.parts_price * prod.parts_cnt}"/>원</td>
						</tr>
					</c:if>
				</c:forEach>
				<tr>
					<td class="mcCho">SSD</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="prod" items="${ecart}">
					<c:if test="${prod.parts_mc == 'SSD'}" >
						<tr>
							<td></td>
							<td>${prod.parts_name}</td> 
							<td>${prod.parts_cnt}개</td>
							<td class="ordR"><fmt:formatNumber pattern="###,###" value="${prod.parts_price * prod.parts_cnt}"/>원</td>
						</tr>
					</c:if>
				</c:forEach>
				<tr>
					<td class="mcCho">HDD</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="prod" items="${ecart}">
					<c:if test="${prod.parts_mc == 'HDD'}" >
						<tr>
							<td></td>
							<td>${prod.parts_name}</td> 
							<td>${prod.parts_cnt}개</td>
							<td class="ordR"><fmt:formatNumber pattern="###,###" value="${prod.parts_price * prod.parts_cnt}"/>원</td>
						</tr>
					</c:if>
				</c:forEach>
				<tr>
					<td class="mcCho">케이스</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="prod" items="${ecart}">
					<c:if test="${prod.parts_mc == '케이스'}" >
						<tr>
							<td></td>
							<td>${prod.parts_name}</td> 
							<td>${prod.parts_cnt}개</td>
							<td class="ordR"><fmt:formatNumber pattern="###,###" value="${prod.parts_price * prod.parts_cnt}"/>원</td>
						</tr>
					</c:if>
				</c:forEach>
				<tr>
					<td class="mcCho">파워</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="prod" items="${ecart}">
					<c:if test="${prod.parts_mc == '파워'}" >
						<tr>
							<td></td>
							<td>${prod.parts_name}</td> 
							<td>${prod.parts_cnt}개</td>
							<td class="ordR"><fmt:formatNumber pattern="###,###" value="${prod.parts_price * prod.parts_cnt}"/>원</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
	</c:when>
	
	<c:when test="${param.proc == 'goAsq' }">
		<div id="ecart" style="height:400px; overflow:auto; margin:0 auto;">
			<table>
				<col width="15%">
				<col width="55%">
				<col width="10%">
				<col width="20%">
				<tr>
					<td class="mcCho">CPU</td>
					<td></td> 
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="prod" items="${assemble}">
					<c:if test="${prod.parts_mc == 'CPU'}" >
						<tr>
							<td></td>
							<td>${prod.parts_name}</td> 
							<td>${prod.parts_cnt}개</td>
							<td class="ordR"><fmt:formatNumber pattern="###,###" value="${prod.parts_price * prod.parts_cnt}"/>원</td>
						</tr>
					</c:if>
				</c:forEach>
				<tr>
					<td class="mcCho">메인보드</td>
					<td></td> 
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="prod" items="${assemble}">
					<c:if test="${prod.parts_mc == '메인보드'}" >
						<tr>
							<td></td>
							<td>${prod.parts_name}</td> 
							<td>${prod.parts_cnt}개</td>
							<td class="ordR"><fmt:formatNumber pattern="###,###" value="${prod.parts_price * prod.parts_cnt}"/>원</td>
						</tr>
					</c:if>
				</c:forEach>
				<tr>
					<td class="mcCho">RAM</td>
					<td></td> 
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="prod" items="${assemble}">
					<c:if test="${prod.parts_mc == 'RAM'}" >
						<tr>
							<td></td>
							<td>${prod.parts_name}</td> 
							<td>${prod.parts_cnt}개</td>
							<td class="ordR"><fmt:formatNumber pattern="###,###" value="${prod.parts_price * prod.parts_cnt}"/>원</td>
						</tr>
					</c:if>
				</c:forEach>
				<tr>
					<td class="mcCho">그래픽카드</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="prod" items="${assemble}">
					<c:if test="${prod.parts_mc == '그래픽카드'}" >
						<tr>
							<td></td>
							<td>${prod.parts_name}</td> 
							<td>${prod.parts_cnt}개</td>
							<td class="ordR"><fmt:formatNumber pattern="###,###" value="${prod.parts_price * prod.parts_cnt}"/>원</td>
						</tr>
					</c:if>
				</c:forEach>
				<tr>
					<td class="mcCho">SSD</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="prod" items="${assemble}">
					<c:if test="${prod.parts_mc == 'SSD'}" >
						<tr>
							<td></td>
							<td>${prod.parts_name}</td> 
							<td>${prod.parts_cnt}개</td>
							<td class="ordR"><fmt:formatNumber pattern="###,###" value="${prod.parts_price * prod.parts_cnt}"/>원</td>
						</tr>
					</c:if>
				</c:forEach>
				<tr>
					<td class="mcCho">HDD</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="prod" items="${assemble}">
					<c:if test="${prod.parts_mc == 'HDD'}" >
						<tr>
							<td></td>
							<td>${prod.parts_name}</td> 
							<td>${prod.parts_cnt}개</td>
							<td class="ordR"><fmt:formatNumber pattern="###,###" value="${prod.parts_price * prod.parts_cnt}"/>원</td>
						</tr>
					</c:if>
				</c:forEach>
				<tr>
					<td class="mcCho">케이스</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="prod" items="${assemble}">
					<c:if test="${prod.parts_mc == '케이스'}" >
						<tr>
							<td></td>
							<td>${prod.parts_name}</td> 
							<td>${prod.parts_cnt}개</td>
							<td class="ordR"><fmt:formatNumber pattern="###,###" value="${prod.parts_price * prod.parts_cnt}"/>원</td>
						</tr>
					</c:if>
				</c:forEach>
				<tr>
					<td class="mcCho">파워</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="prod" items="${assemble}">
					<c:if test="${prod.parts_mc == '파워'}" >
						<tr>
							<td></td>
							<td>${prod.parts_name}</td> 
							<td>${prod.parts_cnt}개</td>
							<td class="ordR"><fmt:formatNumber pattern="###,###" value="${prod.parts_price * prod.parts_cnt}"/>원</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
	</c:when>
	
	
	
	<c:when test="${param.proc != 'insAsq' and param.proc != 'goAsq' }">
		<div id="ecart"style="height:400px; overflow:auto; margin:0 auto;">
			<table>
				<col width="18%">
				<col width="auto">
				<col width="7%">
				<col width="18%">
				<col width="4%">
				<tr>
					<td class="mcCho">CPU</td>
					<td></td> 
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="prod" items="${ecart}">
					<c:if test="${prod.parts_mc == 'CPU'}" >
						<tr>
							<td></td>
							<td>${prod.parts_name}</td> 
							<td><input type="number" name="cnt(${prod.parts_no})" value="${prod.parts_cnt}" readonly /></td>
							<td class="ordR"><fmt:formatNumber pattern="###,###" value="${prod.parts_price * prod.parts_cnt}"/>원</td>
							<td onclick="delCart(${prod.parts_no})">X</td>
						</tr>
					</c:if>
				</c:forEach>
				<tr>
					<td class="mcCho">메인보드</td>
					<td></td> 
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="prod" items="${ecart}">
					<c:if test="${prod.parts_mc == '메인보드'}" >
						<tr>
							<td></td>
							<td>${prod.parts_name}</td> 
							<td><input type="number" name="cnt(${prod.parts_no})" value="${prod.parts_cnt}" readonly /></td>
							<td class="ordR"><fmt:formatNumber pattern="###,###" value="${prod.parts_price * prod.parts_cnt}"/>원</td>
							<td onclick="delCart(${prod.parts_no})">X</td>
						</tr>
					</c:if>
				</c:forEach>
				<tr>
					<td class="mcCho">RAM</td>
					<td></td> 
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="prod" items="${ecart}">
					<c:if test="${prod.parts_mc == 'RAM'}" >
						<tr>
							<td></td>
							<td>${prod.parts_name}</td> 
							<td><input type="number" name="cnt(${prod.parts_no})" value="${prod.parts_cnt}" readonly /></td>
							<td class="ordR"><fmt:formatNumber pattern="###,###" value="${prod.parts_price * prod.parts_cnt}"/>원</td>
							<td onclick="delCart(${prod.parts_no})">X</td>
						</tr>
					</c:if>
				</c:forEach>
				<tr>
					<td class="mcCho">그래픽카드</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="prod" items="${ecart}">
					<c:if test="${prod.parts_mc == '그래픽카드'}" >
						<tr>
							<td></td>
							<td>${prod.parts_name}</td> 
							<td><input type="number" name="cnt(${prod.parts_no})" value="${prod.parts_cnt}" readonly /></td>
							<td class="ordR"><fmt:formatNumber pattern="###,###" value="${prod.parts_price * prod.parts_cnt}"/>원</td>
							<td onclick="delCart(${prod.parts_no})">X</td>
						</tr>
					</c:if>
				</c:forEach>
				<tr>
					<td class="mcCho">SSD</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="prod" items="${ecart}">
					<c:if test="${prod.parts_mc == 'SSD'}" >
						<tr>
							<td></td>
							<td>${prod.parts_name}</td> 
							<td><input type="number" name="cnt(${prod.parts_no})" value="${prod.parts_cnt}" readonly /></td>
							<td class="ordR"><fmt:formatNumber pattern="###,###" value="${prod.parts_price * prod.parts_cnt}"/>원</td>
							<td onclick="delCart(${prod.parts_no})">X</td>
						</tr>
					</c:if>
				</c:forEach>
				<tr>
					<td class="mcCho">HDD</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="prod" items="${ecart}">
					<c:if test="${prod.parts_mc == 'HDD'}" >
						<tr>
							<td></td>
							<td>${prod.parts_name}</td> 
							<td><input type="number" name="cnt(${prod.parts_no})" value="${prod.parts_cnt}" readonly /></td>
							<td class="ordR"><fmt:formatNumber pattern="###,###" value="${prod.parts_price * prod.parts_cnt}"/>원</td>
							<td onclick="delCart(${prod.parts_no})">X</td>
						</tr>
					</c:if>
				</c:forEach>
				<tr>
					<td class="mcCho">케이스</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="prod" items="${ecart}">
					<c:if test="${prod.parts_mc == '케이스'}" >
						<tr>
							<td></td>
							<td>${prod.parts_name}</td> 
							<td><input type="number" name="cnt(${prod.parts_no})" value="${prod.parts_cnt}" readonly /></td>
							<td class="ordR"><fmt:formatNumber pattern="###,###" value="${prod.parts_price * prod.parts_cnt}"/>원</td>
							<td onclick="delCart(${prod.parts_no})">X</td>
						</tr>
					</c:if>
				</c:forEach>
				<tr>
					<td class="mcCho">파워</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="prod" items="${ecart}">
					<c:if test="${prod.parts_mc == '파워'}" >
						<tr>
							<td></td>
							<td>${prod.parts_name}</td> 
							<td><input type="number" name="cnt(${prod.parts_no})" value="${prod.parts_cnt}" readonly /></td>
							<td class="ordR"><fmt:formatNumber pattern="###,###" value="${prod.parts_price * prod.parts_cnt}"/>원</td>
							<td onclick="delCart(${prod.parts_no})">X</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
	</c:when>
</c:choose>



</body>
</html>