$(()=> {
	
	let button = $(".member__register__comment");	// 댓글 등록 버튼
	let cmtList = $(".comment-list");	// 댓글 리스트

	button.click((e)=>{
		e.preventDefault();
		
		$.ajax({
			url : `/api/board/styleFeedback/${id}`,
			type : "GET",
			data : {
				"id" : id
			},
			datatype : "JSON",
			success : (cmt)=>{
				console.log(id);
				cmtList.append(`
					<div class="comment-info">
						<div class="icon"></div>
						<div class="writer">${cmt.writerId }</div>
						<div class="report">신고</div>
						<div class="content">${cmt.content }</div>
						<div class="regdate">
							${cmt.regdate}
//							<fmt:parseDate var="date" value="${cmt.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
//							<fmt:formatDate value="${date}" pattern="yyyy-MM-dd HH:mm" />
						</div>
						<div class="delete">삭제</div>
					</div>
				`);
			}
		});
		
/*		if(e.target.nodeName != "IMG") return;
		console.log(e.target);
		
		let id = $(e.target).parents($("a")).attr("href");
		
		console.log($(this).parents($("a")));
		console.log(id);
		
		$.ajax({
			url: `/api/board/styleFeedback/${id}`,
			type: "GET",
			data : {
				"id" : id
			},
			datatype : "JSON",
			success: (d)=>{
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
		});*/
	});
	
});



