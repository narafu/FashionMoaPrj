<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/member/mycloset/list.css">
    <script src="https://kit.fontawesome.com/49d3a7e676.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/js/member/mycloset/list.js"></script>
    <title>My Closet</title>
</head>

<body class="flex-center">
    <section id="mycloset">
        <h1 class="hidden">My Closet</h1>
        <div class="title">My Closet</div>

        <div class="detail">
            <div class="flex-between">
                <div class="sub-title">Outer</div>
                <i class="fas fa-times fa-2x"></i>
            </div>
            <div class="box-container">
                <c:forEach begin="1" end="6">
                    <div class="cloth-box flex-center">
                        <i class="fas fa-plus fa-5x"></i>
                    </div>
                </c:forEach>
            </div>
            <div class="pager">
                <ul class="flex-evenly">
                    <li>
                        <i class="fas fa-arrow-left" onclick="alert('이전 페이지가 없습니다.');"></i>
                    </li>
                    <c:forEach var="i" begin="1" end="5">
                        <li>${i}</li>
                    </c:forEach>
                    <li>
                        <i class="fas fa-arrow-right" onclick="alert('다음 페이지가 없습니다.');"></i>
                    </li>
                </ul>
            </div>
        </div>

        <ul class="cloth-menu">
            <div class="top-menu flex-center">
                <li class="card outer flex-center">
                    <i class="fas fa-tshirt fa-5x"></i>
                    <span>Outer</span>
                </li>
                <li class="card flex-center">
                    <i class="fas fa-tshirt fa-5x"></i>
                    <span>Tops</span>
                </li>
                <li class="card flex-center">
                    <i class="fas fa-tshirt fa-5x"></i>
                    <span>Bottoms</span>
                </li>
            </div>
            <div class="bottom-menu flex-center">
                <li class="card flex-center">
                    <i class="fas fa-tshirt fa-5x"></i>
                    <span>Shoes</span>
                </li>
                <li class="card flex-center">
                    <i class="fas fa-tshirt fa-5x"></i>
                    <span style="font-size:40px;">Accessories</span>
                </li>
                <li class="card flex-center">
                    <i class="fas fa-tshirt fa-5x"></i>
                    <span>Etc</span>
                </li>
            </div>
        </ul>
    </section>
</body>

</html>