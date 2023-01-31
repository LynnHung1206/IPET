package com.web.member.model.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.core.model.entities.Core;

@Entity
@Table(name = "Member", catalog = "ipetdb")
public class Member extends Core{
	
	private static final long serialVersionUID = 1L;
	@Column(name = "MEM_ID")
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer memId;
	@Column(name = "MEM_NAME")
	private String memName;
	@Column(name = "MEM_UID")
	private String memUid;
	@Column(name = "MEM_BTH")
	private Date  memBth;
	@Column(name = "MEM_SEX")
	private String memSex;
	@Column(name = "MEM_EMAIL")
	private String memEmail;
	@Column(name = "MEM_PHONE")
	private String memPhone;
	@Column(name = "MEM_TEL")
	private String memTel;
	@Column(name = "MEM_ADD")
	private String memAdd;
	@Column(name = "MEM_AC")
	private String memAc;
	@Column(name = "MEM_PW")
	private String memPw;
	@Column(name = "MEM_STATUS",insertable = false)
	private Integer memStatus;
	
	
	
	public Integer getMemId() {
		return memId;
	}

	public void setMemId(Integer memId) {
		this.memId = memId;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemUid() {
		return memUid;
	}

	public void setMemUid(String memUid) {
		this.memUid = memUid;
	}

	public Date getMemBth() {
		return memBth;
	}

	public void setMemBth(Date memBth) {
		this.memBth = memBth;
	}

	public String getMemSex() {
		return memSex;
	}

	public void setMemSex(String memSex) {
		this.memSex = memSex;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public String getMemPhone() {
		return memPhone;
	}

	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}

	public String getMemTel() {
		return memTel;
	}

	public void setMemTel(String memTel) {
		this.memTel = memTel;
	}

	public String getMemAdd() {
		return memAdd;
	}

	public void setMemAdd(String memAdd) {
		this.memAdd = memAdd;
	}

	public String getMemAc() {
		return memAc;
	}

	public void setMemAc(String memAc) {
		this.memAc = memAc;
	}

	public String getMemPw() {
		return memPw;
	}

	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}

	public Integer getMemStatus() {
		return memStatus;
	}

	public void setMemStatus(Integer memStatus) {
		this.memStatus = memStatus;
	}
	
	@Override
	public String toString() {
		
		return "name="+memName+"/"+"uid="+memUid+"/"+"bth="+memBth+"/"+"sex="+memSex+"/"+"email="+memEmail+"/"
				+"phone="+memPhone+"/"+"tel="+memTel+"/"+"add="+memAdd+"/"+"ac="+memAc+"/"+"Pw="+memPw+"/"+"status="+memStatus;
	}
}
