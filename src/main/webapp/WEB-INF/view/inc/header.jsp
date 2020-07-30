<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<script type="text/javascript"
    src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
    charset="utf-8"></script>
<script type="text/javascript"
    src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/js/inc/header.js"></script>

<header id="header">
	<h1 class="hidden">header</h1>
	<div class="container flex-between">
		<div class="title-main">
			<a href="/main">Moa</a>
		</div>
		<nav class="header-menu">
			<h1 class="hidden">header-menu</h1>
			<ul class="flex-center">
				<li class="hexagon-wrapper">
					<div class="hexagon flex-center">
						<a href="/board/video/list">
							<div class="text">Video</div>
						</a>
					</div>
				</li>
					<li class="hexagon-wrapper">
					<div class="hexagon flex-center">
						<a href="/board/introlook/list">
							<div class="text">FASHION LOOK</div>
						</a>
					</div>
				</li>
				<li class="hexagon-wrapper">
					<div class="hexagon flex-center">
						<a href="/board/playlist/list">
							<div class="text">PlayList</div>
						</a>
					</div>
				</li>
				<li class="hexagon-wrapper">
					<div class="hexagon flex-center">
						<a href="/board/free/list">
							<div class="text">자유게시판</div>
						</a>
					</div>
				</li>
				<li class="hexagon-wrapper">
					<div class="hexagon flex-center">
						<a href="/board/channel/list">
							<div class="text">Channel</div>
						</a>
					</div>
				</li>
				<li class="hexagon-wrapper">
					<div class="hexagon flex-center">
						<a href="/board/ranking/list">
							<div class="text">Ranking</div>
						</a>
					</div>
				</li>
			</ul>

		</nav>
		<nav class="member-menu">
			<h1 class="hidden">member-menu</h1>
			<ul class="flex-center">
				<li><a href="/member/mycloset/list">MyPage</a></li>
						<li class="btn-login"><a href="/member/login">Login</a></li>
					
						<li class="btn-logout"><a href="/member/logout" onclick="return confirm('로그아웃 하시겠습니까?');">Logout</a></li>
			</ul>
		</nav>
	</div>
</header>