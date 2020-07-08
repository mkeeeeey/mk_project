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
<link rel="stylesheet" href="css/kb_w_user_StoreDetail.css">
<script>
		$(document).ready(function(){
			
			var price = 0;
			var detai = "";
			var opt_code;
			var user = '${user.mem_name}';
			$("#option_select").change(function(){
				
				var Select=document.querySelector("#option_select");
				price = Select.options[Select.selectedIndex].dataset.price;
				console.dir(price);
				
				opt_code = $("#option_select option:selected").val();
				$("[name=sto_opt_code").val(opt_code);
				detail = $("#option_select").val();
				$("[name=sto_option_detail]").val(detail);
				$("#cnt_input").val("1");
				$("#price_Span").html(numberWithCommas(price));
				$("[name=sto_price]").val(price);
			});
			
			$("#cnt_input").change(function(){
				var Select=document.querySelector("#option_select");
				price = Select.options[Select.selectedIndex].dataset.price;
				var tot = 0;
				var cnt = $("#cnt_input").val();
				if(cnt < 1){
					alert("수량은 1개 이상 이여야 합니다.");
					$("#price_Span").html(numberWithCommas(price));
					$("[name=sto_price]").val(price);
					$("#cnt_input").val("1");
				} else {
				tot = price * cnt;
				
				$("#price_Span").html(numberWithCommas(tot));
				$("[name=sto_price]").val(tot);
				}
			
			});
			
			$("#cnt_input").keypress(function(event){
				var Select=document.querySelector("#option_select");
				price = Select.options[Select.selectedIndex].dataset.price;
				var tot = 0;
				var cnt = $("#cnt_input").val();
				
				if(event.keyCode==13){
					if(cnt < 1){
						alert("수량은 1개 이상 이여야 합니다.");
						$(this).val("1");
						
					} else {
						tot = price * cnt;
						
						$("#price_Span").html(numberWithCommas(tot));
						$("[name=sto_price]").val(tot);
					}
				}
			})
			
			
			 var article = ("#sto_QnA_Div .qnaShow");
	            $("#sto_QnA_Div .item td").click(function(){
	                var myArticle = $(this).parent().next("tr");
	                if($(myArticle).hasClass('hide')){
	                    $(article).removeClass('qnaShow').addClass('hide');
	                    $(myArticle).removeClass('hide').addClass('qnaShow');
	                } else {
	                    $(myArticle).addClass('hide').removeClass('qnaShow');
	                }
	            });
			
	            $("#qnaSubmit").click(function(){
	            	var qnaDetail = $("#message-text").val();
	            	if(qnaDetail != null && qnaDetail !=''){
	                $("#qnaForm").submit();
	                $(".btn btn-warning").modal("hide");
	                $("#sto_QnA_Div").focus();
	            	} else {
	            		alert("문의 내용을 입력하세요");
	            		$("#message-text").focus();
	            	}
	            });
	            
	            $("#qnaModalBtn").click(function(){
	            	if(user != ''){
	            		$(".btn btn-warning").modal();
	            	} else {
	            		alert("로그인이 필요합니다");
	            		$(location).attr("href","login.do");
	            	}
	            })
	            
	            $("#Pay_Btn").click(function(){
	            	if(user != ''){
	            		if(opt_code != null && opt_code != ''){
	            			$("select").prop('selectedIndex',0);
	            			$("#pay_form").submit();
	            		} else {
	            			alert("옵션 선택 및 수량 설정하세요");
	            		}
	            	} else {
	            		alert("로그인이 필요합니다");
	            		$(location).attr("href","login.do");
	            	}
	            })
			})
		
		
		
		function numberWithCommas(x) {
	        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	    }
		
		function goPage(no){
			$("#curPage").val(no);
			$("#cntForm").submit();
		}
</script>
</head>
<body>
	<div class="main" id="main_Div">
	    <div class="container tim-container" style="max-width:1200px; padding-top:100px">
	  		<div class="store-title" style="text-align: center; margin-top:0;" >
	    		<div class="label label-warning">${store.cate_title}</div>
	    		<h3 style="font-weight:800;">${store.sto_title}</h3>
        	</div>
        <div id="sto_menu_Div">
            <ul class="sto_menu_ul">
                <li class="sto_menu_li"><a href="#main_Div" class="sto_menu_a">상단</a></li>
                <li class="sto_menu_li"><a href="#sto_Story_Div" class="sto_menu_a">스토리</a></li>
                <li class="sto_menu_li"><a href="#sto_QnA_Div" class="sto_menu_a">문의</a></li>
            </ul>
        </div>
        <div id="sto_Main_Info_Div">
            
	            <div id="sto_Image_Div">
	                <img src="${store.sto_image}" class="img-responsive" alt="Responsive image" 
	                style="width:80%;
	                height:100%; margin-left:auto; margin-right:auto;">
	            </div>
				<form method="post" id="pay_form" action="store.do?method=pay">
	            <div id="sto_pay_Div">
	                <div id="maker_name_Div"> 메이커 명 : ${store.maker_name}</div>
	                <div id="option_Div">
	                    <span id="option_title">옵션 : </span>
	                    <select class="form-data" id="option_select" name="sto_option">
	                    	<option selected></option>
	                    	<c:forEach var="opt" items="${option}">
	                    		  <option data-price="${opt.sto_opt_price}" value="${opt.sto_opt_code}"> ${opt.sto_opt_detail} (가격 : ${opt.sto_opt_price}) </option>
	                    	</c:forEach>
	                    </select>
	                    <input type="hidden" name="sto_opt_code"> 
	                    <input type="hidden" name="sto_title" value="${store.sto_title}">
	                    <input type="hidden" name="mem_code" value="${user.mem_code}">   
	                </div>
	                <div id="option_cnt_div">
	                    <span id="option_cnt_title">수량 : </span>
	                    <input hidden="hidden" />
	                    <input type="number" class="form-data" id="cnt_input" name="opt_cnt" value="1" style="text-align:center">
	                </div>
	                <div id="option_price_Div">
	                
	                    <span id="price_Span"></span>원
	                    <input type="hidden" name="sto_price">
	                    <input type="hidden" name="sto_code" value="${param.sto_code}">
	                </div>
	                <div id="pay_Btn_Div">
	                    <button type="button" id="Pay_Btn">주문하기</button>
	                </div>
	            </div>
			</form>
           
        </div>
        <div id="sto_Story_Div">
            <div id="sto_Story_Title">상세 스토리</div>
            ${store.sto_detai}
        </div>
		<form id="cntForm" method="get">
			<input type="hidden" id="curPage" name="curPage" value="${sch.curPage}">
			<input type="hidden" name="method" value="detail">
			<input type="hidden" name="sto_code" value="${stocode}">
		
        <div id="sto_QnA_Div">
            <div id="sto_QnA_Title">스토어 문의 <button type="button" class="btn btn-warning" id="qnaModalBtn" data-toggle="modal" data-target="#exampleModal" style="float:right;" >문의하기</button></div>
            <table class="table table-hover" style="margin-top:2%;">
                <thead>
                    <tr style="text-align:center">
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성날짜</th>
                        <th>답변여부</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="qna" items="${qna}">
                    <tr  class="item" style="text-align:center">
                        <td>${qna.qna_code}</td>
                        <td><span class="title_td">
                        <c:if test="${qna.qna_open=='Y'}">
                        	[비밀글입니다]
                        </c:if>
                        <c:if test="${qna.qna_open=='n'}">
                        	${qna.qna_detail}
                        </c:if>
                        </span></td>
                        <td>${qna.mem_name} </td>
                        <td>${qna.qna_reg_date} </td>
                        <td>
                        	<c:if test="${qna.qna_ans==null}">
                        		미답변
                        	</c:if>
                        	<c:if test="${qna.qna_ans!=null}">
                        		답변완료
                        	</c:if>
                        </td>
                    </tr>
                    <tr class="hide">
                    	<c:if test="${(qna.qna_open=='Y'||qna.qna_open=='y') && qna.mem_name==user.mem_name}">
                    		<td colspan="5"><pre>${qna.qna_detail}</pre>
                    		<c:if test="${qna.qna_ans!=null }">
                    		 <pre class="qna_answer_pre">--------------------<span class="qna_answer">메이커 답변</span>---------------------------------------------------------------${qna.qna_ans_reg_date }--------------------<br>${qna.qna_ans}</pre></td>
                    		</c:if>
                    		<c:if test="${qna.qna_ans==null }">
                    		</td>
                    		</c:if>
                    	</c:if>
                    	<c:if test="${(qna.qna_open=='Y' || qna.qna_open=='y') && qna.mem_name!=user.mem_name}">
                    		<td colspan="5"><pre>[비밀글 입니다]</pre></td>
                    	</c:if>
                    	<c:if test="${qna.qna_open=='N' || qna.qna_open=='n'}">
                    		<td colspan="5"><pre>${qna.qna_detail}</pre>
                    		<c:if test="${qna.qna_ans!=null }">
                    		 <pre class="qna_answer_pre">--------------------<span class="qna_answer">메이커 답변</span>---------------------------------------------------------------${qna.qna_ans_reg_date }--------------------<br>${qna.qna_ans}</pre></td>
                    		</c:if>
                    		<c:if test="${qna.qna_ans==null }">
                    		</td>
                    		</c:if>
                    		
                    	</c:if>
                    </tr>
                    </c:forEach>
                  
                </tbody>

            </table>

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
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title" id="exampleModalLabel">스토어 문의하기</h4>
                    
                    </div>
                    <div class="modal-body">
                      <form method="post" id="qnaForm" action="store.do?method=insert">
                      	<div class="form-group">
                      		<label for="message-text" class="control-label">비밀글 유무</label>
                      		<input type="radio" value="Y" name="qna_open"> 비밀글로 하기 <input type="radio" value="n" name="qna_open" checked="checked"> 비밀글로 안하기
                      	</div>
                        <div class="form-group">
                          <label for="message-text" class="control-label">문의내용:</label>
                          <textarea class="form-control" id="message-text" name="qna_detail"></textarea>
                          <input type="hidden" name="mem_code" value="${user.mem_code}">
                          <input type="hidden" name="sto_code" value="${stocode}">
                        </div>
                      </form>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                      <button type="submit" class="btn btn-primary" id="qnaSubmit">문의하기</button>
                    </div>
                  </div>
                </div>
              </div>
        </div>
	        
	    </div>
	</div>
	<!-- end main -->
</body>
</html>