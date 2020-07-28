package com.moa.web.entity;

import java.util.Date;

public class FreeBoard {
	   private int id;
	   private String title;
	   private String content;
	   private int hit;
	   private Date regdate;
	   private String img;
	   private String nickname;
	   private int likes;
	   
	   public FreeBoard() {
		// TODO Auto-generated constructor stub
	}
	   
	 public FreeBoard( int id, String title, String content,String nickname, Date regdate, int hit, int likes, String img ) {
		this.id=id;
		this.title=title;
		this.content=content;
		this.nickname=nickname;
		this.regdate=regdate;
		this.hit=hit;
		this.likes=likes;
		this.img=img;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	@Override
	public String toString() {
		return "FreeBoard [id=" + id + ", title=" + title + ", content=" + content + ", hit=" + hit + ", regdate="
				+ regdate + ", img=" + img + ", nickname=" + nickname + ", likes=" + likes + "]";
	}
	   
	   
}
