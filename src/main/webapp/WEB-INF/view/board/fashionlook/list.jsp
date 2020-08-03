<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<script src="/js/board/fashionlook/list.js"></script>
<main id="main">
  <h1 class="hidden">Fashion Look</h1>
  <div class="container">
    <section class="board-container flex-between">
      <h1 class="hidden">board</h1>

      <c:forEach var="l" items="${list}">
        <div class="thumbnail-wrapper">
          <div class="channel-content flex-between thumbnail">
            <div class="thumbnail-centered">
              <img src="${l.img}" alt="fashion look" class="thumbnail-img" id="${l.id}" />
            </div>
          </div>
        </div>
      </c:forEach>

      <div class="flex-between fashion-detail"></div>

    </section>
  </div>
</main>