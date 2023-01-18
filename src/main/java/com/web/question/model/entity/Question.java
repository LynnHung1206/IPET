package com.web.question.model.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.core.model.entities.Core;
@Entity
@Table(name = "Question", catalog = "ipetdb")
public class Question extends Core {
	
	private static final long serialVersionUID = 1L;
	@Column(name = "QUES_ID")
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer quesId;
	@Column(name = "QUES_TITLE")
	private String quesTitle;
	@Column(name = "QUES_TEXT")
	private String quesText;
	@Column(name = "QUES_TIME")
	private Timestamp quesTime;
	
	public Integer getQuesId() {
		return quesId;
	}
	public void setQuesId(Integer quesId) {
		this.quesId = quesId;
	}
	public String getQuesTitle() {
		return quesTitle;
	}
	public void setQuesTitle(String quesTitle) {
		this.quesTitle = quesTitle;
	}
	public String getQuesText() {
		return quesText;
	}
	public void setQuesText(String quesText) {
		this.quesText = quesText;
	}
	public Timestamp getQuesTime() {
		return quesTime;
	}
	public void setQuesTime(Timestamp quesTime) {
		this.quesTime = quesTime;
	}
	
}
