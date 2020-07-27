<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<main id="board-main">

	<div class="board-post">
	
	<section class="board-container">
		<form action="reg" method="post">
				<h1 class="hidden">공지사항 입력</h1>
				<table class="post-table">
					<tbody>
						<tr class="border-bottom-bdbdbd text-center">
							<td class="title">제목</td>
							<td colspan="3"><input class="title-input" type="text"
								name="title" placeholder="제목을 입력하세요" /></td>
						</tr>

						<tr class="text-center">
							<td class="writer">작성자</td>
							<td class="w180 h30">
							<input type="hidden" name="uid" value="admin">
								admin</td>
								<!--value="${sessionScope.uid }">${sessionScope.nickname }</td>  -->
							<td class="regdate">작성일</td>
							<td class="w180 h30">${regdate}</td>
						</tr>
						<tr>
							<td><input multiple="multiple" type="file" class="d-none btn-file"></td>
						</tr>
						<tr>
							<td colspan="4"><textarea class="content-area"
									name="content" placeholder="내용을 입력하세요"></textarea></td>
						</tr>
					</tbody>
				</table>
			<div class="post-btn">
				<input type="submit" value="등록" /> <a href="list">취소</a>
			</div>
		</form>
			</section>
	</div>

</main>
