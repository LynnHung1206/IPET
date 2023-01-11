package com.web.news.model.entity;

import java.sql.Date;

public class News implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String title;
	private String text;
	private Date time;
	public News() {}
	
	public News(Integer id, String title, String text, Date time) {
		super();
		this.id = id;
		this.title = title;
		this.text = text;
		this.time = time;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	

	
}
