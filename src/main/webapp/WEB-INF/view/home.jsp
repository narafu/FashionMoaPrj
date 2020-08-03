<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- 폰트 어썸 (아이콘) -->
<script src="https://kit.fontawesome.com/096073a2a8.js" crossorigin="anonymous"></script>

<main id="main">
  <section id="lookbook">
    <div class="section__container">
      <div class="lookbook__new">
        <img class="lookbook__img" src="/images/main/img1.jpg" alt="newlookbook" />
      </div>
    </div>
  </section>
  <section id="recommend">
    <div class="recommend__list section__container">
      <h3><a href="#">FashionLook</a></h3>
      <span><a href="#">더보기 &#10095;</a></span>
    </div>
    <div class="content__container">
      <c:forEach var="list1" items="${fashionLookList}">
        <div class="content">
          <img src="${list1.img}" />
          <span class="recommend__content">
            <a href="/board/fashionlook/${list1.id}"><i class="far fa-heart like"></i></a>
            <a href="/board/fashionlook/${list1.id}"><i class="far fa-comment"></i></a>
          </span>
        </div>
      </c:forEach>
    </div>
  </section>
  <section id="feedback">
    <div class="feedback__list section__container">
      <h3><a href="#">Feedback</a></h3>
      <span><a href="#">더보기 &#10095;</a></span>
    </div>
    <div class="content__container">
      <c:forEach var="list2" items="${styleFeedBackList}">
        <div class="content">
          <img src="${list2.img}" />
          <span class="recommend__content">
            <a href="/board/styleFeedback/${list2.id}"><i class="far fa-heart like"></i></a>
            <a href="/board/styleFeedback/${list2.id}"><i class="far fa-comment"></i></a>
          </span>
        </div>
      </c:forEach>
    </div>
  </section>
</main>