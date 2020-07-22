package com.moa.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moa.web.dao.ClothDao;
import com.moa.web.entity.Cloth;

@Service
public class ClothService {

	@Autowired
	ClothDao clothDao;

	public List<Cloth> getClothList(String uid, String category, int page) {

		int size = 6;
		int offset = (page - 1) * size;

		return clothDao.getClothList(uid, category, offset, size);

	}

	public void delCloth(String id, String category) {

		clothDao.delCloth(id, category);
	}

	public void regClothList(String uid, String category, String img) {

		clothDao.regCloth(uid, category, img);
	}

}
