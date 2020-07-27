<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

<body>
    <h1 class="hidden">My Closet</h1>
    <div class="header-menu container">
        <div class="title">My Closet</div>
        <ul>
            <li>
                <a href="/home">LogOut</a>
            </li>
            <li>
                <a href="/home"><i class="fas fa-home fa-3x"></i></a>
            </li>
        </ul>
    </div>

    <section class="flex-center">
        <h1 class="hidden">cloth-menu</h1>
        <ul class="cloth-menu">
            <div class="top-menu flex-center">
                <li class="card cloth flex-center">
                    <i class="fas fa-tshirt fa-5x"></i>
                    <span class="sub-title">Outers</span>
                </li>
                <li class="card cloth flex-center">
                    <i class="fas fa-tshirt fa-5x"></i>
                    <span class="sub-title">Tops</span>
                </li>
                <li class="card cloth flex-center">
                    <i class="fas fa-tshirt fa-5x"></i>
                    <span class="sub-title">Bottoms</span>
                </li>
            </div>
            <div class="bottom-menu flex-center">
                <li class="card cloth flex-center">
                    <i class="fas fa-tshirt fa-5x"></i>
                    <span class="sub-title">Shoes</span>
                </li>
                <li class="card cloth flex-center">
                    <i class="fas fa-tshirt fa-5x"></i>
                    <span style="font-size:40px;" class="sub-title">Etc</span>
                </li>
                <li class="card register flex-center">
                    <i class="fas fa-plus fa-5x"></i>
                    <span class="sub-title">Register</span>
                </li>
            </div>
        </ul>
    </section>

    <section class="detail-cloth">
        <h1 class="hidden">detail-cloth</h1>
        <div class="detail cloth">
            <div class="flex-between" style="margin-top: -1px;">
                <div class="sub-title">Outers</div>
                <button type="submit">
                    <i class="fas fa-times fa-2x"></i>
                </button>
            </div>
            <div class="box-container"></div>
            <div class="pager flex-center">
                <div>
                    <i class="fas fa-arrow-left"></i>
                </div>
                <ul class="flex-center"></ul>
                <div>
                    <i class="fas fa-arrow-right"></i>
                </div>
            </div>
        </div>
    </section>

    <section class="detail-register">
        <h1 class="hidden">detail-register</h1>
        <form action="reg" method="POST" enctype="multipart/form-data">
            <div class="detail register">
                <div class="flex-between" style="margin-top: -1px;">
                    <div class="sub-title">register</div>
                    <div class="category">
                        <label for="">Outers</label>
                        <input type="radio" value="Outers" name="c">
                        <label for="">Tops</label>
                        <input type="radio" value="Tops" name="c">
                        <label for="">Bottoms</label>
                        <input type="radio" value="Bottoms" name="c">
                        <label for="">Shoes</label>
                        <input type="radio" value="Shoes" name="c">
                        <label for="">Etc</label>
                        <input type="radio" value="Etc" name="c">
                    </div>
                    <button type="submit">
                        <i class="fas fa-times fa-2x"></i>
                    </button>
                </div>
                <div class="box-container">
                    <c:forEach begin="1" end="6">
                        <div class="cloth-box flex-center">
                            <i class="fas fa-times fa"></i>
                            <img src="" alt="">
                            <input type="file" name="f">
                        </div>
                    </c:forEach>
                </div>
            </div>
        </form>
    </section>

    <script src="/js/member/mycloset/list.js"></script>
</body>

</html>