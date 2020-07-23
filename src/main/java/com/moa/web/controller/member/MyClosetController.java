package com.moa.web.controller.member;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.moa.web.entity.Cloth;
import com.moa.web.service.ClothService;

@Controller
@RequestMapping("/member/mycloset/")
public class MyClosetController {

	@Autowired
	ClothService clothService;

	@GetMapping("list")
	public String list() {

		return "member/mycloset/list";
	}

	@ResponseBody
	@GetMapping("list-ajax")
	public List<Cloth> listAjax(@RequestParam(name = "c", defaultValue = "Outers") String category,
			@RequestParam(name = "p", defaultValue = "1") int page, Principal principal) {

//		String uid = principal.getName(); /* 사용자가 입력한 아이디를 받아옴!! */
		String uid = "test";

		List<Cloth> list = clothService.getClothList(uid, category, page);

		return list;
	}

	@PostMapping("reg")
	public String reg(@RequestParam(name = "c", defaultValue = "Outer") String category,
			@RequestParam(name = "f") MultipartFile file, HttpServletRequest request, Principal principal)
			throws IOException {

//		String uid = principal.getName(); /* 사용자가 입력한 아이디를 받아옴!! */
		String uid = "test";
		String img = "\\upload\\" + file.getOriginalFilename();

		String path = request.getServletContext().getRealPath("/upload/"); /* 실제경로 */

		File file1 = new File(path);
		if (!file1.exists()) /* 존재하지 않다면 false */
			file1.mkdir(); /* file1 폴더를 만들어줌 */

		path += file.getOriginalFilename();

		/* 출력하기위한 output stream path에 출력함 */
		FileOutputStream os = new FileOutputStream(path);

		InputStream is = file.getInputStream();

		byte[] buf = new byte[1024];
		int len = 0;
		while ((len = is.read(buf)) != -1) // buf사이즈 만큼 read함 // is.read(buf) -> 다 못채웠으면 LEN만큼 반환함
			os.write(buf, 0, len);

		clothService.regClothList(uid, category, img);

		return "redirect:list";

	}

	@ResponseBody
	@PostMapping("del")
	public List<Cloth> del(@RequestParam(name = "c", defaultValue = "Outers") String category,
			@RequestParam(name = "id") String id, @RequestParam(name = "p", defaultValue = "1") int page,
			Principal principal) {

//		String uid = principal.getName(); /* 사용자가 입력한 아이디를 받아옴!! */
		String uid = "test";

		clothService.delCloth(id, category);
		List<Cloth> list = clothService.getClothList(uid, category, page);

		return list;
	}

}
