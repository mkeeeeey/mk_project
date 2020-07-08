var margins=['0px','-600px', '-1200px', '-1800px'];
var idx=0;

setInterval(()=>{
	idx=(idx+1)%4;
    document.querySelector('#slider ul li').style.marginLeft=margins[idx];
}, 2000);

window.onload=function(){
	document.querySelectorAll('#slider i')[0].addEventListener('click', (e)=>{
	    idx=(idx+3)%4;
	    console.log(e);
	    document.querySelector('#slider ul li').style.marginLeft=margins[idx];
	    console.log(idx);
	});

	document.querySelectorAll('#slider i')[1].addEventListener('click', ()=>{
	    idx=(idx+1)%4;
	    document.querySelector('#slider ul li').style.marginLeft=margins[idx];
	    console.log(idx);
	});
}
