<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/49d3a7e676.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
<link href='<tiles:getAsString name="css"/>' type="text/css" rel="stylesheet" />
<title>Fashion Moa - 국내 원탑 패션 커뮤니티 </title>
</head>

<body>

	<tiles:insertAttribute name="header" />

	<tiles:insertAttribute name="main" />

	<tiles:insertAttribute name="footer" />

</body>

</html>