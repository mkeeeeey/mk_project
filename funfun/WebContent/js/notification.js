/**
 * 
 */
toastr.options = {
  "closeButton": false,
  "debug": false,
  "newestOnTop": false,
  "progressBar": false,
  "positionClass": "toast-top-center",
  "preventDuplicates": false,
  "onclick": null,
  "showDuration": "300",
  "hideDuration": "1000",
  "timeOut": "5000",
  "extendedTimeOut": "1000",
  "showEasing": "swing",
  "hideEasing": "linear",
  "showMethod": "fadeIn",
  "hideMethod": "fadeOut"
}

function notiAlert(){
	Command: toastr["success"]("알림을 확인해주세요.", "문의사항에 답변이 달렸습니다.");
}



	
	var vm0 = new Vue({
		el:'#noti-wrap',
		data:{
			totalCnt:0,
			notiList:[]
		},
		mounted:function(){
			if(loginUser==''){
				//비로그인
			} else {
				//로그인
				$.ajax({
					type:"get",
					url:path+"/getNotificationList.do?mem_code="+loginUser,
					dataType:"json",
					success:function(data){
						data.list.forEach(el=>{
							var tmp={
									'title':'문의 하신('+el.title+')에 대한 답변이 달렸습니다.',
									'link':"",
							};
							if(el.type==='project'){
								tmp.link=window.location.origin+path+"/funding.do?method=detail&pro_code="+el.code;
							} else if(el.type==='store'){
								tmp.link=window.location.origin+path+"/store.do?method=detail&sto_code="+el.code+"#sto_QnA_Div";
							}
							vm0.notiList.push(tmp);
						})
					},
					error:function(err){
						console.log("ajax에러");
						console.log(err);
					}
				});
				
				//종료예정인 상품 알람추가
				$.ajax({
					type:"get",
					url:path+"/getFavorProjectListLeft7DaysOrLess.do?mem_code="+loginUser,
					dataType:"json",
					success:function(data){
						data.list.forEach(el=>{
							var tmp={
									'title':`★종료임박 프로젝트 알림★
									[${el.title}]`,
									'link':window.location.origin+path+"/funding.do?method=detail&pro_code="+el.code,
							}
							vm0.notiList.push(tmp);
						})
					},
					error:function(err){
						console.log('ajax에러');
						console.log(err);
					}
				})
			}
		},
		watch:{
			notiList:function(val){
				this.totalCnt=val.length;
			}
		},
		methods:{
			recall:function(event){
				console.log(event);
				vm0.notiList=[];
				if(loginUser==''){
					//비로그인
				} else {
					//로그인
					$.ajax({
						type:"get",
						url:path+"/getNotificationList.do?mem_code="+loginUser,
						dataType:"json",
						success:function(data){
							data.list.forEach(el=>{
								var tmp={
										'title':'문의 하신('+el.title+')에 대한 답변이 달렸습니다.',
										'link':"",
								};
								if(el.type==='project'){
									tmp.link=window.location.origin+path+"/funding.do?method=detail&pro_code="+el.code;
								} else if(el.type==='store'){
									tmp.link=window.location.origin+path+"/store.do?method=detail&sto_code="+el.code+"#sto_QnA_Div";
								}
								vm0.notiList.push(tmp);
							})
						},
						error:function(err){
							console.log("ajax에러");
							console.log(err);
						}
					});
					
					//종료예정인 상품 알람추가
					$.ajax({
						type:"get",
						url:path+"/getFavorProjectListLeft7DaysOrLess.do?mem_code="+loginUser,
						dataType:"json",
						success:function(data){
							data.list.forEach(el=>{
								var tmp={
										'title':`★종료임박 프로젝트 알림★
										[${el.title}]`,
										'link':window.location.origin+path+"/funding.do?method=detail&pro_code="+el.code,
								}
								vm0.notiList.push(tmp);
							})
						},
						error:function(err){
							console.log('ajax에러');
							console.log(err);
						}
					})
				}
			},
		}
	});
	
var wsocket1;

$(document).ready(function(){
	if(user!==''){
		wsocket1 = new WebSocket(window.location.origin.replace('http','ws')+"/funfun/notification-ws.do");
		wsocket1.onopen=function(evt){
			console.log("알림웹소켓접속");
		};
		wsocket1.onmessage=function(evt){
			if(evt.data===userCode){
				notiAlert();
				vm0.recall();
			}
		};
		wsocket1.onclose=function(){
			console.log("연결종료");
		};
	}
})

