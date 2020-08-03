package com.moa.web.controller.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.moa.web.entity.FashionLook;
import com.moa.web.service.FashionLookService;

@Controller
@RequestMapping("/board/fashionlook/")
public class FashionLookController {

	@Autowired
	private FashionLookService fashionlookService;

	@GetMapping("list")
	public String list(Model model) {

		List<FashionLook> list = fashionlookService.getList();
		model.addAttribute("list", list);

		return "board.fashionlook.list";
	}

	@ResponseBody
	@GetMapping("{id}")
	public FashionLook list(@PathVariable("id") int id, Model model) {

		FashionLook fashionLook = fashionlookService.getDetail(id);
		
		return fashionLook;
	}

}
