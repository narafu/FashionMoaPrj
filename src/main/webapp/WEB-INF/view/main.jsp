<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/49d3a7e676.js"
	crossorigin="anonymous"></script>
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/main.css">
<title>main</title>
</head>

<body class="flex-center">
	<h1 class="hidden">main-page</h1>
	<div class="container">
		<section class="title flex-center">
			<h1 class="hidden">main-title</h1>
			<div>
				<div>Recommend</div>
				<div>YoutubeMoa</div>
			</div>
			<div>
				<i class="fab fa-youtube fa-3x"></i>
			</div>
		</section>
		<nav class="main-menu">
			<h1 class="hidden">main-menu</h1>
			<ul class="flex-center">
				<li class="hexagon-wrapper">
					<div class="hexagon flex-center">
						<a href="board/video/list"> <i class="fas fa-video"></i>
							<div class="text">Video</div>
						</a>
					</div>
				</li>
				<li class="hexagon-wrapper">
					<div class="hexagon flex-center">
						<a href="board/playlist/list"> <i class="far fa-list-alt"></i>
							<div class="text">PlayList</div>
						</a>
					</div>
				</li>
				<li class="hexagon-wrapper">
					<div class="hexagon flex-center">
						<a href="board/channel/list"> <i class="fas fa-user-circle"></i>
							<div class="text">Channel</div>
						</a>
					</div>
				</li>
				<li class="hexagon-wrapper">
					<div class="hexagon flex-center">
						<a href="board/ranking/list"> <i class="fas fa-list-ol"></i>
							<div class="text">List</div>
						</a>
					</div>
				</li>
			</ul>
		</nav>
	</div>

</body>

</html>