<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="${path }/template/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" href="${path }/template/assets/img/favicon.png">	
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>FunFun 펀펀</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
	
    <link href="${path }/template/bootstrap3/css/bootstrap.css" rel="stylesheet" />
    <link href="${path }/template/bootstrap3/css/font-awesome.css" rel="stylesheet" />
    
	<link href="${path }/template/assets/css/gsdk.css" rel="stylesheet" />   
    <link href="${path }/template/assets/css/demo.css" rel="stylesheet" />
	<link href="${path }/css/toastr.css" rel="stylesheet" />
    <!--     Font Awesome     -->
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Grand+Hotel' rel='stylesheet' type='text/css'>
    <!-- 아이콘 추가 -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
  	<style>
  	.fadeIn{
  		animation:fadein 2s;
  	}
  	@keyframes fadein {
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
	}
  	</style>
</head>

<body>
 <div id="navbar-full">
    <div id="navbar">
    <!--    
        navbar-default can be changed with navbar-ct-blue navbar-ct-azzure navbar-ct-red navbar-ct-green navbar-ct-orange  
        -->
        <nav class="navbar navbar-ct-orange navbar-transparent navbar-fixed-top" role="navigation">
          
          <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="${path }/main.do">FunFun</a>
            </div>
        
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav">
                <li class="active"><a href="${path }/MakerStudio.do?method=myProject">프로젝트 오픈 신청</a></li>
                <li class="dropdown">
                      <a href="#gsdk" class="dropdown-toggle" data-toggle="dropdown">메뉴 <b class="caret"></b></a>
                      <ul class="dropdown-menu">
                        <li><a href="${path }/funding.do?method=list">펀딩하기</a></li>
                        <li><a href="${path }/store.do?method=list">스토어 구경하기</a></li>
                        <li class="divider"></li>
                        <li><a href="${path }/notice.do?method=list">공지사항</a></li>
                        <li><a href="${path }/faq.do?method=list">FAQ</a></li>
                      </ul>
                </li>
                
              </ul>
              <form method="post" action="${path }/funding.do">
                <ul class="nav navbar-nav">
                  <li class="active">
                    <div class="form-group">
                      <input type="hidden" name="method" value="list" />
                      <input type="text" name="projectsch" placeholder="프로젝트를 검색해보세요!" class="form-control" style="background-color: transparent; color:white;
                      margin:15px 3px; border:none" />
                    </div>
                  </li>
                  <li><button type="submit" class="fa fa-search" style="border:none; background-color: transparent; color:white;
                    margin: 26px 3px;"></button></li>
                </ul>
              </form>
              
              <c:if test="${not empty user}">
              <div class="navbar-right">
	              <div class="nav navbar-nav dropdown" id="noti-wrap" style="cursor:pointer; position:relative; margin:0; width:24px; height: 24px; box-sizing: border-box;
	              margin:24px 20px;">
	                <i class="medium material-icons dropdown-toggle" data-toggle="dropdown" style="position:absolute; color:white;">notifications</i>
	                <div id="noti-number" style="position:absolute; top:-2px; right:-2px; color:white; background-color: red;
	                font-size: 12px; width:12px; height: 12px; border-radius: 6px; line-height: 12px; text-align: center;">{{totalCnt}}</div>
	                <ul class="dropdown-menu">
                        <li v-for="item in notiList"><a style="width:300px; height:50px; overflow:hidden; text-overflow: ellipsis;
                        white-space:normal; display:-webkit-box; -webkit-line-clamp:2; -webkit-box-orient:vertical;" v-bind:href="item.link">{{item.title}}</a></li>
                    </ul>
	              </div>
	              <div class="nav navbar-nav dropdown" style="cursor:pointer;">
	                     <div class="logo-container dropdown-toggle" data-toggle="dropdown">
	                        <div class="logo">
	                        	<c:if test="${empty new_profile}">
	                            <img src="${user.mem_profile }">
	                            </c:if>
	                            <c:if test="${not empty new_profile}">
	                            <img src="${new_profile }">
	                            </c:if>
	                        </div>
	                        <div class="brand">
	                            ${user.mem_name }
	                        </div>
	                    </div>
	                    <div class="dropdown-menu" style="display:flex; flex-direction:column; border:none; align-items:center;
	                    background-color:#fafafa;">
					      <a style="height:50px; line-height:50px;" class="dropdown-item" href="${path }/mypage.do">마이페이지</a>	
					      <a style="height:50px; line-height:50px;" class="dropdown-item" href="#" onclick="javascript:logOut()">로그아웃</a>
					    </div>
	              </div>
              </div>
              </c:if>
              
              <c:if test="${empty user}">
              <ul class="nav navbar-nav navbar-right">
                    <li><a href="${path }/signup.do">회원가입</a></li>
                    
                    <li><a href="${path }/login.do" class="btn btn-round btn-default">로그인</a></li>
               </ul>
               </c:if>
              
            </div><!-- /.navbar-collapse -->
          </div><!-- /.container-fluid -->
        </nav>
        <div class="blurred-container fadeIn">
            <div class="img-src" style="background-image: url('${path }/template/assets/img/bg.jpg')"></div>
        </div>
    </div><!--  end navbar -->

</div> <!-- end menu-dropdown -->

<!-- 채팅 버튼 -->
<div class="" style="position:fixed; bottom:25px; right:25px; z-index:10" >
	<a href="javascript:goRtqna()" ><img src="${path}/img/chatting03.png" style="width:110px; height:110px;"/></a>
</div>
</body>

  
  <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	  crossorigin="anonymous"></script>
	<script src="${path }/template/assets/js/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script>
	<script src="${path }/template/bootstrap3/js/bootstrap.js" type="text/javascript"></script>
	<script src="${path }/template/assets/js/gsdk-checkbox.js"></script>
	<script src="${path }/template/assets/js/gsdk-radio.js"></script>
	<script src="${path }/template/assets/js/gsdk-bootstrapswitch.js"></script>
	<script src="${path }/template/assets/js/get-shit-done-header.js"></script>
  <script src="${path }/template/assets/js/custom.js"></script>
  <script>
  	var chatting_window = "";	
  
  	function logOut(){
  		if(confirm('로그아웃하시겠습니까?')){
  			window.location.href="${path}/logout.do";
  			if(chatting_window != "") chatting_window.close();
  		}
  	}
  	function goRtqna(){
  		var mem_code = "${user.mem_code}";
  		if(mem_code == ""){
  			alert("로그인이 필요합니다.");
			$(location).attr("href","${path}/login.do");
  		}else{
  			//alert("채팅페이지로 이동");
  			chatting_window = window.open("${path}/rtqna.do?method=chatting&mem_code="+mem_code, "실시간 상담 채팅", "width=400, height=680, left=100, top=200"); 
  		}
  	}
  </script>
  <script>
  	var loginUser="${user.mem_code}";
  	var path="${path}";
  </script>
  <script src="${path }/js/toastr.js"></script>
  <script src="${path }/js/notification.js"></script>
  <script>
  var user='${user.mem_email}';
  var userName='${user.mem_name}';
  var userCode='${user.mem_code}';
	console.log(userCode);
  </script>
  
  

</html>