<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/js/board/styleFeedback/detail.js"></script>

<!-- 폰트 어썸 (아이콘) -->
<script src="https://kit.fontawesome.com/096073a2a8.js"
	crossorigin="anonymous"></script>
<!-- 폰트 설정  -->
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap"
	rel="stylesheet" />

<main id="main">
	<section id="feedback">
		<h2 class="feedback__title">${d.title }</h2>
		<div class="feedback__header">
			<div class="feedback__writer__container">
				<span class="feedback__writer">ID : ${d.writerId }</span>
			</div>
			<div class="feedback__writer__container">
				<span class="feedback__writer__date"> <%-- 					${n.regdate }  --%>
					<fmt:parseDate var="date" value="${d.regdate}"
						pattern="yyyy-MM-dd HH:mm" /> <fmt:formatDate value="${date}"
						pattern="yyyy-MM-dd HH:mm" />
				</span> <span class="feedback__writer__count"> 조회수 : ${d.hit } </span> <span
					class="feedback__writer__modified"> <a
					href="edit?id=${d.id }">수정</a></span> <span
					class="feedback__writer__delete"> <a
					href="delete?id=${d.id }">삭제</a></span>
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
					<h3>My Wardrobe</h3>
					<div class="slideshow-container">
						<div class="mySlides1 fade">
							<img src="/images/detail/outer/outer1.jpg" style="width: 100%;" />
						</div>
						<div class="mySlides1 fade">
							<img src="/images/detail/outer/outer2.jpg" style="width: 100%;" />
						</div>
						<div class="mySlides1 fade">
							<img src="/images/detail/outer/outer3.jpg" style="width: 100%;" />
						</div>
						<a class="prev" onclick="plusSlides1(-1)">&#10094;</a> <a
							class="next" onclick="plusSlides1(1)">&#10095;</a>
					</div>
					<div class="slideshow-container">
						<div class="mySlides2 fade">
							<img src="/images/detail/top/top1.jpg" style="width: 100%;" />
						</div>
						<div class="mySlides2 fade">
							<img src="/images/detail/top/top2.jpg" style="width: 100%;" />
						</div>
						<div class="mySlides2 fade">
							<img src="/images/detail/top/top3.jpg" style="width: 100%;" />
						</div>
						<div class="mySlides2 fade">
							<img src="/images/detail/top/top4.jpg" style="width: 100%;" />
						</div>
						<a class="prev" onclick="plusSlides2(-1)">&#10094;</a> <a
							class="next" onclick="plusSlides2(1)">&#10095;</a>
					</div>
					<div class="slideshow-container">
						<div class="mySlides3 fade">
							<img src="/images/detail/pants/pants1.jpg" style="width: 100%;" />
						</div>
						<div class="mySlides3 fade">
							<img src="/images/detail/pants/pants2.jpg" style="width: 100%;" />
						</div>
						<a class="prev" onclick="plusSlides3(-1)">&#10094;</a> <a
							class="next" onclick="plusSlides3(1)">&#10095;</a>
					</div>
					<div class="slideshow-container">
						<div class="mySlides4 fade">
							<img src="/images/detail/shoes/shoes1.jpg" style="width: 100%;" />
						</div>
						<div class="mySlides4 fade">
							<img src="/images/detail/shoes/shoes2.jpg" style="width: 100%;" />
						</div>
						<div class="mySlides4 fade">
							<img src="/images/detail/shoes/shoes3.jpg" style="width: 100%;" />
						</div>
						<a class="prev" onclick="plusSlides4(-1)">&#10094;</a> <a
							class="next" onclick="plusSlides4(1)">&#10095;</a>
					</div>
					<div class="slideshow-container">
						<div class="mySlides5 fade">
							<img src="/images/detail/watch/watch1.jpg" style="width: 100%;" />
						</div>
						<div class="mySlides5 fade">
							<img src="/images/detail/watch/watch2.jpg" style="width: 100%;" />
						</div>
						<div class="mySlides5 fade">
							<img src="/images/detail/watch/watch3.jpg" style="width: 100%;" />
						</div>
						<a class="prev" onclick="plusSlides5(-1)">&#10094;</a> <a
							class="next" onclick="plusSlides5(1)">&#10095;</a>
					</div>
				</div>
			</div>
			<div class="feedback__comment">
				<div class="feedback__writer__comment">
					<span class="feedback__writer__id">${d.writerId }</span> <span>${d.content }</span>
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
									<fmt:parseDate var="date" value="${cmt.regdate}"
										pattern="yyyy-MM-dd HH:mm:ss" />
									<fmt:formatDate value="${date}" pattern="yyyy-MM-dd HH:mm" />
								</div>
								<div class="delete">삭제</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<form action="${d.id }" method="post">
					<div class="feedback__member">
						<input class="feedback__member__comment" type="text"
							name="content" /> <input type="hidden" value="정태다"
							name="writerId" /> <input type="hidden" value="${d.id }"
							name="id" /> <input type="hidden" value="${regdate }"
							name="regdate" />
						<button class="member__register__comment">등록</button>
					</div>
				</form>

			</div>
		</div>
	</section>
</main>