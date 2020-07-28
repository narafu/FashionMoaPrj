package com.moa.web.controller.board;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.moa.web.NaverLoginBO;
import com.moa.web.dao.FreeBoardDao;
import com.moa.web.entity.FreeBoard;
import com.moa.web.service.FreeBoardService;
import com.moa.web.view.FreeBoardView;

@Controller
@RequestMapping("/board/free")
public class FreeController {

	
	@Autowired
	private FreeBoardService fbdService;
	private FreeBoard freeBoard;
	private NaverLoginBO naverLoginBO;
	
	@GetMapping("/list")
	public String list(@RequestParam(name = "p", defaultValue = "1") int page,
			@RequestParam(name = "q", defaultValue = "") String query,
			@RequestParam(name = "f", defaultValue = "title") String field, Model model
			//,Object count
			)
			throws ClassNotFoundException, SQLException {
		
		int count = 0;
		List<FreeBoardView> list = fbdService.getList(page,query,field);
		count = fbdService.getNoticeCount(field,query);
		
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		//model.addAttribute("count", count);
	
		return "board.free.list";
	}
	
	  @GetMapping("/detail/{id}") 
	    private String boardDetail(@PathVariable int id, Model model) throws Exception{
			
			//List<BoardCmt> cmt= null;
			
	        model.addAttribute("detail", fbdService.detail(id));
	        model.addAttribute("r", freeBoard);
	        //model.addAttribute("cmt", cmt);
	        return "board.free.detail";
	    }

	@GetMapping("/reg")
	public String reg() {

		return "board.free.reg";
	}
	
	

	@PostMapping("/reg")
	public String reg(FreeBoard freeBoard, MultipartFile[] file, HttpServletRequest request, Principal principal
			,Model model)
			throws IOException {
		
	
		fbdService.reg(freeBoard);
		//model.addAttribute("r", freeBoard);
		System.out.println(freeBoard);

		return "redirect:list";
	}
	
	
    @GetMapping("/delete/{id}")
    private String delete(FreeBoard freeBoard) throws Exception{
        
        fbdService.delete(freeBoard);
        
        return "redirect:/board/free/list";
    }


/*	
	@GetMapping("/delete/{id}")
	public String delete(HttpServletRequest request) {
		logger.info("delete()");
		
		FreeBoardDao dao = sqlSession.getMapper(FreeBoardDao.class);
		dao.delete(Integer.parseInt(request.getParameter("id")));
		
		return "redirect:list";
	}
	*/
	
	
	
	/*
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable int id, Model model) throws Exception{
		
		//FreeBoard bd=null;
		//List<BoardCmt> cmt= null;
		
		model.addAttribute("r", freeBoard);
        model.addAttribute("delete", fbdService.delete(id));
		return "redirect:/list";
	}
	*/
	@GetMapping("/edit/{id}")
	public String edit() {
		
	}
	
	@PostMapping("/edit/{id}")
	public String edit() {
		
	}
}
