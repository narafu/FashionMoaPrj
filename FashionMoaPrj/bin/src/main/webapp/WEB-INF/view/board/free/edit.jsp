<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<main id="board-main">

	<section class="detail">

		<h1 class="hidden">수정</h1>

		<form action="edit" method="post">
			<div class="mini-title-box">
				<a href="../list" class="mini-title">후기게시판 전체목록</a>
			</div>
			<div class="title-box">
				<div class="title fnt_jua">
					<input type="text" placeholder="제목을 입력 해 주세요." name="title"
						value="${detail.title}" required>
				</div>

			</div>

			<div class="meta-box detail-margin-top">
				<div class="meta-info">
					<div class="detail-regdate">
						<%-- <fmt:parseDate var="date" value="${r.regdate}"
						pattern="yyyy-MM-dd HH:mm" /> --%>
						<fmt:formatDate value="${detail.regdate}"
							pattern="yyyy-MM-dd HH:mm" />
					</div>
					<div class="writer-name">${detail.nickname }</div>
				</div>
				<div class="meta-info">
					<div class="hit">조회수 ${detail.hit }</div>
					<div class="comment">댓글 ${detail.cmtCount}</div>
					<div class="love">
						<span class="love-img">♥</span> ${detail.likes}
					</div>
				</div>
			</div>
			<div class="content-box detail-margin-top">

				<div class="content">
					<textarea class="content-area" name="content">${detail.content}</textarea>
				</div>
			</div>

				<div class="btn-box">
					<!--<input type="button" class="btn-text love-btn" value="공감♡"></input>-->
					<button type="button" class="love-btn ">
						<span class="love-btn-txt">공감</span><i
							class="likes love-img far fa-heart"></i> <i
							class="likes fas fa-heart hidden"></i>
					</button>
				</div>

			<div class="btn-box">
				<div class="btn-box_box">
					
					<input type="hidden" name="id" value="${detail.id }" /> <input
						class="btn-text btn-save btn-hover" type="submit" value="저장" onclick="return confirm('저장 하겠습니까?');"/> <a
						class="btn-text btn-cancel btn-hover" href="../detail/${detail.id}">취소</a>
				</div>
			</div>
		</form>
	</section>

</main>


