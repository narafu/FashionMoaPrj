<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- ************** 게시판  main ************** -->
<main id="board-main">

	<nav class="nav">
		<div class="board-container">
			<h1 class="hidden">글쓰기</h1>
			<div class="title-box">
				<input class="title" name="title" type="text"
					placeholder="제목을 입력하세요." required>
			</div>

			<div class="content-box">
				<div class="toolbar">
					<button class="btn-bold">
						<i class="fas fa-bold"></i>
					</button>
					<button class="btn-italic">
						<i class="fas fa-italic"></i>
					</button>
					<button class="btn-underline">
						<i class="fas fa-underline"></i>
					</button>
					<button class="btn-img">
						<i class="far fa-image"></i>
					</button>
					<input multiple="multiple" type="file" class="btn-file">
				</div>
				<div class="content-area" data-placeholder="내용을 입력해주세요."
					contenteditable="true"></div>

			</div>

			<div class="btn-box">
				<div class="btn-box_box">
					<input class="btn-text btn-default btn-submit" type="submit"
						value="등록" /> <a class="btn-text btn-cancel" href="list">취소</a>
				</div>
			</div>
		</div>
	</nav>

</main>
