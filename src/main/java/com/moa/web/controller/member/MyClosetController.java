package com.moa.web.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.moa.web.service.MemberService;

@Controller
@RequestMapping("/member/mycloset/")
public class MyClosetController {
	
	@Autowired
	MemberService memberService;

	@GetMapping("list")
	public String mypage() {
		
		return "member/mycloset/list";
	}
	
	@PostMapping("reg")
	public String reg() {
		
		memberService.insertOuter();
		
		return "";
	}
	
}
