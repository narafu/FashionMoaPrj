<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<main id="board-main">

	<section class="detail">

		<h1 class="hidden">디테일</h1>

		<div class="mini-title-box">
			<a href="../list" class="mini-title">후기게시판 전체목록</a>
		</div>
		<div class="title-box">
			<div class="title fnt_jua">${detail.title }</div>

		</div>

		<div class="meta-box detail-margin-top">
			<div class="meta-info">
				<div class="detail-regdate">
					<%-- <fmt:parseDate var="date" value="${r.regdate}"
						pattern="yyyy-MM-dd HH:mm" /> --%>
					<fmt:formatDate value="${detail.regdate}" pattern="yyyy-MM-dd HH:mm" />
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
			<div class="content">${r.content}</div>
		</div>

		<form action="" method="POST">
			<div class="btn-box">
				<!--<input type="button" class="btn-text love-btn" value="공감♡"></input>-->
				<button type="button" class="love-btn ">
					<span class="love-btn-txt">공감</span><i
						class="likes love-img far fa-heart"></i>
					<i class="likes fas fa-heart hidden"></i>
				</button>
			</div>
		</form>

		<div class="btn-box">
			<div class="btn-box_box">
				<a class="btn-text btn-cancel btn-hover" href="../list">이전 목록</a> <a
					class="btn-text btn-default btn-hover" href="../edit/${detail.id }">수정</a>
				<a class="btn-text btn-default btn-hover" onclick="return confirm('정말 삭제 하겠습니까?');"
				href="../delete/${detail.id }">삭제</a>
			</div>
		</div>

	</section>

</main>


