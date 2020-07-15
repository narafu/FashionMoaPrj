package com.moa.web.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/mycloset/")
public class MyClosetController {

	@GetMapping("list")
	public String mypage() {
		
		return "member/mycloset/list";
	}
	
}
