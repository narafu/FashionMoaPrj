$(function () {

    // detail toggle
    let subTitle;
    let subTitleColor;
    $(".card").click(function (e) {
        subTitle = $(this).find("span").text();
        subTitleColor = $(e.target).parents("li").css("background-color");
        $(".detail .sub-title").text(subTitle);
        $(".detail .sub-title").css("background-color", subTitleColor);
        $(".detail").toggle(500);
    });

    // detail 나가기
    $(".detail button .fa-times").click(function () {
        $(".detail").toggle();
    });

    // card 이펙트
    $(".card").hover(function () {
        $(this).children("span").slideDown(500);
    }, function () {
        $(this).children("span").slideUp(500);
    });

    // 이미지 업로드
    $(".cloth-box").click(function (e) {
        if (e.target.nodeName != "INPUT") return;
        $(".cloth-input").change(function (e) {
            $(this).toggle();
            let img = $(this).siblings("img")
            let reader = new FileReader();
            reader.onload = function (e) {
                img.attr("src", e.target.result);
            }
            reader.readAsDataURL(this.files[0]);
            $(this).siblings(".fa-times").toggle();
        });
    });


    // 이미지 삭제
    $(".cloth-box .fa-times").click(function () {
        $(this).toggle();
        $(this).siblings("img").attr("src", "");
        $(this).siblings(".cloth-input").remove();
        $("<input class='cloth-input' type='file'>").appendTo($(this).parents(".cloth-box"));
    });

    // detail - hover
    $(".detail i, .detail li").hover(function () {
        $(this).css("color", subTitleColor)
    }, function () {
        $(this).css("color", "#292929")
    });

    // submit
    $("button[type='submit']").click(function () {
        alert(1);

    });


});