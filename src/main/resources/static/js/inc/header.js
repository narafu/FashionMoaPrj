$(window).load(function() {
		
	var nickname = ${result}.response.nickname;
		
	if(nickname == null){
	console.log("닉네임 null,로그인 필요");
	$(".btn-logout").hide();

		}else{
	console.log("로그인 완료");
	$(".btn-login").hide();
			}
 });