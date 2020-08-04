<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="/js/board/free/detail.js"></script>
<script type="text/javascript">
	$(function() {
		var email = $("#email").val();
		var docnick = $(".writer-name").text();
		var userid = "${userId}";
		/*$("#email").val(email);*/
		console.log('유저아이디=' + userid);
		console.log('현재접속자 이메일=' + email);
		console.log('게시글작성자 이메일=' + docnick);
		if (docnick != email) {
			console.log("이메일 불일치!");
			$(".btn-edit").hide();
			$(".btn-delete").hide();
		}
		if (docnick == email) {
			console.log("이메일 일치!");
		}
		if (email == null) {
			console.log("nick x");
		}
		showReplyList();

		function showReplyList() {

			console.log('댓글리스트');
			var url = "${pageContext.request.contextPath}/restBoard/cmtList";
			var paramData = {
				"bid" : "${detail.id}"
			};
			var detailemail = "${detail.email}";
			var userId = "${userId}";

			$
					.ajax({
						type : 'POST',
						url : url,
						data : paramData,
						dataType : 'json',
						success : function(result) {
							var htmls = "";
							if (result.length < 1) {
								htmls.append('등록된 댓글이 없습니다.');

							} else {

								$(result)
										.each(
												function() {
													htmls += '<div class="media text-muted pt-3" id="cid' + this.cid + '">';
													htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
													htmls += '<title>Placeholder</title>';
													htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
													htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
													htmls += '</svg>';
													htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
													htmls += '<span class="d-block">';
													htmls += '<strong class="text-gray-dark">'
															+ this.email
															+ '</strong>';
													htmls += '<span style="padding-left: 7px; padding-right: 10px; font-size: 9pt">';

													if (this.email == userId) {
														console.log(this.email
																+ userId);
														htmls += '<a href="javascript:void(0)" class="btn-cmtEdit" onClick="fn_editCmt('
																+ this.cid
																+ ', \''
																+ this.email
																+ '\', \''
																+ this.content
																+ '\' )" style="padding-right:5px">수정</a>';
														htmls += '<a href="javascript:void(0)" class="btn-cmtDelete" onClick="fn_deleteCmt('
																+ this.cid
																+ ')" >삭제</a>';
													}
													htmls += '</span>';
													htmls += '</span>';
													htmls += this.content;
													htmls += '</p>';
													htmls += '</div>';
												}); //each end
							}
							$("#replyList").html(htmls);
						} // Ajax success end
					}); // Ajax end
		}
		;//cmtList

	});//script
</script>
<main id="board-main">
	<script type="text/javascript">
		function showReplyList() {

			console.log('댓글리스트');
			var url = "${pageContext.request.contextPath}/restBoard/cmtList";
			var paramData = {
				"bid" : "${detail.id}"
			};
			var detailemail = "${detail.email}";
			var userId = "${userId}";
			var frdcmt = "${frdcmt}"
			console.log(frdcmt);

			$
					.ajax({
						type : 'POST',
						url : url,
						data : paramData,
						dataType : 'json',
						success : function(result) {
							var htmls = "";
							if (result.length < 1) {
								htmls.append('등록된 댓글이 없습니다.');

							} else {
								$(result)
										.each(
												function() {
													htmls += '<div class="media text-muted pt-3" id="cid' + this.cid + '">';
													htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
													htmls += '<title>Placeholder</title>';
													htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
													htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
													htmls += '</svg>';
													htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
													htmls += '<span class="d-block">';
													htmls += '<strong class="text-gray-dark">'
															+ this.email
															+ '</strong>';
													htmls += '<span style="padding-left: 7px; padding-right: 10px; font-size: 9pt">';
													if (this.email == userId) {
														htmls += '<a href="javascript:void(0)" class="btn-cmtEdit" onClick="fn_editCmt('
																+ this.cid
																+ ', \''
																+ this.email
																+ '\', \''
																+ this.content
																+ '\' )" style="padding-right:5px">수정</a>';
														htmls += '<a href="javascript:void(0)" class="btn-cmtDelete" onClick="fn_deleteCmt('
																+ this.cid
																+ ')" >삭제</a>';
													}
													htmls += '</span>';
													htmls += '</span>';
													htmls += this.content;
													htmls += '</p>';
													htmls += '</div>';

												}); //each end
							}
							$("#replyList").html(htmls);
						} // Ajax success end
					}); // Ajax end
		};//cmtList

		$(document).on('click', '#insertCmt', function() {
			console.log('댓글등록클릭!');
			var replyContent = $('#content').val();
			var email = $("#email").val();

			var paramData = JSON.stringify({
				"content" : replyContent,
				"email" : email,
				"bid" : '${detail.id}'
			});
			console.log(paramData);

			var headers = {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			};

			$.ajax({
				url : "${pageContext.request.contextPath}/restBoard/insertCmt",
				headers : headers,
				data : paramData,
				type : 'POST',
				dataType : 'text',
				success : function(result) {
					showReplyList();
					$('#content').val('');
					$('#email').val();
				},
				error : function(error) {
					console.log("에러 : " + error);
				}
			});
		});//insertCmt

		function fn_editCmt(cid, email, content) {
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
			htmls += '<a href="javascript:void(0)" onClick="fn_updateReply('
					+ cid + ', \'' + email
					+ '\')" style="padding-right:5px">저장</a>';
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
		};//editButton

		function fn_updateReply(cid, email) {
			console.log('updateReply');
			confirm('수정된 내용을 저장 하시겠습니까?');
			var replyEditContent = $('#editContent').val();
			var paramData = JSON.stringify({
				"content" : replyEditContent,
				"cid" : cid
			});
			var headers = {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			};
			$.ajax({
				url : "${pageContext.request.contextPath}/restBoard/editCmt",
				headers : headers,
				data : paramData,
				type : 'POST',
				dataType : 'text',
				success : function(result) {
					console.log(result);
					showReplyList();
				},
				error : function(error) {
					console.log("에러 : " + error);
				}
			});
		};//edit submit

		function fn_deleteCmt(cid) {
			confirm('정말 삭제 하겠습니까?');
			var paramData = {
				"cid" : cid
			};
			$.ajax({
				url : "${pageContext.request.contextPath}/restBoard/deleteCmt",
				data : paramData,
				type : 'POST',
				dataType : 'text',
				success : function(result) {
					showReplyList();
				},
				error : function(error) {
					console.log("에러 : " + error);
				}
			});

		}//delete
	</script>
	<section class="detail" style="width: 80%;">

		<h1 class="hidden">디테일</h1>

		<div class="mini-title-box">
			<a href="../list" class="mini-title">후기게시판 전체목록</a>
		</div>
		<div class="title-box">
			<div class="title fnt_jua"
				style="padding: 30px 0px; font-size: 30px; border-bottom: solid;">${detail.title}</div>

		</div>

		<div class="meta-box detail-margin-top"
			style="line-height: 30px; font-size: 20px;">
			<div class="meta-info">
				<div class="detail-regdate" style="text-align: left;">
					<%-- <fmt:parseDate var="date" value="${r.regdate}"
						pattern="yyyy-MM-dd HH:mm" /> --%>
					게시일 :
					<fmt:formatDate value="${detail.regdate}"
						pattern="yyyy-MM-dd HH:mm" />
				</div>
				<div>작성자 : ${detail.email }</div>
				<div class="writer-name hidden">${detail.email}</div>
			</div>
			<div class="meta-info">
				<div class="hit">조회수 ${detail.hit }</div>
				<div class="comment">댓글 ${detail.cmtCount}</div>
				<%-- <div class="love">
					<span class="love-img">♥</span> ${detail.likes}
				</div> --%>
			</div>
		</div>
		<div class="content-box detail-margin-top" style="padding: 20px;">

			<div class="content">${detail.content}</div>
		</div>

		<form action="" method="POST">
			<!-- <div class="btn-box">
				<input type="button" class="btn-text love-btn" value="공감♡"></input>
				<button type="button" class="love-btn ">
					<span class="love-btn-txt">공감</span><i
						class="likes love-img far fa-heart"></i> <i
						class="likes fas fa-heart hidden"></i>
				</button>
			</div> -->
		</form>

		<div class="btn-box">
			<div class="btn-box_box">
				<a class="btn-text btn-cancel btn-hover" href="../list">이전 목록</a>
				<a
					class="btn-text btn-default btn-edit btn-hover"
					href="../edit/${detail.id }">수정</a>
				<a
					class="btn-text btn-default btn-delete btn-hover"
					onclick="return confirm('정말 삭제 하겠습니까?');"
					href="../delete/${detail.id }">삭제</a>

			</div>
		</div>
		<!-- Reply Form {s} -->

		<div class="my-3 p-3 bg-white rounded shadow-sm"
			style="padding-top: 10px">

			<form:form name="form" id="form" role="form" modelAttribute="fbdCmt"
				method="post">

				<form:hidden path="cid" id="cid" />

				<div class="row">

					<div class="col-sm-10">

						<form:textarea path="content" id="content" class="form-control"
							rows="3" placeholder="댓글을 입력해 주세요"></form:textarea>

					</div>

					<div class="col-sm-2">

						<form:hidden path="email" class="form-control" var="email"
							id="email" value="${sessionScope.userId }" placeholder="댓글 작성자"></form:hidden>
						<c:choose>
							<c:when test="${userId eq null}">
								<button type="button" class="btn btn-sm btn-primary"
									style="width: 100%; margin-top: 10px"
									onClick="alert('로그인 후 이용할 수 있습니다.'); return false;">저
									장</button>
							</c:when>

							<c:otherwise>
								<button type="button" class="btn btn-sm btn-primary"
									id="insertCmt" style="width: 100%; margin-top: 10px">저
									장</button>
							</c:otherwise>
						</c:choose>

					</div>
				</div>
			</form:form>
		</div>

		<!-- Reply List {s}-->
		<div class="my-3 p-3 bg-white rounded shadow-sm"
			style="padding-top: 10px">
			<h6 class="border-bottom pb-2 mb-0"
				style="font-size: 20px; padding: 20px 0px;">Reply list</h6>
			<div id="replyList"></div>
			<%-- 		
           <div class="media text-muted pt-3 hidden" id="cid' + this.cid + '">
	         <svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">
	     		<title>Placeholder</title>
	            <rect width="100%" height="100%" fill="#007bff"></rect>
	                 <p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">
	               <span class="d-block">
	              <strong class="text-gray-dark">${detail.email}</strong>
	                <span style="padding-left: 7px; padding-right: 10px; font-size: 9pt">
	               </span>
	                 </span>
	               ${detail.content} ${detail.email}
	                 </p>
              </div> --%>
		</div>
	</section>


</main>


