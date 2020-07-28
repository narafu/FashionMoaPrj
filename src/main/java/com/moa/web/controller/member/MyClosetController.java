package com.moa.web.controller.member;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.Iterator;

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
@RequestMapping("/member/mycloset/")
public class MyClosetController {

	@Autowired
	MyClothService clothService;

	@GetMapping("list")
	public String list(Principal principal, Model model) {

//		String uid = principal.getName(); /* 사용자가 입력한 아이디를 받아옴!! */
		String uid = "test";

		CntCloth cntCloth = clothService.getCount(uid);
		model.addAttribute("cntCloth", cntCloth);

		return "member/mycloset/list";
	}

	@PostMapping("reg")
	public String reg(@RequestParam(name = "c", defaultValue = "Outer") String category,
			MultipartHttpServletRequest multi, Principal principal) {

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

			try {

				mFile.transferTo(new File(path + fileName));

			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
//			String uid = principal.getName(); /* 사용자가 입력한 아이디를 받아옴!! */
			String uid = "test";
			String img = "/upload/" + fileName;
			clothService.regClothList(uid, category, img);

		}

		return "redirect:list";
	}

}
