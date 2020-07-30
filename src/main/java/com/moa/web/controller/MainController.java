package com.moa.web.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/main")
public class MainController {

	@RequestMapping("")
	public String main() {
		
		return "메인페이지";
	}

}
