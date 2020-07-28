package com.moa.web.controller.api.member;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.moa.web.entity.Cloth;
import com.moa.web.entity.CntCloth;
import com.moa.web.service.MyClothService;

@RestController("apiMyClosetController")
@RequestMapping("/api/member/mycloset/")
public class MyClosetController {

	@Autowired
	MyClothService clothService;

	@GetMapping("list-ajax")
	public List<Cloth> listAjax(@RequestParam(name = "c", defaultValue = "Outers") String category,
			@RequestParam(name = "p", defaultValue = "1") int page, Model model, Principal principal) {

//		String uid = principal.getName(); /* 사용자가 입력한 아이디를 받아옴!! */
		String uid = "test";

		List<Cloth> list = clothService.getClothList(uid, category, page);
		CntCloth cntCloth = clothService.getCount(uid);

		return list;
	}

	@GetMapping("page-ajax")
	public CntCloth pageAjax(Principal principal) {

//		String uid = principal.getName(); /* 사용자가 입력한 아이디를 받아옴!! */
		String uid = "test";

		CntCloth cntCloth = clothService.getCount(uid);
		
		return cntCloth;
	}

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