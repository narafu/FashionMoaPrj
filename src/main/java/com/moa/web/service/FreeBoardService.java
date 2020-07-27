package com.moa.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moa.web.dao.FreeBoardDao;
import com.moa.web.entity.FreeBoard;
import com.moa.web.view.FreeBoardView;

@Service
public class FreeBoardService {

	@Autowired
	private FreeBoardDao fbdDao;
	
	public List<FreeBoardView> getList(int page, String query, String field) {
		int offset = (page-1)*10;
		int size=10;
		
		return fbdDao.getList(offset,size,query,field);
	}

	public int getNoticeCount(String field, String query) {
		return fbdDao.getBoardCount(field,query);
	}

	public Object detail(int id) {
		
		return fbdDao.detail(id);
	}

	public Object delete(int id) {
		
		return fbdDao.delete(id);
	}
	
	public void reg(FreeBoard freeBoard) {
		fbdDao.reg(freeBoard);
	}

	
}
