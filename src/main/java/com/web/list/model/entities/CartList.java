package com.web.list.model.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "cart_list", catalog = "ipetdb")
public class CartList {

	@Id
	@Column(name = "MEM_ID")
	private Integer memID;
	@Column(name = "PROD_ID")
	private Integer prodID;

	public CartList() {

	}

	public Integer getMemID() {
		return memID;
	}

	public void setMemID(Integer memID) {
		this.memID = memID;
	}

	public Integer getProdID() {
		return prodID;
	}

	public void setProdID(Integer prodID) {
		this.prodID = prodID;
	}
}
