
$(".member-menu .login").click(function (e) {

	$(".login-form").toggle();

	$.ajax({
		type: "get",
		url: "/member/login/naver",
		success: function (naverAuthUrl) {

			$("#naver_id_login a").attr("href", naverAuthUrl);

		}
	});

});

$(".login-form").click(function (e) {
	if (e.target.nodeName != "I") return;
	$(this).toggle();
});

