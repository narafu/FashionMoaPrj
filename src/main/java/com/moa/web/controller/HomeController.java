package com.moa.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.moa.web.entity.FashionLook;
import com.moa.web.service.FashionLookService;
import com.moa.web.service.StyleFeedbackService;
import com.moa.web.view.StyleFeedbackView;

@Controller
@RequestMapping("/home")
public class HomeController {

	@Autowired
	private FashionLookService fashionLookService;
	@Autowired
	private StyleFeedbackService styleFeedbackService;

	@RequestMapping("")
	public String list(Model model) {

		List<FashionLook> fashionLookList = fashionLookService.getFashionLookMain();
		model.addAttribute("fashionLookList", fashionLookList);
		List<StyleFeedbackView> styleFeedBackList = styleFeedbackService.getStyleFeedbackMain();
		model.addAttribute("styleFeedBackList", styleFeedBackList);

		return "home";
	}

}
