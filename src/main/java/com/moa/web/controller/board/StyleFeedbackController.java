package com.moa.web.controller.board;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/board/styleFeedback/")
public class StyleFeedbackController {

	@GetMapping("list")
	public String list(
			@RequestParam(name = "p", defaultValue = "1") int page, 
			@RequestParam(name = "q", defaultValue = "title") String query, 
			@RequestParam(name = "f", defaultValue = "") String field) {
		
		int size = page*10;
		

		return "board.styleFeedback.list";
	}

	@GetMapping("detail")
	public String detail() {

		return "board.styleFeedback.detail";
	}
	
	@GetMapping("reg")
	public String reg(Model model) {
		
		SimpleDateFormat temp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String regdate = temp.format(time);

		model.addAttribute("regdate", regdate);

		return "board.styleFeedback.reg";
	}
	
	@PostMapping("reg")
	public String reg() {
		
				

		return "redirect:list";
	}
	
	

}
