$(function () {

    let category;
    let subTitleColor;
    let page;

    // card 이펙트
    $(".card").hover(function () {
        $(this).children("span").slideDown(500);
    }, function () {
        $(this).children("span").slideUp(500);
    });

    // detail-cloth toggle
    $(".card.cloth").click(function (e) {
        page = 1;
        category = $(this).find("span").text();
        subTitleColor = $(this).css("background-color");
        $(".detail.cloth .sub-title").text(category);
        $(".detail.cloth .sub-title").css("background-color", subTitleColor);
        $(".detail.cloth").toggle(500);

        // 이미지 로드
        $.ajax({
            type: "get",	
            url: "/member/mycloset/list-ajax",
            data: { "c": category, "p": page },
            dataType: "json",
            success: function (list) {
                for (let i in list) {
                    $(`.detail-cloth .cloth-box:eq(${i}) img`)
                        .attr("src", `${list[i].img}`);
                    $(`.detail-cloth .cloth-box:eq(${i}) img`)
                        .attr("id", `${list[i].id}`);
                }
            }
        });
    });

    // detail-register
    $(".card.register").click(function () {
        category = $(this).find("span").text();
        subTitleColor = $(this).css("background-color");
        $(".register .sub-title").text(category);
        $(".register .sub-title").css("background-color", subTitleColor);
        $(".detail.register").toggle(500);
    });

    // detail 나가기 : 이미지 업로드
    $(".detail button").click(function (e) {
        e.preventDefault();
        // 이미지 업로드
        if ($(this).parents(".detail").hasClass("register")) {
            if (confirm("저장하시겠습니까?")) {
            let formData = new FormData($("form[action='reg']")[0]);
            $.ajax({
                type: "post",
                url: "/member/mycloset/reg",
                data: formData,
                processData: false,
                contentType: false,
                cache: false,
                success: function (response) {
                }
            });
            }
        };

        // 종료
        $(".detail img").attr("src", "");
        $(".detail img").attr("id", "");
        $(this).parents(".detail").toggle(500);
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
        $(e.target).change(function () {
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
        let imgId = $(this).siblings("img").attr("id");

        $.ajax({
            type: "post",
            url: "/member/mycloset/del",
            data: {
                "id": imgId,
                "c": category,
                "p": page
            },
            dataType: "json",
            success: function (list) {
                $(".detail img").attr("src", "");
                $(".detail img").attr("id", "");
                alert("삭제되었습니다.");
                for (var i in list) {
                    $(`.detail-cloth .cloth-box:eq(${i}) img`)
                        .attr("src", `${list[i].img}`);
                    $(`.detail-cloth .cloth-box:eq(${i}) img`)
                        .attr("id", `${list[i].id}`);
                }
            }
        });

    });

});