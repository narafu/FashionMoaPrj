<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<main id="main">
	<h1 class="hidden">main</h1>
	<div class="container">
		<div class="container-table">
			<form action="edit" method="post" enctype="multipart/form-data">
				<table class="reg-table">
					<thead>
						<tr>
							<td>제목</td>
							<td><input type="text" name="title" placeholder="제목을 입력하세요" value="${e.title }"></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input type="hidden" name="writerId" value="정태다">${e.writerId }</td>
						</tr>
						<tr>
							<td>수정일</td>
							<td>
<%-- 								${regdate} --%>
								<fmt:parseDate var="date" value="${e.regdate}" pattern="yyyy-MM-dd HH:mm" />
								<fmt:formatDate value="${date}" pattern="yyyy-MM-dd HH:mm" />
							</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="padding-b-unset">수정 전 이미지 </td>
							<td class="padding-b-unset">${img }</td>
						</tr>
						<tr>
							<td class="padding-b-unset">수정 이미지</td>
							<td class="padding-b-unset"><input type="file" name="img"></td>
						</tr>
						<tr>
							<td colspan="6">
								<div>
									<textarea name="content" cols="30" rows="15" placeholder="내용을 입력하세요">${e.content }</textarea>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="bottom-btn flex-center">
					<input type="submit" value="Confirm">
					<a href="${e.id }">
						<input type="button" value="Cancle">
					</a>
				</div>
			</form>
		</div>
	</div>
</main>