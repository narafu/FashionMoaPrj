<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<main id="main">

	<section class="style-feedback-detail">
		<h1 class="hidden" style="font-size: 40px; color: red;">스타일 피드백 Detail</h1>
		<div class="detail-table">
			<div class="title">제목</div>
			<div class="box">
				<div class="icon">아이콘</div>
				<div class="writer">작성자</div>
			</div>
			<div class="box border-bottom">
				<div class="regdate">2222-22-22 22:22</div>
				<div class="hit">조회수 1</div>
				<div class="edit">수정</div>
				<div class="delete">삭제</div>
			</div>
			<div class="content">
				<div class="content-info1">
					<span class="f-size-30">코디</span> <img class="picture"
						src="/${session.uid }/${list.img}"></img>
				</div>

				<div class="content-info2">
					<div>
						<span class="f-size-30">상의</span>
						<table class="top">
							<tr>
								<td><img class="item"
									src="/image/KakaoTalk_20200703_220605084_01.jpg"></td>
								<td><img class="item"
									src="/image/KakaoTalk_20200703_220605084_02.jpg"></td>
								<td><img class="item"
									src="/image/KakaoTalk_20200703_220605084_03.jpg"></td>
								<td><img class="item"
									src="/image/KakaoTalk_20200703_220605084_04.jpg"></td>
							</tr>
						</table>
					</div>
					<div>
						<span class="f-size-30">하의</span>
						<table class="bottom">
							<tr>
								<td><img class="item"
									src="/image/KakaoTalk_20200703_220605084_05.jpg"></td>
								<td><img class="item"
									src="/image/KakaoTalk_20200703_220605084_06.jpg"></td>
								<td><img class="item"
									src="/image/KakaoTalk_20200703_220605084_07.jpg"></td>
								<td><img class="item"
									src="/image/KakaoTalk_20200703_220605084_08.jpg"></td>
							</tr>
						</table>
					</div>
					<div>
						<span class="f-size-30">신발</span>
						<table class="shoes">
							<tr>
								<td class="item">신발 사진</td>
								<td class="item">신발 사진</td>
								<td class="item">신발 사진</td>
								<td class="item">신발 사진</td>
							</tr>
						</table>
					</div>
					<div>
						<span class="f-size-30">악세사리</span>
						<table class="accessory">
							<tr>
								<td class="item">악세사리 사진</td>
								<td class="item">악세사리 사진</td>
								<td class="item">악세사리 사진</td>
								<td class="item">악세사리 사진</td>
							</tr>
						</table>
					</div>
				</div>

				<div class="content-info3">
					<div>글 내용</div>
				</div>
			</div>
		</div>

		<section class="comment">
			<h1 class="hidden">댓글</h1>
			<div class="comment-box1">
				<div class="comment-list">
					<div class="content-container">
						<div class="icon">아이콘</div>
						<div class="writer">작성자</div>
						<div class="report">신고</div>
						<div class="content">내용</div>
						<div class="regdate">작성일</div>
						<div class="delete">삭제</div>
					</div>
				</div>
	
				<div class="comment-list">
					<div class="content-container">
						<div class="icon">아이콘</div>
						<div class="writer">작성자</div>
						<div class="report">신고</div>
						<div class="content">내용</div>
						<div class="regdate">작성일</div>
						<div class="delete">삭제</div>
					</div>
				</div>
	
				<div class="comment-list">
					<div class="content-container">
						<div class="icon">아이콘</div>
						<div class="writer">작성자</div>
						<div class="report">신고</div>
						<div class="content">내용</div>
						<div class="regdate">작성일</div>
						<div class="delete">삭제</div>
					</div>
				</div>
				
				<div class="comment-list">
					<div class="content-container">
						<div class="icon">아이콘</div>
						<div class="writer">작성자</div>
						<div class="report">신고</div>
						<div class="content">내용</div>
						<div class="regdate">작성일</div>
						<div class="delete">삭제</div>
					</div>
				</div>
				
				<div class="comment-list">
					<div class="content-container">
						<div class="icon">아이콘</div>
						<div class="writer">작성자</div>
						<div class="report">신고</div>
						<div class="content">내용</div>
						<div class="regdate">작성일</div>
						<div class="delete">삭제</div>
					</div>
				</div>
				<div class="comment-list">
					<div class="content-container">
						<div class="icon">아이콘</div>
						<div class="writer">작성자</div>
						<div class="report">신고</div>
						<div class="content">내용</div>
						<div class="regdate">작성일</div>
						<div class="delete">삭제</div>
					</div>
				</div>
				<div class="comment-list">
					<div class="content-container">
						<div class="icon">아이콘</div>
						<div class="writer">작성자</div>
						<div class="report">신고</div>
						<div class="content">내용</div>
						<div class="regdate">작성일</div>
						<div class="delete">삭제</div>
					</div>
				</div>
				<div class="comment-list">
					<div class="content-container">
						<div class="icon">아이콘</div>
						<div class="writer">작성자</div>
						<div class="report">신고</div>
						<div class="content">내용</div>
						<div class="regdate">작성일</div>
						<div class="delete">삭제</div>
					</div>
				</div>
				<div class="comment-list">
					<div class="content-container">
						<div class="icon">아이콘</div>
						<div class="writer">작성자</div>
						<div class="report">신고</div>
						<div class="content">내용</div>
						<div class="regdate">작성일</div>
						<div class="delete">삭제</div>
					</div>
				</div>
				
			</div>			
			<div class="comment-box2">
				<form action="" method="POST">
					<div class="comment-reg">
						<div class="content-container">
							<!-- <div class="writer">작성자</div> -->
							<textarea class="content" placeholder="내용을 입력하세요"></textarea>
							<div class="reg">등록</div>
						</div>
					</div>
				</form>
			</div>
		</section>
	</section>

</main>