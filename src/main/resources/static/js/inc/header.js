$(document).ready(function () {

	$(".member-menu .login").click(function (e) {

		e.preventDefault();

		$.ajax({
			type: "get",
			url: "/member/login/naver",
			success: function (naverAuthUrl) {

				$(".login-container").append(`<div class="login-form">
				<div>
					<i class="fas fa-times fa"></i>
				</div>
				<div class="login-title">
					<span>Fashion</span>
					<span>Moa</span>
				</div>
				<div>
					<div id="naver_id_login" style="text-align: center">
						<a href="${naverAuthUrl}"> <img src="/images/naver_login.png" />
						</a>
					</div>
					<div id="kakao_id_login" style="text-align: center">
						<a href="https://kauth.kakao.com/oauth/authorize?client_id=8558c78e78ed8ede0d79e788ed66f359&redirect_uri=http://localhost:8080/member/login/kakao&response_type=code">
							<img src="/images/kakao_login.png" />
						</a>
					</div>
				</div>
			</div>`);

				let loginContainerTop = (($("main").height() - $(".login-form").outerHeight()) / 2 + $(window).scrollTop()) - 50 + "px"
				let loginContainerLeft = (($("main").width() - $(".login-form").outerWidth()) / 2 + $(window).scrollLeft()) + "px"
				$(".login-form").css("top", loginContainerTop);
				$(".login-form").css("left", loginContainerLeft);

			}
		});

	});

	$(".login-container").click(function (e) {
		if (e.target.nodeName != "I") return;
		$(".login-form").remove();
	});

});