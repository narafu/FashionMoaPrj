package com.moa.web.entity;

import java.util.Date;

public class Member {

	private int id;
	private String uid;
	private String password;
	private String email;
	private String nickname;
	private String gender;
	private Date regdate;

	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(int id, String uid, String password, String email, String nickname, String gender, Date regdate) {
		super();
		this.id = id;
		this.uid = uid;
		this.password = password;
		this.email = email;
		this.nickname = nickname;
		this.gender = gender;
		this.regdate = regdate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", uid=" + uid + ", password=" + password + ", email=" + email + ", nickname="
				+ nickname + ", gender=" + gender + ", regdate=" + regdate + "]";
	}

}
