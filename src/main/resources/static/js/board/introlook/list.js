$(function(){
	
	let casualContext = $(".casual-context");
	let streetContext = $(".street-context");
	let avantgardeContext = $(".avantgarde-context");
	let classicContext = $(".classic-context");
	let dandyContext = $(".dandy-context");
	let maximalismContext = $(".maximalism-context");
	let minimalismContext = $(".minimalism-context");
	let normcoreContext = $(".normcore-context");
	let vintageContext = $(".vintage-context");
	
	let casualWrapper = $(".casual-wrapper");
	let streetWrapper = $(".street-wrapper");
	let avantgardeWrapper = $(".avantgarde-wrapper");
	let classicWrapper = $(".classic-wrapper");
	let dandyWrapper = $(".dandy-wrapper");
	let maximalismWrapper = $(".maximalism-wrapper");
	let minimalismWrapper = $(".minimalism-wrapper");
	let normcoreWrapper = $(".normcore-wrapper");
	let vintageWrapper = $(".vintage-wrapper");
	
	//img.click(function(){
	//	console.log("img click!");
	//})
	//detail.click(function(){
	//	detail.toggle(500);
	//	console.log("detail");
	//})
	
//	casual.click(function(){
//		casual.toggle(200);
//		console.log("casual");
//	})
	
	casualWrapper.click(function (){
		casualContext.toggle(200);
		console.log("casual page");
	});
	
	streetWrapper.click(function (){
		streetContext.toggle(200);
		console.log("street page");
	});
	
	avantgardeWrapper.click(function (){
		avantgardeContext.toggle(200);
		console.log("avantgarde page");
	});
	classicWrapper.click(function (){
		classicContext.toggle(200);
		console.log("classic page");
	});
	dandyWrapper.click(function (){
		dandyContext.toggle(200);
		console.log("dandy page");
	});
	maximalismWrapper.click(function (){
		maximalismContext.toggle(200);
		console.log("maximalism page");
	});
	minimalismWrapper.click(function (){
		minimalismContext.toggle(200);
		console.log("minimalism page");
	});
	normcoreWrapper.click(function (){
		normcoreContext.toggle(200);
		console.log("normcore page");
	});
	vintageWrapper.click(function (){
		vintageContext.toggle(200);
		console.log("vintage page");
	});
	
	
	//-------------------
	casualContext.click(function (){
		casualContext.hide(500);
		console.log("casual hide");
	});
	
	streetContext.click(function (){
		streetContext.hide(500);
		console.log("street hide");
	});
	
	avantgardeContext.click(function (){
		avantgardeContext.hide(500);
		console.log("avantgarde hide");
	});
	
	classicContext.click(function (){
		classicContext.hide(500);
		console.log("classic hide");
	});
	dandyContext.click(function (){
		dandyContext.hide(500);
		console.log("dandy hide");
	});
	maximalismContext.click(function (){
		maximalismContext.hide(500);
		console.log("maximalism hide");
	});

	minimalismContext.click(function (){
		minimalismContext.hide(500);
		console.log("minimalism hide");
	});
	
	normcoreContext.click(function (){
		normcoreContext.hide(500);
		console.log("normcore hide");
	});

	vintageContext.click(function (){
		vintageContext.hide(500);
		console.log("vintage hide");
	});
	
    let times = $(".fa-times");
    times.click(function () {
        casualContext.hide(500);
        streetContext.hide(500);
        avantgardeContext.hide(500);
        classicContext.hide(500);
        dandyContext.hide(500);
        maximalismContext.hide(500);
        minimalismContext.hide(500);
        normcoreContext.hide(500);
        vintageContext.hide(500);
    });
	
	
});