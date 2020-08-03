package com.moa.web.entity;

import java.util.Date;

public class FreeBoardComment {
	private int cid;
	private String nickname;
	private String content;
	private Date regdate;
	private int bid;
	
	public FreeBoardComment() {
		// TODO Auto-generated constructor stub
	}
	
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	@Override
	public String toString() {
		return "FreeBoardComment [cid=" + cid + ", nickname=" + nickname + ", content=" + content + ", regdate="
				+ regdate + ", bid=" + bid + "]";
	}
	
	
	
}
