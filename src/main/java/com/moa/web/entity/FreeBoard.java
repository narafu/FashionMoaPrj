package com.moa.web.entity;

import java.util.Date;

public class FreeBoard {
	   private int id;
	   private String title;
	   private String content;
	   private int hit;
	   private Date regdate;
	   private String file;
	   private String email;
	   private String nickname;
	   private int likes;
	  
	   
	   public FreeBoard() {
		// TODO Auto-generated constructor stub
	}
	   
	 public FreeBoard( int id, String title, String content,String nickname,String email, Date regdate, int hit, int likes, String file ) {
		this.id=id;
		this.title=title;
		this.content=content;
		this.nickname=nickname;
		this.email=email;
		this.regdate=regdate;
		this.hit=hit;
		this.likes=likes;
		this.file=file;
	 }
	 
	 public FreeBoard( int id, String title, String content,String email, Date regdate, int hit, int likes, String file ) {
		this.id=id;
		this.title=title;
		this.content=content;
		this.nickname=email;
		this.regdate=regdate;
		this.hit=hit;
		this.likes=likes;
		this.file=file;
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
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "FreeBoard [id=" + id + ", title=" + title + ", content=" + content + ", hit=" + hit + ", regdate="
				+ regdate + ", file=" + file + ", email=" + email + ", nickname=" + nickname + ", likes=" + likes + "]";
	}
	

	   
}
