package com.moa.web.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.moa.web.service.ClothService;

@Controller
@RequestMapping("/member/mycloset/")
public class MyClosetController {
	
	@Autowired
	ClothService clothService;

	@GetMapping("list")
	public String mypage() {
		
		return "member/mycloset/list";
	}
	
	@RequestMapping("reg")
	public String reg() {
		
//		clothService.insertOuter();
		
		return "redirect:list";
	}
	
	@RequestMapping("del")
	public String del() {
		
//		clothService.insertOuter();
		
		return "redirect:list";
	}
	
}
