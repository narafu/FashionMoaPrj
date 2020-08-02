package com.moa.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moa.web.dao.StyleFeedbackCommentDao;
import com.moa.web.entity.StyleFeedbackComment;

@Service
public class StyleFeedbackCommentService {

	@Autowired
	private StyleFeedbackCommentDao sfCmtDao;
	
	public List<StyleFeedbackComment> getComment(int id) {
		
//		System.out.println("id : " + id);
		return sfCmtDao.getComment(id);
	}
	
	public int insert(String writerId, String content, int boardId) {
		System.out.printf("boardId : %d, writerId : %s, content : %s\n", boardId, writerId, content);
		
		return sfCmtDao.insert(writerId, content, boardId);
	}

	public int delete(int id) {

		return sfCmtDao.delete(id);
		
	}



	
}
