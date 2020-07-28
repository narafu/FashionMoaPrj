
//$.ajax({
//	url : "/board/styleFeedback/detail",
//	method : "GET",
//	async : true
//});

//$(function(){
//	
//		alert("ss");
//});

//$(".btn-reg").click(function() {
//	alert("ssss");
//});

$(()=> {
	let board = $(".board-channel");
	
	board.click(()=>{
//		alert("디");
		$.ajax({
			url: "/board/styleFeedback/list",
			type: "GET",
			success: (url)=>{
//				alert("비동기 성공");
			}
		});
	});
	
});



