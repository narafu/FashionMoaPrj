package com.moa.web.controller.api.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.moa.web.entity.Cloth;
import com.moa.web.entity.CntCloth;
import com.moa.web.service.MyClothService;

@RestController("apiMyClosetController")
@RequestMapping("/api/board/mycloset/")
public class MyClosetController {

	@Autowired
	MyClothService clothService;

	@GetMapping("list-ajax")
	public List<Cloth> listAjax(@RequestParam(name = "c", defaultValue = "Outers") String category,
			@RequestParam(name = "p", defaultValue = "1") int page, Model model,
			@RequestParam(name = "uid") String uid) {

		List<Cloth> list = clothService.getClothList(uid, category, page);
		CntCloth cntCloth = clothService.getCount(uid);
		
		return list;
	}

	@GetMapping("page-ajax")
	public CntCloth pageAjax(@RequestParam(name = "uid") String uid) {

		CntCloth cntCloth = clothService.getCount(uid);

		return cntCloth;
	}

	@PostMapping("del")
	public List<Cloth> del(@RequestParam(name = "c", defaultValue = "Outers") String category,
			@RequestParam(name = "id") String id, @RequestParam(name = "p", defaultValue = "1") int page,
			@RequestParam(name = "uid") String uid) {

		clothService.delCloth(id, category);
		List<Cloth> list = clothService.getClothList(uid, category, page);

		return list;
	}

}