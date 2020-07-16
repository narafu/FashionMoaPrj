$(function () {

    // detail toggle
    $(".card").click(function (e) {
        let subTitle = $(e.target).siblings("span").text();
        let subTitleColor = $(e.target).parents("li").css("background-color");
        $(".detail .sub-title").text(subTitle);
        $(".detail .sub-title").css("background-color", subTitleColor);
        $(".detail").toggle(500)
    });

    // detail 나가기
    let times = $(".fa-times");
    times.click(function () {
        $(".detail").toggle(500);
    });

    // card 이펙트
    $(".card").mouseenter(function (e) {
        $(e.target).children("span").slideDown(500);
    });
    $(".card").mouseleave(function (e) {
        $(e.target).children("span").slideUp(500);
    });

    // 이미지 업로드
    $(".cloth-input").change(function (e) {
        $(this).toggle();
        let reader = new FileReader();
        reader.onload = e => {
            $(".cloth-img").attr("src", e.target.result);
        }
        reader.readAsDataURL(this.files[0]);
        $(this).siblings(".fa-times").toggle();
    });

});