package com.web.admin.model.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

@Entity
@IdClass(Admin.PK.class)
@Table(name = "staff_admin_per", catalog = "ipetdb")
public class Admin implements java.io.Serializable {

	public static class PK implements Serializable {
		
		private static final long serialVersionUID = 1L;
		@Id
		@Column(name = "ADMIN_PER_ID")
		public Integer adminID;
		@Id
		@Column(name = "STAFF_ID")
		public Integer staffID;
	
	}

	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "ADMIN_PER_ID")
	private Integer adminID;
	@Id
	@Column(name = "STAFF_ID")
	private Integer staffID;
	
	public Admin() {}

	public Admin(Integer adminID, Integer staffID) {
		super();
		this.adminID = adminID;
		this.staffID = staffID;
	}

	public Integer getAdminID() {
		return adminID;
	}

	public void setAdminID(Integer adminID) {
		this.adminID = adminID;
	}

	public Integer getStaffID() {
		return staffID;
	}

	public void setStaffID(Integer staffID) {
		this.staffID = staffID;
	}

}
