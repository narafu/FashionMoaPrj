package com.moa.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moa.web.dao.FashionLookDao;
import com.moa.web.entity.FashionLook;

@Service
public class FashionLookService {
	
	@Autowired
	private FashionLookDao fashionLookDao;
	
	public List<FashionLook> getList() {
		int size = 9;
		return fashionLookDao.getList(size);
	}

	public FashionLook getDetail(int id) {
		
		return fashionLookDao.getDetail(id);
	}

	public List<FashionLook> getFashionLookMain() {
		int size = 12;
		return fashionLookDao.getFashionLookMain(size);
	}


}
