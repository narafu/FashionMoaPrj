$(()=> {
	
	let button = $(".member__register__comment");	// 댓글 등록 버튼
	let cmtList = $(".comment-list");	// 댓글 리스트

	button.click((e)=>{
		e.preventDefault();
		
		let pathName = $(location).attr("pathname");	// /board/styleFeedback/73 
		console.log(pathName);	// /board/styleFeedback/73

		let id = pathName.substring(21, 23);
		console.log(id);
		
		let cmtReg = $(".feedback__member");
		console.log(cmtReg);
		let content = cmtReg.find("input[name=content]").val();	// 입력한 댓글 content 값
		console.log(content);
		let writerId = cmtReg.find("input[name=writerId]").val();	// 입력한 댓글 writerId 값
		console.log(writerId);
		let regdate = cmtReg.find("input[name=regdate]").val();	// 입력한 댓글 regdate 값
		console.log(regdate);
		
		// 댓글 등록 ajax
		$.ajax({
			url : `/api/board/styleFeedback/${id}`,
			type : "POST",
			data : {
				"id" : id,
				"writerId" : writerId,
				"content" : content
			},
			datatype : "JSON",
			success : (cmt)=>{
				cmtReg.find("input[name=content]").val("");
			}
		});
		
		// 댓글 리스트 조회 ajax
		$.ajax({
			url : `/api/board/styleFeedback/${id}`,
			type : "GET",
			data : {
				"id" : id,
				"writerId" : writerId,
				"content" : content
			},
			datatype : "JSON",
			success : ()=>{
				// prepend 첫 번째 자식으로 추가
				cmtList.prepend(`
					<div class="comment">
						<div class="comment-info">
							<div class="icon"></div>
							<div class="writer">${writerId }</div>
							<div class="report">신고</div> 
							<div class="content">${content }</div>
							<div class="regdate">
								${regdate}
							</div>
							<div class="delete">삭제</div>
						</div>
					</div>
				`);
			}
		});
		
	});
	
});



