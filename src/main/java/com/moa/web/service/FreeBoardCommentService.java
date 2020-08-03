package com.moa.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moa.web.dao.FreeBoardCommentDao;
import com.moa.web.entity.FreeBoardComment;

@Service
public class FreeBoardCommentService {

	@Autowired
	private FreeBoardCommentDao fbdCmtDao;

	public int insertCmt(FreeBoardComment freeBoardCmt) {
		return fbdCmtDao.insertCmt(freeBoardCmt);
	}

	public void editCmt(FreeBoardComment freeBoardCmt) {
		fbdCmtDao.editCmt(freeBoardCmt);
	}

	public void deleteCmt(FreeBoardComment freeBoardCmt) {
		fbdCmtDao.deleteCmt(freeBoardCmt);
	}

	public List<FreeBoardComment> cmtList(int bid) {
		return fbdCmtDao.cmtList(bid);
	}

	public int getNoticeCount(String field, String query) {
		return fbdCmtDao.getCmtCount(field, query);
	}

}
