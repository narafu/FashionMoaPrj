//$(function () {
//
//	let id;
//
//	$(".thumbnail-wrapper").click(function (e) {
//
//		id = $(this).find("img").attr("id");
//
//		$.ajax({
//			type: "get",
//			url: `/board/fashionlook/${id}`,
//			data: { "id": id },
//			dataType: "json",
//			success: function (result) {
//				$(".fashion-detail").append(`<div class="detail-context-container">
//					<div class="title-container">
//						<div class="sub-title">${result.title}</div>
//						<i class="fas fa-times fa-2x"></i>
//					</div>
//					<div class="context">
//						<img src="${result.img}" />
//					</div>
//					<div class="content">${result.content}</div>
//				</div>`);
//			}
//
//		});
//
//	});
//
//});