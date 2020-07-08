<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<%@ include file="/template/header.jsp" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="${path }/template/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" href="${path }/view/template/assets/img/favicon.png">	
	<link rel="stylesheet" href="${path }/css/slider.css" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>FunFun 펀펀</title>
	<link rel="stylesheet" href="${path }/css/shakeAndBounce.css" />
	<link rel="stylesheet" href="${path }/css/shadowOnOff.css" />
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <script>
		
	</script>
</head>

<body>
<div class="main">
<div class="container tim-container" id="vue-container" v-bind:class="{shadowOn:isShadowOn, shadowOff:isShadowOff}">
<h1 class="text-center">남의 눈치 보지말고<br> FunFun하게 투자하세요! <small class="subtitle">Better Funding Better Business Better Life</small></h1>
<p class="text-center">사람들은 자신이 지지하는 기업에 투자합니다.<br>
한 사람 한 사람의 투자가 모여 기업은 성장합니다.<br>
여기, 기업 하나가 출발선에 있습니다.<br>
그는 자신의 가치를 증명하고<br>
사람들이 그의 가치를 알아봅니다.<br>
서로 지지하고 소통하고 공유하면서<br>
더 많은 사람들이 그를 알아봅니다.<br>
그렇게 기업은 성장합니다.<br>
또 다른 기업들이 용기를 얻고 출발선에 섭니다.<br>
사람들의 지지를 받는 기업은 성장합니다.<br>
세상에 자신만의 가치를 품은<br>
기업이 많아집니다.<br>
세상이 조금 더 나아집니다.</p>
<!-- end extras -->
	<br><br><br><br>
		<div id="slider" style="width:100%">
        <i class="material-icons">chevron_left</i>
        <ul>
            <li><a href="#"><img src="${path }/img/sliderimg1.PNG"></a></li>
            <li><a href="#"><img src="${path }/img/sliderimg2.PNG"></a></li>
            <li><a href="#"><img src="${path }/img/sliderimg3.PNG"></a></li>
            <li><a href="#"><img src="${path }/img/sliderimg4.PNG"></a></li>
        </ul>
        <i class="material-icons">chevron_right</i>
    	</div>
    	
	<br><br><br><br>
	<h2 style="padding-left:10px; ">당신을 위한 프로젝트({{msg}})</h2>
	<div class="row" id="project-list">
    <project-component style="cursor:pointer;" v-for="item in projectList" v-bind:title="item.title" v-bind:image="item.image"
    v-bind:category="item.category" v-bind:percent="item.percent" v-bind:target-funding="item.targetFunding" v-bind:rest-day="item.restDay" 
    v-bind:code="item.code"></project-component>
	</div>
           
           
       
</div>
<div class="space container" style="cursor:default; margin-top:70px;">
	
	<div class="row" style="color:black; font-size:15px; border-top:solid 1px #ccc; border-bottom:solid 1px #ccc; height:50px;">
		<div style="text-align:center; line-height:50px; " class="col-md-2">회원가입 약관</div>
		<div style="text-align:center; line-height:50px" class="col-md-2">서비스이용약관</div>
		<div style="text-align:center; line-height:50px" class="col-md-2">개인정보처리방침</div>
		<div style="text-align:center; line-height:50px" class="col-md-2" onclick="javascript:goAdm()">
			운영정책</div>
		<div style="text-align:center; line-height:50px" class="col-md-2">제휴문의</div>
		<div style="text-align:center; line-height:50px" class="col-md-2">공지사항</div>
	</div>
	<div class="row">
		<div class="col-md-6 text-center">
			<h4 style="font-weight:700;">펀펀 대표 고객센터</h4>
			<h4 style="font-weight:700;">1661-1515</h4>
		</div>
		<div class="text-center col-md-6" style="padding-top:20px">
			<p>펀펀플랫폼 (주)|사업자등록번호 220-88-37</p>
			<p>경기도 성남시 분당구 판교로 242호</p>
			<p>© FunFun Platform Co., Ltd.</p> 
		</div>
	</div>
	
</div>
<!-- end container -->
</div>
<!-- end main -->
<script src="${path }/js/slider.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="${path }/js/projectComponent.js"></script>
<script>

  var vm=new Vue({
    el:'#vue-container',
    data:{
      projectList:[
        
      ],
      isShadowOn:true,
      isShadowOff:false,
      page:1,
      favors:[],
      msg:"전체 카테고리"
    },
    mounted(){
      window.addEventListener('scroll', (e)=>{
    	if(document.documentElement.scrollTop >= 900) { 
              this.isShadowOn=false;
              this.isShadowOff=true;
        }
    	if(document.documentElement.scrollTop < 900) { 
         	  this.isShadowOn=true;
         	  this.isShadowOff=false;
      	}
        if(document.documentElement.scrollTop + document.documentElement.clientHeight + 1 >= document.documentElement.scrollHeight) {
          if(this.page<=3){
        	  if(this.favors.length===0){
        		  console.log("this page:", this.page);
        		  this.loadMore(this.page, "");
            	  this.page=this.page+1;
            	  
        	  } else {
        		  console.log("this page:", this.page);
        		  this.loadMore(this.page, this.favors[0]);
        		  this.page=this.page+1;
        	  }
        	  
          }
        }
      })
    },
    components:{
      'project-component':projectComponent,
    },
    methods:{
      loadMore:function(page, category){
    	  var addf = this.addFunction;
    	  $.ajax({
				type:"get",
				url:"${path}/getMainViewProject.do?page="+page+"&category="+category,
				dataType:"json",
				success:(data)=>{
					data.list.forEach(el=>{
						addf(el);
					})
					
				},
				error:function(err){
					console.log("ajax처리 에러");
					console.log(err);
				}
			});
      },
      addFunction:function (data){
    	  console.log(path);
    	  data.image=window.location.origin+'/funfun/'+data.image;
    	  data.targetFunding=numberWithCommas(data.targetFunding)+"원";
    	  data.restDay=data.restDay+"일 남음";
    	  this.projectList.push(data);
      },
    }
  });
  
  function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
</script>
<script>
	$(document).ready(function(){
		var favor="${user.mem_favor}";
		var favors=favor.split(',');
		if(favor!==''){
			vm.favors=favors;
			vm.msg=favors[0]; 
		}
		
	})
	
	function goAdm(){
		$(location).attr("href","${path}/admin.do");
	}
</script>
</body>

</html>