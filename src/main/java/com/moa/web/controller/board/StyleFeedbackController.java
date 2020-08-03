package com.moa.web.controller.board;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.moa.web.entity.Cloth;
import com.moa.web.entity.StyleFeedback;
import com.moa.web.entity.StyleFeedbackComment;
import com.moa.web.service.MyClothService;
import com.moa.web.service.StyleFeedbackCommentService;
import com.moa.web.service.StyleFeedbackService;
import com.moa.web.view.StyleFeedbackView;

@Controller
@RequestMapping("/board/styleFeedback/")
public class StyleFeedbackController {
	
	@Autowired
	private StyleFeedbackService sfService;
	
	@Autowired
	private StyleFeedbackCommentService sfCmtService;
	
	@Autowired
	private	MyClothService cService;
	
	private StyleFeedback sf;
	private StyleFeedbackComment sfCmt;
	
	/* lsit 페이지 */
	@GetMapping("list")
	public String list(
			@RequestParam(name = "p", defaultValue = "1") int page, 
			@RequestParam(name = "q", defaultValue = "") String query, 
			@RequestParam(name = "f", defaultValue = "title") String field, 
			Model model) {
		
		List<StyleFeedbackView> list = sfService.getList(page, query, field);
		
		int count = 0;
		
		count = sfService.getCount(field, query);
		
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		
		return "board.styleFeedback.list";
	}
	
	/* detail 페이지 */
	@GetMapping("{id}")
	public String detail(
			@PathVariable("id") int id,
			Model model) {
		

		// detail 페이지
		sf = sfService.get(id);
		sfService.hitUpdate(id);
		model.addAttribute("d", sf);
		
		// regdate
		SimpleDateFormat temp = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date time = new Date();
		String regdate = temp.format(time);
		model.addAttribute("regdate", regdate);

		// 댓글 조회
		List<StyleFeedbackComment> comments = sfCmtService.getComment(id);
		model.addAttribute("comment", comments);
		
		// 옷장 조회
		String uid = sf.getWriterId();
		List<Cloth> outerList = cService.getOuterList(uid);
		model.addAttribute("outer", outerList);
		List<Cloth> topList = cService.getTopList(uid);
		model.addAttribute("top", topList);
		List<Cloth> bottomList = cService.getBottomList(uid);
		model.addAttribute("bottom", bottomList);
		List<Cloth> shoeList = cService.getShoeList(uid);
		model.addAttribute("shoe", shoeList);
		List<Cloth> etcList = cService.getEtcList(uid);
		model.addAttribute("etc", etcList);
		
		
		return "board.styleFeedback.detail";
	}
	
	@PostMapping("{id}")
	public String detail(
			@PathVariable("id") int boardId,
			@RequestParam("writerId") String writerId,
			@RequestParam("content") String content,
			Model model) {
		
		System.out.printf("boardId : %d, writerId : %s, content : %s\n", boardId, writerId, content);
		
		sfCmtService.insert(writerId, content, boardId);
		
		return "redirect:"+boardId;
	}
	
	/* reg 페이지 */
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
			@RequestParam("writerId") String writerId,
			@RequestParam("content") String content, 
			HttpServletRequest req,
			@RequestParam("img") MultipartFile mFile) {
		
		// 파일 경로
		String path = req.getServletContext().getRealPath("/upload/");
		
		File file = new File(path);
	    if (!file.exists()) /* 존재하지 않다면 false */
	    	file.mkdir(); /* file1 폴더를 만들어줌 */
		
		
//	    System.out.println("mFile : " + mFile);
	    
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
	
	/* delete 페이지 */
	@GetMapping("delete")
	public String delete(@RequestParam("id") int id) {
		
		sfService.delete(id);
		
		return "redirect:list";
	}
	
	/* 댓글 delete 페이지 */
	@GetMapping("cmtDelete")
	public String cmtDelete(
			@RequestParam("cmtId") int cmtId,
			@RequestParam("boardId") int boardId) {
		
		System.out.println("cmtId : " + cmtId);
		sfCmtService.delete(cmtId);
		
		return "redirect:" + boardId;
	}
	
	/* edit 페이지 */
	@GetMapping("edit")
	public String edit(
			@RequestParam("id") int id,
//			HttpServletRequest req,
//			@RequestParam("img") MultipartFile mFile,
			Model model) {
		sf = sfService.get(id);
		
		String img = sf.getImg();	// /upload/이미지이름.jpg
		String result = "";
		
		
		if(!img.equals(""))
			result = img.substring(8,img.length());	// /upload/ <- 8번째 부터 문자열 자름
		
		System.out.println("img : " + img);
		System.out.println("result : " + result);
		
		
//		model.addAttribute("img", img);
		
		model.addAttribute("e", sf);
		model.addAttribute("img", result);
		
		return "board.styleFeedback.edit";
	}
	
	@PostMapping("edit")
	public String edit(
			@RequestParam("title") String title, 
			@RequestParam("writerId") String writerId,
			@RequestParam("content") String content, 
			HttpServletRequest req,
			@RequestParam("img") MultipartFile mFile,
			Model model){
		
		// 파일 경로
		String path = req.getServletContext().getRealPath("/upload/");
		
		File file = new File(path);
	    if (!file.exists()) /* 존재하지 않다면 false */
	    	file.mkdir(); /* file1 폴더를 만들어줌 */
		
		
//		System.out.println("mFile : " + mFile);
	    
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
		
		int id = sf.getId();
		String img = "/upload/" + mFile.getOriginalFilename();
		
		sfService.edit(id, title, content, img);
		
		return "redirect:"+id;
	}
	
	
	
}
