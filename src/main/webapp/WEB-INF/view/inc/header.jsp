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
			<ul class="flex-center">
				<li class="hexagon-wrapper">
					<div class="hexagon flex-center">
						<a href="/board/introlook/list">
							<div class="text">FASHION LOOK</div>
						</a>
					</div>
				</li>
				<li class="hexagon-wrapper">
					<div class="hexagon flex-center">
						<a href="/board/free/list">
							<div class="text">BOARD</div>
						</a>
					</div>
				</li>
				<li class="hexagon-wrapper">
					<div class="hexagon flex-center">
						<a href="/board/styleFeedback/list">
							<div class="text">StyleFeedback</div>
						</a>
					</div>
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
</header>