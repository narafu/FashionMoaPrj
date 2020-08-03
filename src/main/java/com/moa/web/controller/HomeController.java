package com.moa.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.moa.web.entity.FashionLook;
import com.moa.web.service.MainService;
import com.moa.web.view.StyleFeedbackView;

@Controller
@RequestMapping("/home")
public class HomeController {

	@Autowired
	MainService mainService;

	@RequestMapping("")
	public String list(Model model) {

		List<FashionLook> fashionLookList = mainService.getFashionLook();
		List<StyleFeedbackView> styleFeedBackList = mainService.getStyleFeedback();
		model.addAttribute("fashionLookList", fashionLookList);
		model.addAttribute("styleFeedBackList", styleFeedBackList);

		return "home";
	}

}
