<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
    src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
    charset="utf-8"></script>
<script type="text/javascript"
    src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
<%-- var sessionUId = "<%=session.getAttribute("userId") %>"
console.log('sessionUId'); --%>

</script>

<main id="board-main">
	
	<section class="board-container">
		<form action="reg" method="post" enctype="multipart/form-data">
				<h1 class="hidden">공지사항 입력</h1>
				<table class="post-table">
					<tbody>
						<tr class="border-bottom-bdbdbd text-center">
							<td class="title">제목</td>
							<td colspan="3"><input class="title-input" type="text"
								name="title" placeholder="제목을 입력하세요" /></td>
						</tr>
						
						<tr class="border-bottom-bdbdbd text-center">
							<td class="writer">작성자</td>
							<td class="w180 h30">${sessionScope.userId}</td>
							<td><input type="hidden" id=email name="email" value="${sessionScope.userId}">
							</td>
						</tr>
						<tr class="text-center">
							<td class="w180 h30">
							<td class="w180 h30">${regdate}</td>
						</tr>
						<tr><th>첨부파일</th>
							<td><input multiple="multiple" type="file" name="files" class="d-none btn-file" /></td>
						</tr>
						<tr>
							<td colspan="4"><textarea class="content-area"
									name="content" placeholder="내용을 입력하세요"></textarea></td>
						</tr>
					</tbody>
				</table>
			<div class="post-btn">
				<input class="btn-input" type="submit" onclick="return confirm('등록 하겠습니까?');" value="등록" /> <a class="btn-cancel" href="list">취소</a>
			</div>
		</form>
	</section>

</main>
