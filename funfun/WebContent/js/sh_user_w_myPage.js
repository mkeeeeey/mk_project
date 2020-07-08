var choice = $(".profile__choice").get();
var funding = $(".profile__times--num").get();
var order = $(".profile__times--text").get();
console.log(1)
$(choice[0]).click(function(e){

    $(".display_item").css('display','block');
    $(".funding_display").css('display','none');
    $(".trans_display").css('display','none');
    $("#myProject").addClass('clicked');
    $("#myFunding").removeClass('clicked');
    $("#myOrder").removeClass('clicked');
})
$(choice[1]).click(function(e){
    $(".funding_display").css('display','block');
    $(".display_item").css('display','none');
    $(".trans_display").css('display','none');
    $("#myFunding").addClass('clicked');
    $("#myProject").removeClass('clicked');
    $("#myOrder").removeClass('clicked');

})
$(choice[2]).click(function(e){
    $(".trans_display").css('display','block');
    $(".display_item").css('display','none');
    $(".funding_display").css('display','none');
    $("#myOrder").addClass('clicked');
    $("#myProject").removeClass('clicked');
    $("#myFunding").removeClass('clicked');
})

$(funding[0]).click(function(e){
	$(".funding_display").css('display','block');
    $(".display_item").css('display','none');
    $(".trans_display").css('display','none');
    $("#myFunding").addClass('clicked');
    $("#myProject").removeClass('clicked');
    $("#myOrder").removeClass('clicked');
})
$(order[0]).click(function(e){
	$(".funding_display").css('display','block');
    $(".display_item").css('display','none');
    $(".trans_display").css('display','none');
    $("#myFunding").addClass('clicked');
    $("#myProject").removeClass('clicked');
    $("#myOrder").removeClass('clicked');
})

$(funding[1]).click(function(e){
	$(".trans_display").css('display','block');
    $(".display_item").css('display','none');
    $(".funding_display").css('display','none');
    $("#myOrder").addClass('clicked');
    $("#myProject").removeClass('clicked');
    $("#myFunding").removeClass('clicked');
})
$(order[1]).click(function(e){
	$(".trans_display").css('display','block');
    $(".display_item").css('display','none');
    $(".funding_display").css('display','none');
    $("#myOrder").addClass('clicked');
    $("#myProject").removeClass('clicked');
    $("#myFunding").removeClass('clicked');
})

$("#chargeM").click(function(){

    $("#chargeM_div").css('display','block')
    $("#chargeM").css('background-color','rgba(255,151,5,0.5)');
    $("#withdrawlM, #usingM, #infoM").css('background-color','white');
    $("#withdrawlM_div").css('display','none');
    $("#usingM_div").css('display','none');
    $("#infoM_div").css('display','none');
})
$("#withdrawlM").click(function(){
    $("#withdrawlM_div").css('display','block');
    $("#withdrawlM").css('background-color','rgba(255,151,5,0.5)');
    $("#chargeM, #usingM, #infoM").css('background-color','white');
    $("#chargeM_div").css('display','none');
    $("#usingM_div").css('display','none');
    $("#infoM_div").css('display','none');
})
$("#usingM").click(function(){
    $("#usingM_div").css('display','block');
    $("#usingM").css('background-color','rgba(255,151,5,0.5)');
    $("#chargeM, #withdrawlM, #infoM").css('background-color','white');
    $("#chargeM_div").css('display','none');
    $("#withdrawlM_div").css('display','none');
    $("#infoM_div").css('display','none');
})
$("#infoM").click(function(){
    $("#infoM_div").css('display','block');
    $("#infoM").css('background-color','rgba(255,151,5,0.5)');
    $("#chargeM, #withdrawlM, #usingM").css('background-color','white');
    $("#chargeM_div").css('display','none');
    $("#withdrawlM_div").css('display','none');
    $("#usingM_div").css('display','none');
})

