$(() => {

    // detail toggle
    let subTitle;
    let subTitleColor;
    $(".card").click(function (e) {
        if (e.target.nodeName == "I") {
            subTitle = $(this).siblings("span").text();
        }
        else if (e.target.nodeName == "SPAN") {
            subTitle = $(this).text();
        }
        else
            subTitle = $(this).find("span").text();
        subTitleColor = $(this).parents("li").css("background-color");
        $(".detail .sub-title").text(subTitle);
        $(".detail .sub-title").css("background-color", subTitleColor);
        $(".detail").toggle(500)
    });

    // detail 나가기
    $(".detail button .fa-times").click(() => {
        $(".detail").toggle();
    });

    // card 이펙트
    $(".card").hover(function (e) {
        $(this).children("span").slideDown(500);
    }, e => {
        $(this).children("span").slideUp(500);
    });

    // 이미지 업로드
    $(".cloth-input").change(function (e) {
        $(this).toggle();
        let img = $(this).siblings("img")
        let reader = new FileReader();
        reader.onload = e => {
            img.attr("src", e.target.result);
        }
        reader.readAsDataURL(this.files[0]);
        $(this).siblings(".fa-times").toggle();
    });

    // 이미지 삭제
    $(".cloth-box .fa-times").click(function (e) {
        $(this).toggle();
        $(this).siblings("img").attr("src", "");
        $(this).siblings(".cloth-input").remove();
        $("<input class='cloth-input' type='file'>").appendTo($(this).parents(".cloth-box"));
    });

    // detail - hover
    $(".detail i, .detail li").hover(function () {
        $(this).css("color", subTitleColor)
    }, () => {
        $(this).css("color", "#292929")
    });

});