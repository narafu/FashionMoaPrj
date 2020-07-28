package com.moa.web.controller.board;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.moa.web.entity.StyleFeedbackView;
import com.moa.web.service.StyleFeedbackService;

@Controller
@RequestMapping("/board/styleFeedback/")
public class StyleFeedbackController {
	
	@Autowired
	private StyleFeedbackService sfService;
	
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
	public String detail(
			) {

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
			HttpServletRequest req,
			@RequestParam("img") MultipartFile mFile) {
		
		// 파일 경로
		String path = req.getServletContext().getRealPath("/upload/");
		
		File file = new File(path);
	    if (!file.exists()) /* 존재하지 않다면 false */
	    	file.mkdir(); /* file1 폴더를 만들어줌 */
		
		
	    String fileName = mFile.getOriginalFilename();
	    
			try {
				mFile.transferTo(new File(path + fileName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			
		String img = "/upload/" + mFile.getOriginalFilename();

//		System.out.println("1. img : " + img);
		
		if(fileName.equals("")) {	// equals() : 값, == : 주소
			img = null;
//			System.out.println("2. img : " + img);
		}

		sfService.insert(title, writerId, content, img);
		
		return "redirect:list";
	}
	
	@GetMapping("delete")
	public String delete(@RequestParam("id")int id) {
		
		sfService.delete(id);
		
		return "redirect:list";
	}
	
}
