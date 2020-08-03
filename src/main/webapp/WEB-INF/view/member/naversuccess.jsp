<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript"
    src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
    charset="utf-8"></script>
<script type="text/javascript"
    src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var nickname = ${result}.response.nickname;
		var email = ${result}.response.email;
		$("#nickname").html("환영합니다. "+nickname+"님");
		$("#email").html(email);
	  });
</script>

</head>
<main>

	<br>
	<h2 style="text-align: center" id="nickname"></h2>
	<h4 style="text-align: center" id="email"></h4>
	<div style="text-align: center"><a href="main">홈으로</a></div>
</main>
