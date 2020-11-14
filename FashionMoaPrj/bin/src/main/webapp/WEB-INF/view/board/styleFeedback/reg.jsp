<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<main id="main">
	<h1 class="hidden">main</h1>
	<div class="container">
		<div class="container-table">
			<form action="reg" method="post" enctype="multipart/form-data">
				<table class="reg-table">
					<thead>
						<tr>
							<td>제목</td>
							<td><input type="text" name="title" placeholder="제목을 입력하세요"></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input type="hidden" name="writerId" value="${sessionScope.userId}">${sessionScope.userId}</td>
						</tr>
						<tr>
							<td>작성일</td>
							<td>
<%-- 								${regdate} --%>
								<fmt:parseDate var="date" value="${regdate}" pattern="yyyy-MM-dd HH:mm" />
								<fmt:formatDate value="${date}" pattern="yyyy-MM-dd HH:mm" />
							</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="padding-b-unset">코디 사진</td>
							<td class="padding-b-unset"><input type="file" name="img"></td>
						</tr>
						<tr>
							<td colspan="6">
								<div>
									<textarea name="content" cols="30" rows="15" placeholder="내용을 입력하세요"></textarea>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="bottom-btn flex-center">
					<input type="submit" value="Confirm"> <a href="list"> <input
						type="button" value="Cancle">
					</a>
				</div>
			</form>
		</div>
	</div>
</main>