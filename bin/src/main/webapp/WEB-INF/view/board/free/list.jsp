<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<main id="board-main">
	<section class="board-container">
		<div class="board-header">
			<div class="board-title">
				<h1 >자유게시판</h1>
			</div>
			<div class="search">
				<div>
					<form class="search-form">
						<fieldset>
							<legend class="hidden">문의사항 검색필드</legend>


							<label class="hidden">검색분류</label>
								<select name="f">
								<option ${(param.f == "title")?"selected":"" } value="title">제목</option>
								<option ${(param.f == "content")?"selected":"" } value="content">내용</option>
								<option ${(param.f == "nickname")?"selected":"" } value="nickname">작성자</option>
							</select>
							
							<label class="hidden">검색어</label>
								<input class="search-text"type="text" name="q" placeholder="검색어를 입력하세요">
								<input class="search-button" type="submit" value="검색">
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	
		<section class="board-body">
			<div class="list">
			<form action="list" method="post">
				<h1 class="hidden">게시글 목록</h1>
				<table class="table">
					<thead class="thead">
						<tr>
							<th class="col-num">번호</th>
							<th class="col-exp">제목</th>
							<th class="col-text">작성자</th>
							<th class="col-num">조회수</th>
							<th class="col-date">작성일</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="brd" items="${list }" varStatus="st">
							<c:set var="open" value="" />

							<tr>
								<td>${brd.id }</td>
								<td class="title"><a href="detail/${brd.id}">${brd.title }</a><span style="color:red;">&nbsp;&nbsp; [${brd.cmtCount }]</span></td>
								<td>${brd.email }</td>
								<td>${brd.hit }</td>
								<td><fmt:formatDate value="${brd.regdate}" pattern="yyyy-MM-dd HH:mm" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
<!--------------------------- 하단 부분 ---------------------->

			</form>

<c:set var="page" value="${ (empty param.p) ? 1:param.p }" />
	<c:set var="startNum" value="${page-(page-1)%5 }" />
	<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/10),'.')}" />

<div class="under-box">
	<div class="indexer-box">
		<h1 class="hidden">현재 페이지</h1>
		<div>
			<span class="index-num"><b>${(empty param.p)? 1:param.p}</b></span> / ${lastNum }
			pages
		</div>
	</div>


	<div class="pager-box">
		<div class="prev-box">
			<c:if test="${startNum-1>0 }">
				<a class="prev" href="?p=${startNum-1}&f=${param.f }&q=${param.q}"><i
					class="fas fa-angle-left"></i></a>
			</c:if>
			<c:if test="${startNum-1<=0 }">
				<i class="fas fa-angle-left" onclick="alert('이전 페이지가 없습니다.')"></i>
			</c:if>
		</div>


		<ul class="pager">
			<c:forEach var="i" begin="0" end="4">
				<c:if test="${(startNum+i) <= lastNum }">
					<li class="pager-item"><a
						class="pager-num ${(page==(startNum+i)) ? 'orange' : ''  }"
						href="?p=${startNum+i}&f=${param.f }&q=${param.q}">${startNum+i}</a></li>
				</c:if>
			</c:forEach>
		</ul>

		<div class="next-box">
			<c:if test="${startNum+5<=lastNum }">
				<a class="next" href="?p=${startNum+5}&f=${param.f }&q=${param.q}"><i
					class="fas fa-angle-right"></i></a>
			</c:if>
			<c:if test="${startNum+5>=lastNum }">
				<i class="fas fa-angle-right" onclick="alert('다음 페이지가 없습니다.')"></i>
			</c:if>
		</div>

	</div>
					<section class="write">
					<h1 class="hidden">글쓰기</h1>
					<div>
						
					<c:choose>
						<c:when test="${userId eq null}">
							<a class="context-write" onclick="alert('로그인 후 이용할 수 있습니다.')";>글쓰기</a>
						</c:when>
						<c:otherwise>
							<a class="context-write" href="reg">글쓰기</a>
						</c:otherwise>
					</c:choose>
						
					</div>
				</section>
				</div>
				
				
		</div>
		</section>
		
	</section>
</main>