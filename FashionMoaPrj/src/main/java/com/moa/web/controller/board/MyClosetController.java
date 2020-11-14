package com.moa.web.controller.board;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.moa.web.entity.CntCloth;
import com.moa.web.service.MyClothService;

@Controller("myClosetController")
@RequestMapping("/board/mycloset/")
public class MyClosetController {

	@Autowired
	private MyClothService clothService;

	@GetMapping("list")
	public String list(HttpSession session, Model model) {
		
		String uid = (String)session.getAttribute("userId");
		CntCloth cntCloth = clothService.getCount(uid);
		model.addAttribute("cntCloth", cntCloth);
		
		return "board.mycloset.list";
	}

	@PostMapping("reg")
	public String reg(@RequestParam(name = "c", defaultValue = "Outer") String category,
			MultipartHttpServletRequest multi, HttpSession session) {

		String uid = (String)session.getAttribute("userId");
		String path = multi.getServletContext().getRealPath("/upload/");
		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}

		Iterator<String> files = multi.getFileNames();

		while (files.hasNext()) {
			String uploadFile = files.next();
			MultipartFile mFile = multi.getFile(uploadFile);
			String fileName = mFile.getOriginalFilename();

			if (fileName.equals(""))
				continue;

			try {

				mFile.transferTo(new File(path + fileName));

			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			String img = "/upload/" + fileName;

			clothService.regClothList(uid, category, img);

		}

		return "redirect:list";
	}

}
