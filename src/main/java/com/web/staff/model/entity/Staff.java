package com.web.staff.model.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.core.model.entities.Core;
@Entity
@Table(name = "Staff", catalog = "ipetdb")
public class Staff extends Core {
	

	private static final long serialVersionUID = 1L;
	@Column(name = "ID")
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name = "SNAME")
	private String name;
	@Column(name = "UID")
	private String uid;
	@Column(name = "BTH")
	private Date bth;
	@Column(name = "SEX")
	private String sex;
	@Column(name = "EMAIL")
	private String email;
	@Column(name = "PHONE")
	private String phone;
	@Column(name = "TEL")
	private String tel;
	@Column(name = "ADDR")
	private String add;
	@Column(name = "AC")
	private String ac;
	@Column(name = "PW")
	private String pw;
	@Column(name = "STATUS",insertable = false)
	private Integer status;
	@Column(name = "POSI")
	private String posi;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public Date getBth() {
		return bth;
	}
	public void setBth(Date bth) {
		this.bth = bth;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAdd() {
		return add;
	}
	public void setAdd(String add) {
		this.add = add;
	}
	public String getAc() {
		return ac;
	}
	public void setAc(String ac) {
		this.ac = ac;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getPosi() {
		return posi;
	}
	public void setPosi(String posi) {
		this.posi = posi;
	}
	
	@Override
	public String toString() {
		return "Staff [id=" + id + ", name=" + name + ", uid=" + uid + ", bth=" + bth + ", sex=" + sex + ", email="
				+ email + ", phone=" + phone + ", tel=" + tel + ", add=" + add + ", ac=" + ac + ", pw=" + pw
				+ ", status=" + status + ", posi=" + posi + "]";
	}
	
	
}
