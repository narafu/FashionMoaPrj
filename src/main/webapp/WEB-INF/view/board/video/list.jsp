<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<main id="main">
	<h1 class="hidden">main</h1>
	<div class="container">

		<form action="list" method="get">
			<div class="top-btn flex-center">
				<div class="search-btn">
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

		<c:forEach begin="0" end="7">
			<div class="board-video">
				<div class="video-content flex-between">
					<div class="video-img">
						<a href="detail.html">
							<img src="/images/sample1.jpg" alt="">
						</a>
					</div>
					<div class="video-info flex-center">
						<div class="like-hate flex-evenly">
							<div>
								<i class="like far fa-thumbs-up"></i>
								<div>123</div>
							</div>
							<div>
								<i class="hate far fa-thumbs-down"></i>
								<div>456</div>
							</div>
						</div>
						<div class="flex-evenly">
							<span>조회수</span>
						<span>789</span>
						</div>
					</div>
				</div>
				<div class="video-title">
					<div class="channel-img">
						<a href=""><img src="/images/unnamed1.jpg" alt=""></a>
					</div>
					<a href="detail.html"> [ENG] ※🐶고생 재입고 완료※ 장성규 간만에 고생각?! 1+3 일거리 묶음 상품에 피
						땀 눈물💦 다 폭주했다는 마트 알바 리뷰 | 워크맨 ep.53 </a>
				</div>
				<div class="recommend-comment">
					<div>
						<span>Comment : </span>
						<span style="margin: 0px 10px;">/</span>
						<span>narafu 나라퓨</span>
					</div>
					<span>장성규가 대박 웃겨요~!! 장성규가 대박 웃겨요~!! 장성규가 대박 웃겨요~!! 장성규가 대박 웃겨요~!!</span>
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