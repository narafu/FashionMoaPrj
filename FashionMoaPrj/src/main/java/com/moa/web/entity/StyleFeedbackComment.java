package com.moa.web.entity;

public class StyleFeedbackComment {
	private int id;
	private String writerId;
	private String content;
	private String regdate;
	private int boardId;
	
	public StyleFeedbackComment(
			int id, 
			String writerId, 
			String content,
			String regdate) {
		// TODO Auto-generated constructor stub
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getWriterId() {
		return writerId;
	}
	
	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getRegdate() {
		return regdate;
	}
	
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	public int getBoardId() {
		return boardId;
	}
	
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	
	@Override
	public String toString() {
		return "StyleFeedbackComment [id=" + id + ", writerId=" + writerId + ", content=" + content + ", regdate="
				+ regdate + ", boardId=" + boardId + "]";
	}
	
	
}
