package com.moa.web.controller.board;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board/video/")
public class VideoController {

	@GetMapping("list")
	public String list() {

		return "board.video.list";
	}

	@GetMapping("reg")
	public String reg(Model model) {
		
		SimpleDateFormat temp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String regdate = temp.format(time);

		model.addAttribute("regdate", regdate);

		return "board.video.reg";
	}
	
	@PostMapping("reg")
	public String reg() {
		
				

		return "redirect:list";
	}

}
