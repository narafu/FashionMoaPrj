
$(function () {

    let mycloset = $("#mycloset");
    let clothMenu = $(".cloth-menu");
    let outer = $(".outer");
    let detail = $(".detail");

    outer.click(function () {
        detail.toggle();
    });

    let insert = $(".fa-plus");
    let closetImg = $(".detail img");

    insert.click(function (e) {
        if (confirm("옷장을 추가하시겠습니까?")) {
            e.target.remove();
        }
    });

    let times = $(".fa-times");
    times.click(function () {
        detail.toggle(500);
    });


});