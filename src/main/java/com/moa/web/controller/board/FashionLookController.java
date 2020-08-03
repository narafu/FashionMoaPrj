package com.moa.web.controller.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board/fashionlook")
public class FashionLookController {

	@GetMapping("/list")
	public String list() {
		

		return "board.fashionlook.list";
	}
	


}
