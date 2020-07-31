package com.moa.web.controller.member;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moa.web.service.MemberService;

@Controller("memberController")
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@RequestMapping("login")
	public String login(@RequestParam("code") String code, HttpSession session) {

		String access_Token = memberService.getAccessToken(code);
		HashMap<String, Object> userInfo = memberService.getUserInfo(access_Token);
		System.out.println("login Controller : " + userInfo);

		// 클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
		if (userInfo.get("email") != null) {
			session.setAttribute("userId", userInfo.get("email"));
			session.setAttribute("access_Token", access_Token);
		}

		return "home";
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {

		memberService.kakaoLogout((String) session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("userId");

		return "home";
	}

}
