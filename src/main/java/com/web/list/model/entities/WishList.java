package com.web.list.model.entities;

import javax.persistence.*;

@Entity
@Table(name = "wish_list", catalog = "ipetdb")
public class WishList {

	@Id
	@Column(name = "mem_id")
	private Integer memID;
	@Column(name = "prod_id")
	private Integer prodID;
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
	public WishList() {
		
	}
	public WishList(Integer memID, Integer prodID) {
		
		this.memID = memID;
		this.prodID = prodID;
	}
	
}
