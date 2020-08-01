<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/js/board/styleFeedback/detail.js"></script>

<main id="main">
	<section id="feedback">
		<h2 class="feedback__title">${d.title }</h2>
		<div class="feedback__header">
			<div class="feedback__writer__container">
				<span class="feedback__writer">ID : ${d.writerId }</span>
			</div>
			<div class="feedback__writer__container">
				<span class="feedback__writer__date"> 
<%-- 					${n.regdate }  --%>
					<fmt:parseDate var="date" value="${d.regdate}" pattern="yyyy-MM-dd HH:mm" />
					<fmt:formatDate value="${date}" pattern="yyyy-MM-dd HH:mm" />
				</span>
				<span class="feedback__writer__count"> 조회수 : ${d.hit } </span>
				<span class="feedback__writer__modified"> <a href="edit?id=${d.id }">수정</a></span>
				<span class="feedback__writer__delete"> <a href="delete?id=${d.id }">삭제</a></span>
			</div>
		</div>
		<div class="feedback__container">
			<div class="feedback__detail">
				<div class="feedback__style">
					<h3>Style</h3>
						<div class="feedback__style__img">
							<img src="${d.img }" />
						</div>
				</div>
				<div class="feedback__clothes">
					<h3>착용상품</h3>
					<div class="feedback__clothes__img">
<!-- 						<img src="" alt="" /> -->
						<div class="items">아우터 캐러셀</div>
						<div class="items">상의 캐러셀</div>
						<div class="items">하의 캐러셀</div>
						<div class="items">신발 캐러셀</div>
						<div class="items">기타 캐러셀</div>
					</div>
				</div>
			</div>
			<div class="feedback__comment">
				<div class="feedback__writer__comment">
					<span class="feedback__writer__id">${d.writerId }</span>
					<span>${d.content }</span>
				</div>
					<div class="comment-list">
				<c:forEach var="cmt" items="${comment }">
						<div class="comment">
							<div class="comment-info">
								<div class="icon"></div>
								<div class="writer">${cmt.writerId }</div>
								<div class="report">신고</div>
								<div class="content">${cmt.content }</div>
								<div class="regdate">
									<fmt:parseDate var="date" value="${cmt.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
									<fmt:formatDate value="${date}" pattern="yyyy-MM-dd HH:mm" />
								</div>
								<div class="delete">삭제</div>
							</div>
						</div>
				</c:forEach>
					</div>
				<form action="${d.id }" method="post">
					<div class="feedback__member">
						<input class="feedback__member__comment" type="text" name="content" />
						<input type="hidden" value="정태다" name="writerId"/>
						<input type="hidden" value="${d.id }" name="id"/>
						<button class="member__register__comment">등록</button>
					</div>
				</form>
				
			</div>
		</div>
	</section>
</main>