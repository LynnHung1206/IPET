package com.web.admin.model.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "staff_admin_per_func", catalog = "ipetdb")
public class AdminFunc implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	@Column(name = "ID")
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name = "NAME")
	private String name;

	public AdminFunc() {
	}

	public AdminFunc(Integer id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public Integer getAdminID() {
		return id;
	}

	public void setAdminID(Integer id) {
		this.id = id;
	}

	public String getAdminName() {
		return name;
	}

	public void setAdminName(String name) {
		this.name = name;
	}

}
