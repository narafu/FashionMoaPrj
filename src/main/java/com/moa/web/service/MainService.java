package com.moa.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moa.web.dao.MainDao;
import com.moa.web.entity.FashionLook;
import com.moa.web.view.StyleFeedbackView;

@Service
public class MainService {
	
	@Autowired
	MainDao mainDao;

	public List<StyleFeedbackView> getStyleFeedback() {
		int size = 12;
		return mainDao.getStyleFeedback(size);
	}

	public List<FashionLook> getFashionLook() {
		int size = 12;
		return mainDao.getFashionLook(size);
	}
	
	

}
