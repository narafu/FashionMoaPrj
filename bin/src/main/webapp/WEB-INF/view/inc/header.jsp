<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<header id="header">
	<h1 class="hidden">header</h1>
	<div class="container flex-between">
		<div class="title-main">
			<a href="/main">Moa</a>
		</div>
		<nav class="header-menu">
			<h1 class="hidden">header-menu</h1>
			<ul class="flex-evenly">
				<li class="flex-center">
					<a href="/board/introlook/list">
						<span class="text">Fashion<br/>Look</span>
					</a>
				</li>
				<li class="flex-center">
					<a href="/board/styleFeedback/list">
						<span class="text">Style<br/>Feedback</span>
					</a>
				</li>
				<li class="flex-center">
					<a href="/board/free/list">
						<span class="text">Board</span>
					</a>
				</li>
				<li class="flex-center">
					<a href="/board/mycloset/list">
						<span class="text">My Closet</span>
					</a>
				</li>
			</ul>
		</nav>
		<nav class="member-menu">
			<h1 class="hidden">member-menu</h1>
			<ul class="flex-center">
				<li><a href="/member/mycloset/list">MyPage</a></li>
				<li><a href="/member/login">Login</a></li>
			</ul>
		</nav>
	</div>
	<script src="/inc/header.js"></script>
</header>