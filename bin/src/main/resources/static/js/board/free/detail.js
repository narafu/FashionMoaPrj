/*$(function() {
		var email = $("#email").val();
		var docnick = $(".writer-name").text();
		console.log(email);
		
		$("#email").val(email);
		console.log('접속자 이메일='+email);
		console.log('작성자 이메일='+docnick);
		
		if(docnick!=email){
			console.log("닉넴불일치");
			$(".btn-edit").hide();
			$(".btn-delete").hide();
		}
		if(docnick==email){
			console.log("닉넴일치");
		}
		if(email==null){
				console.log("nick x");
			}
		showReplyList();

function showReplyList(){
	
	console.log('댓글리스트');	
	var url = "${pageContext.request.contextPath}/restBoard/cmtList";
	var paramData = {"bid" : "${detail.id}"};

	$.ajax({
        type: 'POST',
        url: url,
        data: paramData,
        dataType: 'json',
        success: function(result) {
           	var htmls = "";
		if(result.length < 1){
			htmls.push("등록된 댓글이 없습니다.");
		} else {
                    $(result).each(function(){
                     htmls += '<div class="media text-muted pt-3" id="cid' + this.cid + '">';
                     htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
                     htmls += '<title>Placeholder</title>';
                     htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
                     htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
                     htmls += '</svg>';
                     htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
                     htmls += '<span class="d-block">';
                     htmls += '<strong class="text-gray-dark">' + this.email + '</strong>';
                     htmls += '<span style="padding-left: 7px; padding-right: 10px; font-size: 9pt">';
                     htmls += '<a href="javascript:void(0)" onClick="fn_editCmt(' + this.cid + ', \'' + this.email + '\', \'' + this.content + '\' )" style="padding-right:5px">수정</a>';
                     htmls += '<a href="javascript:void(0)" onClick="fn_deleteCmt(' + this.cid + ')" >삭제</a>';
                     htmls += '</span>';
                     htmls += '</span>';
                     htmls += this.content;
                     htmls += '</p>';
                     htmls += '</div>';
                });	//each end
		}
		$("#replyList").html(htmls);
        }	   // Ajax success end
	});	// Ajax end
}//cmtList

$(document).on('click', '#insertCmt', function(){
	console.log('댓글등록클릭!');	
	var replyContent = $('#content').val();
	var email = $("#email").val();
	
	var paramData = JSON.stringify({"content": replyContent
			, "email": email
			, "bid":'${detail.id}'
	});
	console.log(paramData);	
	
	var headers = {"Content-Type" : "application/json"
			, "X-HTTP-Method-Override" : "POST"};

	$.ajax({
		url: "${pageContext.request.contextPath}/restBoard/insertCmt"
		, headers : headers
		, data : paramData
		, type : 'POST'
		, dataType : 'text'
		, success: function(result){
			showReplyList();
			$('#content').val('');
			$('#email').val();
		}
		, error: function(error){
			console.log("에러 : " + error);
		}
	});
});//insertCmt

function fn_editCmt(cid, email, content){
		console.log('editCmt');
		var htmls = "";

		htmls += '<div class="media text-muted pt-3" id="cid' + cid + '">';
		htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
		htmls += '<title>Placeholder</title>';
		htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
		htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
		htmls += '</svg>';
		htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
		htmls += '<span class="d-block">';
		htmls += '<strong class="text-gray-dark">' + email + '</strong>';
		htmls += '<span style="padding-left: 7px; font-size: 9pt">';
		htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + cid + ', \'' + email + '\')" style="padding-right:5px">저장</a>';
		htmls += '<a href="javascript:void(0)" onClick="showReplyList()">취소<a>';
		htmls += '</span>';
		htmls += '</span>';		
		htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';
		htmls += content;
		htmls += '</textarea>';
		htmls += '</p>';
		htmls += '</div>';
	
		$('#cid' + cid).replaceWith(htmls);
		$('#cid' + cid + ' #editContent').focus();
	}//editButton

function fn_updateReply(cid, email){
	console.log('updateReply');
	var replyEditContent = $('#editContent').val();
	var paramData = JSON.stringify({"content": replyEditContent
			, "cid": cid
	});
	var headers = {"Content-Type" : "application/json"
			, "X-HTTP-Method-Override" : "POST"};
	$.ajax({
		url: "${pageContext.request.contextPath}/restBoard/editCmt"
		, headers : headers
		, data : paramData
		, type : 'POST'
		, dataType : 'text'
		, success: function(result){
                console.log(result);
			showReplyList();
		}
		, error: function(error){
			console.log("에러 : " + error);
		}
	});
}//edit submit


function fn_deleteCmt(cid){
	var paramData = {"cid": cid};
	$.ajax({
		url: "${pageContext.request.contextPath}/restBoard/deleteCmt"
		, data : paramData
		, type : 'POST'
		, dataType : 'text'
		, success: function(result){
			showReplyList();
		}
		, error: function(error){
			console.log("에러 : " + error);
		}
	});

}//delete

});//script
*/