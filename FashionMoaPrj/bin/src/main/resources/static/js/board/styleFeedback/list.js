
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
	
	let container = $(".board-container");
	let oldmain = $("main .container");
	let newmain = $("#main");
	
//	container
	
	let board = $(".board-channel");
	
//	let img = 
	
	container.click((e)=>{
		e.preventDefault();
		if(e.target.nodeName != "IMG") return;
		console.log(e.target);
		
		let id = $(e.target).parents($("a")).attr("href");
		
		console.log($(this).parents($("a")));
		console.log(id);
		
//		alert("디");
		$.ajax({
			url: `/api/board/styleFeedback/${id}`,
			type: "GET",
			data : {
				"id" : id
			},
			datatype : "JSON",
			success: (d)=>{
//				alert("비동기 성공");
				
//				console.log(url);
				oldmain.remove();
				newmain.append(`<section id="feedback">
		<h2 class="feedback__title">${d.title }</h2>
		<div class="feedback__header">
			<div class="feedback__writer__container">
				<span class="feedback__writer">ID : ${d.writerId }</span>
			</div>
			<div class="feedback__writer__container">
				<span class="feedback__writer__date"> 
					
				</span>
				<span class="feedback__writer__count"> 조회수 : ${d.hit } </span>
				<span class="feedback__writer__modified"> <a href="edit?id=${d.id }">수정</a></span>
				<span class="feedback__writer__delete"> <a href="delete?id=${d.id }">삭제</a></span>
			</div>
		</div>
		<div class="feedback__container">
			<div class="feedback__detail">
				<div class="feedback__style">
					<h3>Style</h3>
						<div class="feedback__style__img">
							<img src="${d.img }" />
						</div>
				</div>
				<div class="feedback__clothes">
					<h3>착용상품</h3>
					<div class="feedback__clothes__img">
<!-- 						<img src="" alt="" /> -->
						<div class="items">아우터 캐러셀</div>
						<div class="items">상의 캐러셀</div>
						<div class="items">하의 캐러셀</div>
						<div class="items">신발 캐러셀</div>
						<div class="items">기타 캐러셀</div>
					</div>
				</div>
			</div>
			<div class="feedback__comment">
				<div class="feedback__writer__comment">
					<span class="feedback__writer__id">${d.writerId }</span>
					<span>${d.content }</span>
				</div>
				<div>
					<div>
						댓글들
					</div>
				</div>
				
				<form>
					<div class="feedback__member">
						<input class="feedback__member__comment" type="text" />
						<button class="member__register__comment">등록</button>
					</div>
				</form>
				
			</div>
		</div>
	</section>`);
				
			}
		});
	});
	
});
