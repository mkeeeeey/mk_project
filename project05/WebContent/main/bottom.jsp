<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PC냥이:컴퓨터 맞춰보자냥</title>
<style>
body{margin:0; padding:0; overflow-x:hidden;}
a{text-decoration:none;}
ul{margin:0; padding:0;}
ul li{list-style:none;}

/*풋터 시작*/       		
     .footer-wrap{background-color:#65645E;}  		
	    .bottom{width:1280px; margin:0 auto; text-align:center;}
				.btm_article{padding:10px 0; border-bottom: 1px solid white}
				.btm_article span{color:white; cursor: pointer;}
				.logo{font-family:sans-serif; font-size:35px; color:#FF4000;font-weight:bold; margin:0; padding:5px 0;}
				.bottom_intro{color:white;}
/*풋터 끝*/
</style>
<!-- 서버 안에 jquery lib를 다운 받아서 설정 -->	
<script src="${path}/a00_com/jquery-3.4.1.js" type="text/javascript"></script>
<script type="text/javascript">
</script>
</head>
<body>
<!-- 풋터 시작 -->
  	    <div class="footer-wrap">
			<div class="bottom">
				<div class="btm_article">
					<span>서비스이용약관</span>
					<span>개인정보취급방침</span>
				</div>
				<ul>
					<li class="logo">PC냥이</li>
					<li class="bottom_intro" style="font-weight:bold;">㈜PC냥이</li>
					<li class="bottom_intro">대한민국 서울특별시 종로구 미려빌딩6층</li>
					<li class="bottom_intro">대표자: 김이젠ㅣ사업자등록증번호:717-88-00777</li>
					<li class="bottom_intro">통신판매 신고번호: 2017-서울성동-0584호</li>
					<li class="bottom_intro">호스팅서비스: (주)PC냥이</li>
					<li class="bottom_intro">02-6214-0529 (문의시간 : 10:00 ~ 17:00 / 점심시간 : 13:00 ~ 14:00)</li>		
				</ul>
			</div>
		</div>

</body>
</html>