package com.moa.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moa.web.dao.StyleFeedbackDao;
import com.moa.web.entity.StyleFeedback;
import com.moa.web.entity.StyleFeedbackView;

@Service
public class StyleFeedbackService {

	@Autowired
	private StyleFeedbackDao sfDao;

	public List<StyleFeedbackView> getList(int page, String query, String field){
		
		int offset = (page-1)*9;
		int size = 9;
		
		return sfDao.getList(offset, size, query, field);
	}
	
	public StyleFeedback get(int id) {
		
		return sfDao.get(id);
	}
	
	public int insert(String title, String writerId, String content, String img) {
		
		return sfDao.insert(title, writerId, content, img);
	}
	
	public int delete(int id) {
		
		return sfDao.delete(id);
	}

	public int edit(int id, String title, String content, String img) {

		
		return sfDao.edit(id, title, content, img);
	}

	public int getCount(String field, String query) {

		return sfDao.getCount(field, query);
	}

	public int hitUpdate(int id) {

		return sfDao.hitUpdate(id);
	}
	
}
