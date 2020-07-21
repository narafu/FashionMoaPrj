$(function () {

    let subTitle;
    let subTitleColor;

    // card 이펙트
    $(".card").hover(function () {
        $(this).children("span").slideDown(500);
    }, function () {
        $(this).children("span").slideUp(500);
    });

    // detail toggle
    $(".card").click(function (e) {
        subTitle = $(this).find("span").text();
        subTitleColor = $(this).css("background-color");
        if ($(this).hasClass("register")) {
            $(".register .sub-title").text(subTitle);
            $(".register .sub-title").css("background-color", subTitleColor);
            $(".detail.register").toggle(500);
        }
        else {
            $(".cloth .sub-title").text(subTitle);
            $(".cloth .sub-title").css("background-color", subTitleColor);
            $(".detail.cloth").toggle(500);
        }
    });

    // detail 나가기
    $(".detail button .fa-times").click(function () {
        $(e.target).toggle();
    });

        // detail - hover
        $(".detail i, .detail li").hover(function () {
            $(this).css("color", subTitleColor)
        }, function () {
            $(this).css("color", "#292929")
        });
    

    // 이미지 업로드
    $(".detail-register .cloth-box").click(function (e) {
        if (e.target.nodeName != "INPUT") return;
        $(e.target).change(function (e) {
            let img = $(this).siblings("img")
            let reader = new FileReader();
            reader.onload = function (e) {
                img.attr("src", e.target.result);
            }
            reader.readAsDataURL(this.files[0]);
            console.log(3);
            $(this).toggle();
            $(this).siblings(".fa-times").toggle();
        });
    });

    // 이미지 업로드 취소
    $(".detail-register .cloth-box .fa-times").click(function () {
        $(this).toggle();
        $(this).siblings("img").attr("src", "");
        $(this).siblings(".cloth-input").remove();
        $("<input class='cloth-input' type='file'>").appendTo($(this).parents(".cloth-box"));
    });

    // 이미지 삭제
    $(".detail-cloth .cloth-box .fa-times").click(function () {
        if (confirm("삭제하시겠습니까?")) {
            $(this).toggle();
        }
    });

});