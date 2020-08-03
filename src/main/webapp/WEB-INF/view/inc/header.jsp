<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
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
			<a href="/home">Moa</a>
		</div>
		<nav class="header-menu">
			<h1 class="hidden">header-menu</h1>
			<ul class="flex-evenly">
				<li class="flex-center"><a href="/board/introlook/list"> <span
						class="text">Fashion<br />Look
					</span>
				</a></li>
				<li class="flex-center"><a href="/board/styleFeedback/list">
						<span class="text">Style<br />Feedback
					</span>
				</a></li>
				<li class="flex-center"><a href="/board/free/list"> <span
						class="text">Board</span>
				</a></li>
				<li class="flex-center"><c:choose>
						<c:when test="${userId eq null}">
							<span class="text" onclick="alert('로그인 후 이용할 수 있습니다.')";>My
								Closet</span>
						</c:when>
						<c:otherwise>
							<a href="/board/mycloset/list"> <span class="text">My
									Closet</span>
							</a>
						</c:otherwise>
					</c:choose></li>
			</ul>
		</nav>

		<nav class="member-menu">
			<h1 class="hidden">member-menu</h1>
			<ul>
				<c:choose>
					<c:when test="${userId eq null}">
						<li class="login"><a href="">Login</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/member/logout">Logout</a></li>
					</c:otherwise>
				</c:choose>
				<ul class="flex-center">
					<li><a href="/member/mycloset/list">MyPage</a></li>
					<li class="btn-login"><a href="/member/login">Login</a></li>
					<li class="btn-logout"><a href="/member/logout"
						onclick="return confirm('로그아웃 하시겠습니까?');">Logout</a></li>
				</ul>
		</nav>
	</div>
	<div class="login-container"></div>
	<script src="/js/inc/header.js"></script>
</header>