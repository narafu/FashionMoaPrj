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
    <title>My Closet</title>
</head>

<body class="flex-center">
    <section id="mycloset">
        <h1 class="hidden">My Closet</h1>
        <div class="title">My Closet</div>
        
        <form method="post" enctype="multipart/form-data" action="/member/mycloset/list" >
            <div class="detail">
                <div class="flex-between">
                    <div class="sub-title">Outer</div>
                    <button type="submit">
                        <i class="fas fa-times fa-2x"></i>
                    </button>
                </div>
                <div class="box-container">
                    <c:forEach begin="1" end="6">
                        <div class="cloth-box flex-center">
                            <i class="fas fa-times fa"></i>
                            <img class="cloth-img" src="" alt="">
                            <input class="cloth-input" type="file">
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
            <input type="hidden" name="uid" value="narafu">
        </form>

        <ul class="cloth-menu">
            <div class="top-menu flex-center">
                <li class="card flex-center">
                    <i class="fas fa-tshirt fa-5x"></i>
                    <span class="sub-title">Outer</span>
                </li>
                <li class="card flex-center">
                    <i class="fas fa-tshirt fa-5x"></i>
                    <span class="sub-title">Tops</span>
                </li>
                <li class="card flex-center">
                    <i class="fas fa-tshirt fa-5x"></i>
                    <span class="sub-title">Bottoms</span>
                </li>
            </div>
            <div class="bottom-menu flex-center">
                <li class="card flex-center">
                    <i class="fas fa-tshirt fa-5x"></i>
                    <span class="sub-title">Shoes</span>
                </li>
                <li class="card flex-center">
                    <i class="fas fa-tshirt fa-5x"></i>
                    <span style="font-size:40px;" class="sub-title">Accessories</span>
                </li>
                <li class="card flex-center">
                    <i class="fas fa-tshirt fa-5x"></i>
                    <span class="sub-title">Etc</span>
                </li>
            </div>
        </ul>
    </section>
    
    <script src="/js/member/mycloset/list.js"></script>
</body>


</html>