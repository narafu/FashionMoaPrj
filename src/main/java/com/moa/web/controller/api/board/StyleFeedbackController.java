package com.moa.web.controller.api.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.moa.web.entity.StyleFeedback;
import com.moa.web.entity.StyleFeedbackComment;
import com.moa.web.service.StyleFeedbackService;

@RestController("apiStyleFeedback")	// jsp가 있으면 Controller, 없으면 RestController
@RequestMapping("/api/board/styleFeedback/")
public class StyleFeedbackController {
	
	@Autowired
	private StyleFeedbackService sfService;
	private StyleFeedback sf;
	private StyleFeedbackComment sfCmt;
	
	@GetMapping("{id}")
	public StyleFeedback detail(
			@PathVariable("id") int id,
			Model model) {
		
		sf = sfService.get(id);
		
		System.out.println("id" + id);
		
		model.addAttribute("d", sf);
		
		return sf; 
	}
	
	@PostMapping("{id}")
	public StyleFeedbackComment comment() {
		
		return sfCmt;
	}
	
	
}
