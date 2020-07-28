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
	
//	@Autowired
//	private StyleFeedback sf;

	public List<StyleFeedbackView> getList(int page, String query, String field){
		
		int offset = (page-1)*10;
		int size = 10;
		
		return sfDao.getList(offset, size, query, field);
	}
	
	public StyleFeedback get(int id) {
		
		return sfDao.get(id);
	}
	
	public int insert(String title, int writerId, String content, String img) {
		
		
		
//		sf.setTitle(title);
//		sf.setWriterId(writerId);
//		sf.setContent(content);
//		sf.setImg(img);i
//		System.out.println(img);
//		System.out.printf("제목 : %s, 작성자 : %d, 내용 : %s\n", title, writerId, content);
		
		return sfDao.insert(title, writerId, content, img);
	}
	
	public int delete(int id) {
		
		return sfDao.delete(id);
	}

	
}
