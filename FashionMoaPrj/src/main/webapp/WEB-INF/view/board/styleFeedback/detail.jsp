<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
				<span class="feedback__writer">ID: ${d.writerId }</span>
			</div>
			<div class="feedback__writer__container">
				<span class="feedback__writer__date"> <fmt:parseDate
						var="date" value="${d.regdate}" pattern="yyyy-MM-dd HH:mm" /> <fmt:formatDate
						value="${date}" pattern="yyyy-MM-dd HH:mm" />
				</span> <span class="feedback__writer__count"> 조회수: ${d.hit +1} </span> 
				<c:choose>
					<c:when test="${userId eq d.writerId }">
						<span class="feedback__writer__modified"> <a href="edit?id=${d.id }">수정</a></span>
						<span class="feedback__writer__delete"> <a href="delete?id=${d.id }">삭제</a></span>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="feedback__container">
			<div class="feedback__detail">
				<div class="feedback__style">
					<h3>Style</h3>
					<div class="feedback__style__img">
						<img src="${d.img }" alt="feedback" style="height: 100%;"/>
					</div>
				</div>
				<div class="feedback__clothes">
					<span><a href="#">My Wardrobe</a></span>
					<div class="slideshow-container">
						<c:forEach var="outer" items="${outer }">
							<div class="mySlides1 fade">
								<img src="${outer.img }" style="width: 100%;" />
							</div>
						</c:forEach>
						<a class="prev" onclick="plusSlides1(-1)">&#10094;</a> <a
							class="next" onclick="plusSlides1(1)">&#10095;</a>
					</div>
					<div class="slideshow-container">
						<c:forEach var="top" items="${top }">
							<div class="mySlides2 fade">
								<img src="${top.img }" style="width: 100%;" />
							</div>
						</c:forEach>
						<a class="prev" onclick="plusSlides2(-1)">&#10094;</a> <a
							class="next" onclick="plusSlides2(1)">&#10095;</a>
					</div>
					<div class="slideshow-container">
						<c:forEach var="bottom" items="${bottom }">
							<div class="mySlides3 fade">
								<img src="${bottom.img }" style="width: 100%;" />
							</div>
						</c:forEach>
						<a class="prev" onclick="plusSlides3(-1)">&#10094;</a> <a
							class="next" onclick="plusSlides3(1)">&#10095;</a>
					</div>
					<div class="slideshow-container">
						<c:forEach var="shoe" items="${shoe }">
							<div class="mySlides4 fade">
								<img src="${shoe.img }" style="width: 100%;" />
							</div>
						</c:forEach>
						<a class="prev" onclick="plusSlides4(-1)">&#10094;</a> <a
							class="next" onclick="plusSlides4(1)">&#10095;</a>
					</div>
					<div class="slideshow-container">
						<c:forEach var="etc" items="${etc }">
							<div class="mySlides5 fade">
								<img src="${etc.img }" style="width: 100%;" />
							</div>
						</c:forEach>
						<a class="prev" onclick="plusSlides5(-1)">&#10094;</a> <a
							class="next" onclick="plusSlides5(1)">&#10095;</a>
					</div>
				</div>
			</div>
			<div class="feedback__comment">
				<div class="feedback__writer__comment">
					<span class="feedback__writer__id">${d.writerId }</span>
					${d.content }
				</div>
				<div class="comment-list">
					<c:forEach var="cmt" items="${comment }">
						<form action="cmtDelete" method="get">
							<div class="comment">
								<div class="comment-info">
									<div class="icon"></div>
									<div class="writer">${cmt.writerId }</div>
									<div class="report"></div>
									<div class="content">${cmt.content }</div>
									<div class="regdate">
										<fmt:parseDate var="date" value="${cmt.regdate}"
											pattern="yyyy-MM-dd HH:mm:ss" />
										<fmt:formatDate value="${date}" pattern="yyyy-MM-dd HH:mm" />
									</div>
									<input type="hidden" name="boardId" value="${d.id }">
									<input type="hidden" name="cmtId" value="${cmt.id }">
									<button type="submit" value="삭제" class="delete"><i class="fas fa-trash"></i></button>
								</div>
							</div>
						</form>
					</c:forEach>
				</div>
				<form action="${d.id }" method="post">
					<div class="feedback__member">
						<input class="feedback__member__comment" type="text"
							name="content" /> <input type="hidden" value="${sessionScope.userId }"
							name="writerId" /> <input type="hidden" value="${d.id }"
							name="id" /> <input type="hidden" value="${regdate }"
							name="regdate" />
						<button class="member__register__comment"><i class="fas fa-paper-plane"></i></button>
					</div>
				</form>
			</div>
		</div>
	</section>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="/js/board/styleFeedback/detail.js"></script>
</main>