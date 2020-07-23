package com.moa.web.controller.board;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moa.web.service.FreeBoardService;
import com.moa.web.view.FreeBoardView;

@Controller
@RequestMapping("/board/free")
public class FreeController {

	@Autowired
	private FreeBoardService fbdService;
	
	@GetMapping("/list")
	public String list(@RequestParam(name = "p", defaultValue = "1") int page,
			@RequestParam(name = "q", defaultValue = "") String query,
			@RequestParam(name = "f", defaultValue = "title") String field, Model model
			//,Object count
			)
			throws ClassNotFoundException, SQLException {
		

		List<FreeBoardView> list = fbdService.getList(page,query,field);
		
		model.addAttribute("list", list);
		//model.addAttribute("count", count);
	
		return "board.free.list";
	}
	
	@GetMapping("/reg")
	public String reg() {

		return "board.free.reg";
	}


}
