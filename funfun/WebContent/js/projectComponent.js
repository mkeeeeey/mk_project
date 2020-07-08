/*
 * 
 */
const lazyLoad = {
    inserted: el => {
        function loadImage() {
            const isA = el.nodeName === "A";
            // 이미지 태그일 경우만 url 입력 로딩
            if (isA) {
                el.style.backgroundImage = `url(${el.dataset.url})`;
                el.classList.add('bounce');
                console.log("image load");
            }
        }

         function createObserver() {
            const observer = new IntersectionObserver((entries, observer) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) { // 감지대상이 교차영역에 진입 할 경우
                        loadImage(); // 교차영역 들어올경우 이미지 로딩
                        observer.unobserve(el); // 이미지 로딩 이후론 관찰할 필요 x
                    }
                });
            },{
            	root:null,
            	rootMargin:'0px',
            	threshold:0
            });

            observer.observe(el);
            console.log("image observe");
        }
        createObserver();
    }
}

Vue.directive("lazyload", lazyLoad);

let projectComponent = Vue.extend({
    template:`<div class="col-xs-12 col-md-4 item" style="margin-bottom:70px;" v-on:click='goFunding'>
        <div class="row" style="position:relative; width:100%; height:233px; margin:0; box-sizing: border-box;">
            <div style=" position: absolute;border-radius:7px; width:100%; height:100%; background-color: #666;"></div>
            <a v-lazyload 
            v-bind:data-url="image"
            style="border-radius:7px; width:100%; height:100%; position: absolute; background-repeat:no-repeat; background-size: 100% 233px;"></a>
        </div>
        <div class="row">
            <span style="display:block;width:100%; height:52px;  font-size:17px; font-weight: bold; padding: 2px 12px;">{{title}}</span>
        </div>
        <div class="row">
            <span style="color:#666; padding-left: 12px;">{{category}}</span>
        </div>
        <div class="row" style="position: relative; padding:0px 12px 0px 12px; box-sizing: border-box; width:100%; height:6px;">
            <div style="background-color: #eee; width:100%; height:6px; position:absolute; box-sizing: border-box; border-radius: 4px;"></div>
            <div style="background-color: rgb(255,160,0); height:6px; position:absolute; border-radius: 4px;"
            v-bind:style="{width:percent+'%'}"></div>
        </div>
        <div class="row" style="padding:8px 12px;">
            <div class="col-md-6" style="padding:0">
                <span style="color:rgb(255,150,0); font-weight: bold;">{{percentStr}}</span>
                <span style="color:#666; font-weight: bold;">{{targetFunding}}</span>
            </div>
            <div class="col-md-6" style="text-align:right;">
                <span style="color:#666; font-weight: bold;">{{restDay}}</span>
            </div>
        </div>
    </div>`,
    methods:{
    	goFunding:function(event){
    		var url=window.location.origin+'/funfun/funding.do?method=detail&pro_code='+this.code;
    		window.location=url;
    	}
    },
    data:function(){
        return {
        	percentBar:"",
        	percentStr:"",
        }
    },
    props:['image', 'title', 'category', 'percent', 'bgurl', 'targetFunding', 'restDay', 'code'],
    mounted:function(){
    	this.percentStr=this.percent+"% 달성";
    		
		if(this.percent>=100){
			percentBar='100';
		} else{
			percentBar=this.percent;
		}
    		
	},

});


