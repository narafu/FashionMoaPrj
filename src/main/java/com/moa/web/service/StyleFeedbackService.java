package com.moa.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.moa.web.dao.StyleFeedbackDao;
import com.moa.web.entity.StyleFeedbackView;

@Service
public class StyleFeedbackService {

	@Autowired
	private StyleFeedbackDao sfDao;
	
	public List<StyleFeedbackView> getList(
			@RequestParam(name = "p", defaultValue = "1") int page, 
			@RequestParam(name = "q", defaultValue = "title") String query, 
			@RequestParam(name = "f", defaultValue = "") String field){
		
		int offset = (page-1)*10;
		int size = 10;
		
		return sfDao.getList(offset, size, query, field);
	}
}
