<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/49d3a7e676.js"
	crossorigin="anonymous"></script>
<link href='<tiles:getAsString name="css"/>' type="text/css" rel="stylesheet" />	
<title>Moa</title>
</head>

<body>

	<tiles:insertAttribute name="header" />

	<tiles:insertAttribute name="main" />

	<tiles:insertAttribute name="footer" />

</body>

</html>