$(function () {

    let category;
    let subTitleColor;
    let currentPage;
    let lastPage;

    // card hover
    $(".card").hover(function () {
        $(this).children("span").slideDown(500);
    }, function () {
        $(this).children("span").slideUp(500);
    });

    // detail hover
    $(".detail i").hover(function () {
        $(this).css("color", subTitleColor)
    }, function () {
        $(this).css("color", "#292929")
    });

    // detail-cloth
    $(".card.cloth").click(function (e) {
        currentPage = 1;
        category = $(this).find("span").text();
        subTitleColor = $(this).css("background-color");
        $(".detail.cloth .sub-title").text(category);
        $(".detail.cloth .sub-title").css("background-color", subTitleColor);
        $(".detail.cloth").toggle(500);
        $.loadImg();
        $.loadPage();
    });

    // detail-register
    $(".card.register").click(function () {
        category = $(this).find("span").text();
        subTitleColor = $(this).css("background-color");
        $(".register .sub-title").text(category);
        $(".register .sub-title").css("background-color", subTitleColor);
        $(".detail.register").toggle(500);
        $.loadInput();
    });

    // detail exit
    $(".detail .exit").click(function (e) {
        $(".detail .pager ul").empty();
        $(".box-container").empty();
        $(this).parents(".detail").toggle(500);
    });

    // image preview
    $(".register .box-container").click(function (e) {
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

    // image upload cancel
    $(".detail-register .cloth-box .fa-times").click(function () {
        $(this).toggle();
        $(this).siblings("img").attr("src", "");
        $(this).siblings(".cloth-input").remove();
        $("<input class='cloth-input' type='file'>").appendTo($(this).parents(".cloth-box"));
    });

    // image del
    $(".box-container").click(function (e) {
        if (e.target.nodeName != "I") return;
        if (!(confirm("삭제하시겠습니까?"))) return;
        let imgId = $(this).find("img").attr("id");
        $.delImg(imgId);
    });

    // pager(num)
    $(".pager ul").click(function (e) {
        if (e.target.nodeName != "LI") return;
        currentPage = $(e.target).html();
        $.loadImg();
    })

    // pager(arrow)
    $(".pager .fa-arrow-left").click(function () {
        if (currentPage == 1) {
            alert('이전 페이지가 없습니다.');
        }
        else {
            currentPage--;
            $.loadImg();
        }
    })

    $(".pager .fa-arrow-right").click(function () {
        if (currentPage == lastPage) {
            alert('다음 페이지가 없습니다.');
        }
        else {
            currentPage++;
            $.loadImg();
        }
    })

    // image load
    $.loadImg = function () {
        $(".pager ul li").css("color", "#292929");
        $(`.pager ul li:eq(${currentPage - 1})`).css("color", subTitleColor);
        $.ajax({
            type: "get",
            url: "/api/member/mycloset/list-ajax",
            data: { "c": category, "p": currentPage },
            dataType: "json",
            success: function (list) {
                $(".cloth .box-container").empty();
                for (let i in list) {
                    $(".cloth .box-container").append(`
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
    };

    // input load
    $.loadInput = function () {
        for (let i = 0; i < 6; i++) {
            $(".register .box-container").append(`
                    <div class="cloth-box flex-center">
                    <i class="fas fa-times fa"></i>
                    <img src="">
                    <input type="file" name=file${i + 1}>
                </div>`);
        }
    };

    // image del
    $.delImg = function (imgId) {
        $.ajax({
            type: "post",
            url: "/api/member/mycloset/del",
            data: {
                "id": imgId,
                "c": category,
                "p": currentPage
            },
            success: function (list) {
                alert("삭제되었습니다.");
                $.loadImg();
            }
        });
    };

    // page load
    $.loadPage = function () {
        let size = 6;
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
                lastPage = Math.ceil(cntCategory / size);
                for (let i = 0; i < lastPage; i++) {
                    $(".pager ul").append(`<li>${i + 1}</li>`)
                }
                $(".pager ul li:first").css("color", subTitleColor);
            }
        });
    };

    // image upload
    $("form[action='reg']").submit(function (e) {
        e.preventDefault();

        let formData = new FormData($("form[action='reg']")[0]);
        $.ajax({
            type: "post",
            enctype: 'multipart/form-data',
            url: "/member/mycloset/reg",
            data: formData,
            processData: false,
            contentType: false,
            cache: false,
            success: function () {
                alert("ok");
            }
        });
    });

});