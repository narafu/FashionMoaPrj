<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

    <main id="main">
        <h1 class="hidden">main</h1>
        <div class="container">

            <div class="container-table">

                <form action="reg" method="post">
                    <table class="reg-table">
                        <thead>
                            <tr>
                                <th>작성일</th>
                                <td>${regdate}</td>
                                <input type="hidden" name="regdate">
                            </tr>
                            <tr>
                                <th>작성자</th>
                                <td>${uid}</td>
                                <input type="hidden" name="uid">
                            </tr>
                            <tr>
                                <th><img src="/images/youtube.png" alt=""></th>
                                <td>
                                    <input type="text" name="title" id="">
                                    <input type="submit" value="&#xf002">
                                </td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="6">
                                    <div>
                                        <textarea name="content" id="" cols="30" rows="15"></textarea>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="bottom-btn flex-center">
                        <input type="submit" value="Confirm">
                        <a href="list">
                            <input type="button" value="Cancle">
                        </a>
                    </div>
                </form>
            </div>

        </div>
    </main>