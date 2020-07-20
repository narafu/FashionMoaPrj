$(function(){
	let detail = $(".detail");
	let img = $(".thumbnail-img");
	
	img.click(function (){
		detail.toggle(200);
	});
	
	
    detail.click(function () {
        detail.toggle(500);
  
    });
	
    let times = $(".fa-times");
    times.click(function () {
        detail.toggle(500);
    });
	
	
});