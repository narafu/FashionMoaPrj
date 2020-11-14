package com.moa.web.controller.board;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.moa.web.dao.FreeBoardDao;
import com.moa.web.entity.FreeBoard;
import com.moa.web.entity.FreeBoardComment;
import com.moa.web.service.FreeBoardService;
import com.moa.web.view.FreeBoardView;

@Controller
@RequestMapping("/board/free")
public class FreeBoardController {

	@Autowired
	private FreeBoardService fbdService;
	private String apiResult = null;
	
	private FreeBoard freeBoard;
	private FreeBoardComment fbdCmt;

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
	
	  @RequestMapping(value="/detail/{id}",method={RequestMethod.GET, RequestMethod.POST}) 
	    private String boardDetail(@PathVariable("id") int id,FreeBoard freeboard, Model model) throws Exception{
			
			//List<BoardCmt> cmt= null;
			
	        model.addAttribute("detail", fbdService.detail(id));
	     //   model.addAttribute("r", freeBoard);
	        model.addAttribute("fbdCmt", new FreeBoardComment());
	       
	        //model.addAttribute("cmt", cmt);
	        fbdService.hit(id);
	        return "board.free.detail";
	    }
/*
	@GetMapping("/reg")
	public String reg(Model model) {
		
		return "board.free.reg";
	}
*/	  
	@GetMapping("/reg")
	public String reg(HttpSession session,Model model) {
		
		session.getAttribute(apiResult);
		model.getAttribute("result");
	      model.addAttribute("r", freeBoard);
		return "board.free.reg";
	}

	@PostMapping("/reg")
	public String reg(FreeBoard freeBoard
		//	@RequestParam("title")String title,
		//	@RequestParam("content")String content,
			//@RequestParam("nickname")String nickname,
			,HttpServletRequest request
			,@RequestParam("files")MultipartFile[] files,Model model
			) throws IOException{ 
		
		System.out.println("reg작동");
		String path = request.getServletContext().getRealPath("/upload/");
		
		/*
		 //one file
		File file1= new File(path);
		if(!file1.exists())
				file1.mkdir();
				
		path += files.getOriginalFilename();
		System.out.println("파일네임붙은 경로"+path);
		FileOutputStream os = new FileOutputStream(path);
		InputStream is = files.getInputStream();
		byte[] buf = new byte[1024];
		int len = 1024;
		while ((len = is.read(buf)) != -1)
			os.write(buf, 0, len);
		is.close();
		os.close();
		*/
	
		for(int i = 0; i<files.length; i++) {
		
			if(files[i].getOriginalFilename().equals("")) {
				System.out.println("파일이 없습니다");
				continue;
			}
				
		File file1= new File(path);
		if(!file1.exists())
				file1.mkdir();
		
		System.out.println("파일이름="+files[i].getOriginalFilename());
	
		path += files[i].getOriginalFilename();
		System.out.println("파일네임붙은 경로="+path);
		FileOutputStream os = new FileOutputStream(path);
		
		InputStream is = files[i].getInputStream();
		byte[] buf = new byte[1024];
		int len = 1024;
		while ((len = is.read(buf)) != -1)
			os.write(buf, 0, len);
		
		freeBoard.setFile(path);
		is.close();
		os.close();
		}
		
		fbdService.reg(freeBoard);
		System.out.println(freeBoard);
		return "redirect:list";
		}
		
	@GetMapping("/edit/{id}")
	public String edit(FreeBoard freeBoard,@PathVariable("id") int id, Model model) {
		model.addAttribute("detail", fbdService.detail(id));
        model.addAttribute("r", freeBoard);
		return "board.free.edit";
	}
	
	@PostMapping("/edit/{id}")
	public String edit(FreeBoard freeBoard) throws Exception {
		fbdService.edit(freeBoard);
		System.out.println(freeBoard);
		return "redirect:../detail/"+freeBoard.getId();
	}
	
    @GetMapping("/delete/{id}")
    private String delete(FreeBoard freeBoard) throws Exception{
        fbdService.delete(freeBoard);
        return "redirect:/board/free/list";
    }

}
