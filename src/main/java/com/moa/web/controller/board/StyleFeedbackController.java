package com.moa.web.controller.board;

import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moa.web.entity.StyleFeedback;
import com.moa.web.entity.StyleFeedbackView;
import com.moa.web.service.StyleFeedbackService;

@Controller
@RequestMapping("/board/styleFeedback/")
public class StyleFeedbackController {
	
	@Autowired
	private StyleFeedbackService sfService;
	private StyleFeedback sf;
	
//	@Autowired

	@GetMapping("list")
	public String list(
			@RequestParam(name = "p", defaultValue = "1") int page, 
			@RequestParam(name = "q", defaultValue = "") String query, 
			@RequestParam(name = "f", defaultValue = "title") String field, 
			Model model) {
		
		List<StyleFeedbackView> list = sfService.getList(page, query, field);
		
		model.addAttribute("list", list);
		
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
	public String reg(
			@RequestParam("title") String title, 
			@RequestParam("writerId") int writerId,
			@RequestParam("content") String content, 
			@RequestParam("img") String img) {
		
//		System.out.printf("제목 : %s, 작성자 : %d, 내용 : "title);
		
		
		sf.setTitle(title);
		sf.setWriterId(writerId);
		sf.setContent(content);
		sf.setImg(img);
		
		return "redirect:list";
	}
	
	

}
