package com.moa.web.entity;

public class StyleFeedbackView extends StyleFeedback{
	private String nickName;

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "StyleFeedbackView [nickName=" + nickName + "]";
	}
	
	
	
}
