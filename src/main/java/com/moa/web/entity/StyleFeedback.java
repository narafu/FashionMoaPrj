package com.moa.web.entity;

import java.util.Date;

public class StyleFeedback {
	
	private int id;
	private String title;
	private int writerId;
	private String content;
	private Date regdate;
	private int hit;
	private String files;
	
	public StyleFeedback() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getWriterId() {
		return writerId;
	}

	public void setWriterId(int writerId) {
		this.writerId = writerId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getFiles() {
		return files;
	}

	public void setFiles(String files) {
		this.files = files;
	}

	@Override
	public String toString() {
		return "StyleFeedback [id=" + id + ", title=" + title + ", writerId=" + writerId + ", content=" + content
				+ ", regdate=" + regdate + ", hit=" + hit + ", files=" + files + "]";
	}
	
}
