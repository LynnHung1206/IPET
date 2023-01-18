package com.web.product.model.entity;

import java.sql.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import com.core.model.entities.Core;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(catalog = "IPETDB", name = "product")
public class Product extends Core{

	private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PROD_ID")
	private Integer prodID;
	@Column(name = "PROD_NAME")
	private String prodName;
	@Column(name = "PROD_PRICE")
	private Integer prodPrice;
	@Column(name = "ADDED_TIME", insertable = false)
	private Date addedTime;
	@Column(name = "PROD_DESCRIPTION")
	private String prodDescription;
	@Column(name = "PROD_STATUS", insertable = false)
	private Integer prodStatus;
	@Column(name = "TYPE_ID")
	private Integer typeID;
	
	public Integer getProdID() {
		return prodID;
	}
	public void setProdID(Integer prodID) {
		this.prodID = prodID;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public Integer getProdPrice() {
		return prodPrice;
	}
	public void setProdPrice(Integer prodPrice) {
		this.prodPrice = prodPrice;
	}
	public Date getAddedTime() {
		return addedTime;
	}
	public void setAddedTime(Date addedTime) {
		this.addedTime = addedTime;
	}
	public String getProdDescription() {
		return prodDescription;
	}
	public void setProdDescription(String prodDescription) {
		this.prodDescription = prodDescription;
	}
	public Integer getProdStatus() {
		return prodStatus;
	}
	public void setProdStatus(Integer prodStatus) {
		this.prodStatus = prodStatus;
	}
	public Integer getTypeID() {
		return typeID;
	}
	public void setTypeID(Integer typeID) {
		this.typeID = typeID;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
