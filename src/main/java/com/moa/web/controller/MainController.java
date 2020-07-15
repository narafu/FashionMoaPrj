package com.moa.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class MainController {

	@GetMapping("")
	public String main() {
		System.out.println();
		System.out.println();
		return "main";
	} 

}
