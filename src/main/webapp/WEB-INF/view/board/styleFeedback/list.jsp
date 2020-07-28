<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/js/board/styleFeedback/list.js"></script>

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
					<input type="text" name="s" value="">
					<input type="submit" value="&#xf002">
				</div>
           		<div class="btn-reg">
					<a href="reg">Write</a>
				</div>
			</div>
		</form>
		
		<section class="board-container flex-between">		
			<h1 class="hidden">board</h1>

		<c:forEach var="n" items="${list }">
				<div class="board-channel">
					<div class="channel-img">
						<a href="detail"> <img src="/images/unnamed1.jpg" alt="">
						</a>
					</div>
					<div class="channel-content flex-between">
						<a href="detail">
							<div class="title">
								<div>
									<span>제목 : </span>
									<!-- 						<span style="margin: 0px 10px;">/</span> -->
									<span>${n.title }</span>
								</div>
								<span>${n.content }</span>
							</div>
						</a>
						<div class="channel-info">
							<div>
								<span>작성자 :</span> <span>${n.nickName }</span>
							</div>
							<div>
								<span>조회수 :</span> <span>${n.hit }</span>
							</div>
							<div>
								<span>작성일 :</span> <span>${n.regdate }</span>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		
		</section>

		<div class="page-num">
			<span class="current"> 1 </span>
			<span> / </span>
			<span> 1 </span>
			<span>pages</span>
		</div>

		<div class="pager">
			<ul class="flex-evenly">
				<li><a href=""> <i class="fas fa-arrow-left"
						onclick="alert('이전 페이지가 없습니다.');"></i>
				</a></li>
				<li><a class="" href="">1</a></li>
				<li><a class="" href="">2</a></li>
				<li><a class="" href="">3</a></li>
				<li><a class="" href="">4</a></li>
				<li><a class="" href="">5</a></li>
				<li><a class="" href="">6</a></li>
				<li><a class="" href="">7</a></li>
				<li><a class="" href="">8</a></li>
				<li><a class="" href="">9</a></li>
				<li><a class="" href="">10</a></li>
				<li><a href=""> <i class="fas fa-arrow-right"
						onclick="alert('다음 페이지가 없습니다.');"></i>
				</a></li>
			</ul>
		</div>
	</div>

</main>

