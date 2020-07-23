package com.moa.web.view;

import java.util.Date;

import com.moa.web.entity.FreeBoard;

public class FreeBoardView extends FreeBoard {
	private int cmtCount;
	
	public FreeBoardView() {
		// TODO Auto-generated constructor stub
	}
	
	public FreeBoardView(int id,String title, String nickname, Date regDate, int hit
			,int likes, String img, int cmtCount) {
		super(id,title,null,nickname,regDate,hit,likes,img);
		
		this.cmtCount = cmtCount;
	}
	
	public int getCmtCount() {
		return cmtCount;
	}

	public void setCmtCount(int cmtCount) {
		this.cmtCount = cmtCount;
	}

	@Override
	public String toString() {
		return "FreeBoardView [cmtCount=" + cmtCount + "]";
	}
	
	
}
