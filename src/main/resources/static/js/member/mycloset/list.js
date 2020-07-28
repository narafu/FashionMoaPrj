$(function () {

    let category;
    let subTitleColor;
    let currentPage;
    let lastPage;

    // card 이펙트
    $(".card").hover(function () {
        $(this).children("span").slideDown(500);
    }, function () {
        $(this).children("span").slideUp(500);
    });

    // detail - hover
    $(".detail i").hover(function () {
        $(this).css("color", subTitleColor)
    }, function () {
        $(this).css("color", "#292929")
    });

    // detail-cloth toggle
    $(".card.cloth").click(function (e) {
        currentPage = 1;
        category = $(this).find("span").text();
        subTitleColor = $(this).css("background-color");
        $(".detail.cloth .sub-title").text(category);
        $(".detail.cloth .sub-title").css("background-color", subTitleColor);
        $(".detail.cloth").toggle(500);

        // 이미지 load
        $.loadImg();

        // 페이저 load
        let offset = 6;
        $.ajax({
            type: "get",
            url: "/api/member/mycloset/page-ajax",
            data: "data",
            dataType: "json",
            success: function (result) {
                let cntCategory;
                switch (category) {
                    case "Outers":
                        cntCategory = result.cntOuters;
                        break;
                    case "Tops":
                        cntCategory = result.cntTops;
                        break;
                    case "Bottoms":
                        cntCategory = result.cntBottoms;
                        break;
                    case "Shoes":
                        cntCategory = result.cntShoes;
                        break;
                    case "Etc":
                        cntCategory = result.cntEtc;
                        break;
                }
                lastPage = Math.ceil(cntCategory / offset);
                for (let i = 0; i < lastPage; i++) {
                    $(".pager ul").append(`<li>${i + 1}</li>`)
                }
                $(".pager ul li:first").css("color", subTitleColor);
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
                    url: "/api/member/mycloset/reg",
                    data: formData,
                    processData: false,
                    contentType: false,
                    cache: false,
                    success: function () {
                    }
                });
            }
        };

        // 종료
        $(".detail .pager li").remove();
        $(this).parents(".detail").toggle(500);
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
                "p": currentPage
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

    // pager(num)
    $(".pager ul").click(function (e) {
        if (e.target.nodeName != "LI") return;
        currentPage = $(e.target).html();
        // 이미지 load
        $.loadImg();
    })

    // pager(arrow)
    $(".pager .fa-arrow-left").click(function () {
        if (currentPage == 1) {
            alert('이전 페이지가 없습니다.');
        }
        else {
            currentPage--;
            // 이미지 load
            $.loadImg();
        }
    })

    $(".pager .fa-arrow-right").click(function () {
        if (currentPage == lastPage) {
            alert('다음 페이지가 없습니다.');
        }
        else {
            currentPage++;
            // 이미지 load
            $.loadImg();
        }
    })

    // 이미지 load
    $.loadImg = function () {
        $(".pager ul li").css("color", "#292929");
        $(`.pager ul li:eq(${currentPage-1})`).css("color", subTitleColor);
        $.ajax({
            type: "get",
            url: "/api/member/mycloset/list-ajax",
            data: { "c": category, "p": currentPage },
            dataType: "json",
            success: function (list) {
                $(".box-container").empty();
                for (let i in list) {
                    $(".box-container").append(`
                        <div class="cloth-box flex-center">
                                <i class="fas fa-times fa"></i>
                                <img class="cloth-img" src="${list[i].img}" alt="">
                            </div>
                        `);
                    $(`.detail-cloth .cloth-box:eq(${i}) img`)
                        .attr("id", `${list[i].id}`);
                }
            }
        });
    }

});