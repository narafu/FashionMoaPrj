<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- <script src="/js/board/styleFeedback/list.js"></script> -->

<main id="main">
	<h1 class="hidden">main</h1>
	<div class="container">

		<form action="list" method="get">
			<div class="top-btn flex-center">
				<div class="search-btn">
				<select name="f">
					<option ${(param.f == "title")?"selected":"" } value="title">제목</option>
					<option ${(param.f == "content")?"selected":"" } value="content">내용</option>
				</select> 
					<input type="text" name="q" placeholder="검색어를 입력하세요">
					<input type="submit" value="&#xf002">
				</div>
           		<c:choose>
					<c:when test="${userId eq null}">
						<div class="btn-reg">
							<span onclick="alert('로그인 후 이용할 수 있습니다.')";><a href="">Write</a></span>
						</div>
					</c:when>
					<c:otherwise>
						<div class="btn-reg">
							<a href="reg">Write</a>
						</div>
					</c:otherwise>
				</c:choose>
<!--            		<div class="btn-reg"> -->
<!-- 					<a href="reg">Write</a> -->
<!-- 				</div> -->
			</div>
		</form>
		
		<section class="board-container flex-between">		
			<h1 class="hidden">board</h1>

		<c:forEach var="n" items="${list }">
				<div class="board-channel">
					<div class="channel-img">
						<a href="${n.id }"> <img src="${n.img }" class="img">
						</a>
					</div>
					<div class="channel-content flex-between">
<%-- 						<a href="${n.id }"> --%>
							<div class="title">
								<div class=title-content>
									<!-- 						<span style="margin: 0px 10px;">/</span> -->
									<span class="img-title">${n.title }</span>
								</div>
								<span class="content">${n.content }</span>
							</div>
<!-- 						</a> -->
						<div class="channel-info">
							<div>
								<span class="info-writer">작성자 : </span> <span class="info-writer"> ${n.writerId }</span>
							</div>
							<div>
								<span class="info-hit">조회수 :</span> <span class="info-hit">${n.hit }</span>
							</div>
							<div>
								<span class="info-date">작성일 :</span> 
								<span class="info-date">
									<fmt:parseDate var="date" value="${n.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
									<fmt:formatDate value="${date}" pattern="yyyy-MM-dd HH:mm" />
								</span>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		
		</section>
		<div>
			<c:set var="page" value="${(empty param.p)?1:param.p }" />
			<c:set var="startNum" value="${page-(page-1)%5 }" />
			<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/10), '.')}" />
		
			<div class="page-num">
				<c:forEach var="i" begin="0" end="${lastNum }">
				<c:if test="${(startNum+i) == page }">
					<span class="current"> ${startNum+i } </span>
				</c:if>
				</c:forEach>
				<span> / </span>
				<span> ${lastNum} </span>
				<span>pages</span>
			</div>
	
			<div class="pager">
				<ul class="flex-evenly">
					<li>
						<a href=""> 
							<i class="fas fa-arrow-left" onclick="alert('이전 페이지가 없습니다.');"></i>
						</a>
					</li>
					
					<c:forEach var="i" begin="0" end="4">
						<c:if test="${(startNum+i) <= lastNum }">
							<li>
								<a class="${(page==(startNum+i))?'text-highlight':'' }"
									href="?p=${startNum+i }&f=&q=">
									${startNum+i }
								</a>
							</li>
						</c:if>
					</c:forEach>
					
					<li>
						<a href=""> 
							<i class="fas fa-arrow-right" onclick="alert('다음 페이지가 없습니다.');"></i>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>

</main>

