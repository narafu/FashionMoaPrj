$(function () {

    let category;
    let subTitleColor;

    // card 이펙트
    $(".card").hover(function () {
        $(this).children("span").slideDown(500);
    }, function () {
        $(this).children("span").slideUp(500);
    });

    // detail-cloth toggle
    $(".card.cloth").click(function (e) {
        category = $(this).find("span").text();
        subTitleColor = $(this).css("background-color");
        $.ajax({
            type: "post",
            url: "/member/mycloset/list-ajax",
            data: { "c": category },
            dataType: "json",
            success: function (list) {
                for (var i in list) {
                    $(`.detail-cloth .cloth-box:eq(${i}) img`)
                        .attr("src", `${list[i].img}`);
                }
            }
        });
        $(".cloth .sub-title").text(category);
        $(".cloth .sub-title").css("background-color", subTitleColor);
        $(".detail.cloth").toggle(500);
    });

    // detail-register
    $(".card.register").click(function (e) {
        category = $(this).find("span").text();
        subTitleColor = $(this).css("background-color");
        $(".register .sub-title").text(category);
        $(".register .sub-title").css("background-color", subTitleColor);
        $(".detail.register").toggle(500);
    });

    // detail 나가기 : 이미지 업로드 & 삭제
    $(".detail button .fa-times").click(function () {

        let imgSrc = $(this).siblings("img").attr("src");

        // 이미지 업로드
        if ($(this).parents(".detail").hasClass("cloth")) {
            console.log("reg")
            // $.ajax({
            //     type: "post",
            //     url: "/member/mycloset/reg",
            //     data: ?,
            //     success: function (response) {

            //     }
            // });
        }

        // 이미지 삭제
        else {
            console.log("del")
            $.ajax({
                type: "post",
                url: "/member/mycloset/del",
                data: { "img": imgSrc },
                success: function (response) {

                }
            });
        }

        // 종료
        $(e.target).toggle(500);
    });

    // detail - hover
    $(".detail i, .detail li").hover(function () {
        $(this).css("color", subTitleColor)
    }, function () {
        $(this).css("color", "#292929")
    });


    // 이미지 업로드: ui
    $(".detail-register .cloth-box").click(function (e) {
        if (e.target.nodeName != "INPUT") return;
        $(e.target).change(function (e) {
            let img = $(this).siblings("img")
            let reader = new FileReader();
            reader.onload = function (e) {
                img.attr("src", e.target.result);
            }
            reader.readAsDataURL(this.files[0]);
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
        if (!(confirm("삭제하시겠습니까?"))) return;
        $(this).siblings("img").attr("src", "");
        $(this).css("color", "#292929");
        let clothBox = $(this).siblings("img").parents(".cloth-box");
        let clothBoxClone = clothBox.clone();
        clothBox.remove();
        clothBoxClone.appendTo(".detail-cloth .box-container");
        $(this).toggle();
    });

});