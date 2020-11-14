<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/js/inc/header.js"></script>

<header id="header">
	<h1 class="hidden">header</h1>
	<div class="container flex-column">

		<div class="title-main">
			<a href="/home">FashionMoa</a>
		</div>
		
		<nav class="member-menu">
			<h1 class="hidden">member-menu</h1>
			<ul>
				<c:choose>
					<c:when test="${userId eq null}">
						<li class="login">
							<a href="https://kauth.kakao.com/oauth/authorize?client_id=8558c78e78ed8ede0d79e788ed66f359&redirect_uri=http://localhost:8080/member/login/kakao&response_type=code">
								<img src="/images/kakao_login_medium.png">
							</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="logout">
							<a href="/member/logout">LogOut</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>

		<nav class="header-menu">
			<h1 class="hidden">header-menu</h1>
			<ul class="flex-between">
				<li class="flex-center"><a href="/board/fashionlook/list"> <span class="text">Fashion<br />Look
						</span>
					</a></li>
				<li class="flex-center"><a href="/board/styleFeedback/list">
						<span class="text">Style<br />Feedback
						</span>
					</a></li>
				<li class="flex-center"><a href="/board/free/list"> <span class="text">Board</span>
					</a></li>
				<li class="flex-center">
					<c:choose>
						<c:when test="${userId eq null}">
							<span class="text" onclick="alert('로그인 후 이용할 수 있습니다.')" ;>My
								Closet</span>
						</c:when>
						<c:otherwise>
							<a href="/board/mycloset/list"> <span class="text">My
									Closet</span>
							</a>
						</c:otherwise>
					</c:choose>
				</li>
			</ul>
		</nav>
		
<%-- 		<div class="login-form">
			<div class="login-title">
				<span>Fashion</span>
				<span>Moa</span>
			</div>
			<div class="login-div">
				<div id="naver_id_login" style="text-align: center">
					<a href="${naverAuthUrl}">
						<img src="/images/naver_login.png" />
					</a>
				</div>
				<div id="kakao_id_login" style="text-align: center">
					<a
						href="https://kauth.kakao.com/oauth/authorize?client_id=8558c78e78ed8ede0d79e788ed66f359&redirect_uri=http://localhost:8080/member/login/kakao&response_type=code">
						<img src="/images/kakao_login.png" />
					</a>
				</div>
			</div>
		</div> --%>

	</div>
	<div class="login-container"></div>
	<script src="/js/inc/header.js"></script>
</header>