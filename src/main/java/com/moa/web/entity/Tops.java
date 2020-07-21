package com.moa.web.entity;

public class Tops {

	private int id;
	private String uid;
	private String img;

	public Tops() {
		// TODO Auto-generated constructor stub
	}

	public Tops(int id, String uid, String img) {
		super();
		this.id = id;
		this.uid = uid;
		this.img = img;
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

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Override
	public String toString() {
		return "Tops [id=" + id + ", uid=" + uid + ", img=" + img + "]";
	}

}
