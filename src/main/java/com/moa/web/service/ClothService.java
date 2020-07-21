package com.moa.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class ClothService {
	
	@Autowired
	ClothDao clothDao;

	public Object insertOuter() {
		return clothDao.insertCloth();
		
	}

	public void getList() {
		// TODO Auto-generated method stub
		
	}
	
	

}
