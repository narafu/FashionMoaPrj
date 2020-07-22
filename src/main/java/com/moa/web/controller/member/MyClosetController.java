package com.moa.web.controller.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public List<Cloth> listAjax(
			@RequestParam(name = "c", defaultValue = "Outers") String category,
			@RequestParam(name = "p", defaultValue = "1") int page) {

//		String uid = principal.getName(); /* 사용자가 입력한 아이디를 받아옴!! */
		String uid = "test";

		List<Cloth> list = clothService.getClothList(category, uid, page);

		return list;
	}

	@GetMapping("reg")
	public String reg(@RequestBody Cloth cloth) {

		return "redirect:list";
	}

	@ResponseBody
	@PostMapping("del")
	public List<Cloth> del(
			@RequestParam(name = "c", defaultValue = "Outers") String category,
			@RequestParam(name = "id") String id,
			@RequestParam(name = "p", defaultValue = "1") int page) {

//		String uid = principal.getName(); /* 사용자가 입력한 아이디를 받아옴!! */
		String uid = "test";

		clothService.delCloth(category, uid, id);
		List<Cloth> list = clothService.getClothList(category, uid, page);

		return list;
	}

}
